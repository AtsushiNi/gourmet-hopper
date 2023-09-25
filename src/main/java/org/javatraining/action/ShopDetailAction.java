package org.javatraining.action;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.javatraining.entity.Community;
import org.javatraining.entity.Review;
import org.javatraining.entity.Shop;
import org.javatraining.service.ReviewService;
import org.javatraining.service.ShopService;
import org.json.JSONArray;
import org.json.JSONObject;

// Shopの詳細を表示するアクションクラス
public class ShopDetailAction extends Action {
	
	protected final ReviewService reviewService = new ReviewService();
	protected final ShopService shopService = new ShopService();

	
    @Override
    protected String processRequest(HttpServletRequest request) throws SQLException, NamingException {
    
    	System.out.println("[ShopDetailAction.java]: processRequest(HttpServletRequest request) Start");
    	//CommunityIdに対応したReviewをリスト型で取得
    	
    	//CommunityIdをsessionから取得
        HttpSession session = request.getSession(true);
    	Community community = (Community)session.getAttribute("community");
    	int communityId = community.getCommunityId();
    	System.out.println("[ShopDetailAction.java]:community.getCommunityId() "+ communityId);

    	//shopDetailの取得
    	Shop shopDetail = shopService.getShop(request);
        request.setAttribute("shopDetail", shopDetail);
        System.out.println("[ShopDetailAction.java]: shopDetail "+ shopDetail);
        
        // Shopオブジェクトの List (要素は1つ)をjson形式でリクエストに設定
        JSONArray jsonArray = new JSONArray();
    	JSONObject json = new JSONObject();
    	json.put("id", shopDetail.getShopId());
    	json.put("name", shopDetail.getName());
    	json.put("apiId", shopDetail.getApiId());
    	json.put("lat", shopDetail.getLat());
    	json.put("lng", shopDetail.getLng());
    	jsonArray.put(json);
        request.setAttribute("shopsJson", jsonArray.toString());
        
        //communityIdとapiIdでDBからReviewをListで取得
    	String apiId = shopDetail.getApiId();
    	List<Review> reviews = reviewService.getReviewsByCommunityIdAndApiId(communityId, apiId);
    	System.out.println("[ShopDetailAction.java]: reviews "+ reviews);
    	
    	//取得したReview型のListをRequestに格納
    	request.setAttribute("reviews", reviews);
    	System.out.println("[ShopDetailAction.java]: processRequest(HttpServletRequest request) END");

        // 遷移先のページを返す
        return "shopDetail.jsp";
    }  
}
