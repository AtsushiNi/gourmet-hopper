package org.javatraining.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

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

        String smallAreaCode = "X175";
        String shopName = request.getParameter("shopName");
        request.setAttribute("shopName", shopName);

        List<Shop> shops = null;
		try {
			shops = shopService.getShops(smallAreaCode,shopName);
		} catch (SQLException | NamingException | IOException | InterruptedException e) {
			e.printStackTrace();
		}

        // Shopオブジェクトの List をリクエストに設定
        request.setAttribute("shops", shops);
        
        // Shopオブジェクトの List をjson形式でリクエストに設定
        JSONArray jsonArray = new JSONArray();
        for(Shop shop : shops) {
        	JSONObject json = new JSONObject();
        	json.put("id", shop.getId());
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
