package org.javatraining.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.javatraining.entity.Community;
import org.javatraining.entity.Shop;
import org.javatraining.service.ShopService;
import org.json.JSONArray;
import org.json.JSONObject;

// 一覧画面表示アクションクラス
public class SearchAction extends Action {
	private final ShopService shopService = new ShopService();

	@Override
	protected String processRequest(HttpServletRequest request) {
		System.out.println("[ShopShowAction.java]: Start");
		System.out.println("[ShopShowAction.java]: ShopService:getShopsメソッドを呼び出し");

		// エリア検索
		String middleAreaCode = request.getParameter("middleAreaCode");
		String smallAreaCode = request.getParameter("smallAreaCode");
		
		if(smallAreaCode == null && middleAreaCode == null) {
			smallAreaCode = "X175";
		}

		String areaName = "";
		if(smallAreaCode != null || middleAreaCode == null) {
			areaName = "中野";
		} else {
			areaName = request.getParameter("areaName");
		}
		request.setAttribute("areaName", areaName);
		
		Map<String, String> areaCodes = new HashMap();
		areaCodes.put("smallAreaCode", smallAreaCode);
		areaCodes.put("middleAreaCode", middleAreaCode);

		String shopName = request.getParameter("shopName");
		request.setAttribute("shopName", shopName);
		
    	//CommunityIdをsessionから取得
        HttpSession session = request.getSession(true);
    	Community community = (Community)session.getAttribute("community");
    	int communityId = community.getCommunityId();
    	System.out.println("[ShopDetailAction.java]:community.getCommunityId() "+ communityId);

		List<Shop> shops = null;
		try {
			shops = shopService.getShops(areaCodes, shopName, communityId);
		} catch (SQLException | NamingException | IOException | InterruptedException e) {
			e.printStackTrace();
		}

		// Shopオブジェクトの List をリクエストに設定
		request.setAttribute("shops", shops);

		// Shopオブジェクトの List をjson形式でリクエストに設定
		JSONArray jsonArray = new JSONArray();
		for (Shop shop : shops) {
			JSONObject json = new JSONObject();
			json.put("shopId", shop.getShopId());
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

		return "search.jsp";
	}
}

