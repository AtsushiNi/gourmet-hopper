package org.javatraining.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.javatraining.entity.Community;
import org.javatraining.entity.Shop;
import org.javatraining.entity.Team;
import org.javatraining.service.ShopService;
import org.javatraining.service.TeamService;
import org.json.JSONArray;
import org.json.JSONObject;

// 一覧画面表示アクションクラス
public class ShopsWithTeamAction extends Action {
	private final ShopService shopService = new ShopService();
	private final TeamService teamService = new TeamService();

	@Override
    protected String processRequest(HttpServletRequest request) throws SQLException, NamingException {
        System.out.println("[ShopsWithTeamAction.java]: Start");

        // チームの情報をリクエストスコープに入れる
        int teamId = Integer.parseInt(request.getParameter("teamId"));
        Team team = teamService.find(teamId);
        request.setAttribute("team", team);
        
        // お店の検索
        String smallAreaCode = "X175";
        String shopName = request.getParameter("shopName");
        request.setAttribute("shopName", shopName);
        
    	//CommunityIdをsessionから取得
        HttpSession session = request.getSession(true);
    	Community community = (Community)session.getAttribute("community");
    	int communityId = community.getCommunityId();
    	System.out.println("[ShopDetailAction.java]:community.getCommunityId() "+ communityId);

        List<Shop> shops = null;
		try {
			shops = shopService.getShops(smallAreaCode,shopName, communityId);
		} catch (SQLException | NamingException | IOException | InterruptedException e) {
			e.printStackTrace();
		}

        // Shopオブジェクトの List をリクエストに設定
        request.setAttribute("shops", shops);
        
        // Shopオブジェクトの List をjson形式でリクエストに設定
        JSONArray jsonArray = new JSONArray();
        for(Shop shop : shops) {
        	JSONObject json = new JSONObject();
        	json.put("id", shop.getShopId());
        	json.put("name", shop.getName());
        	json.put("apiId", shop.getApiId());
        	json.put("lat", shop.getLat());
        	json.put("lng", shop.getLng());
        	jsonArray.put(json);
        }
        request.setAttribute("shopsJson", jsonArray.toString());
        
        System.out.println("[ShopShowAction.java]shops : " + shops); 
        // 遷移先のページを返す
        System.out.println("[ShopShowAction.java]: End");
 
        return "shopsWithTeam.jsp";
    }
}
