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
        
    	//apiIdの取得
    	String apiId = shopDetail.getApiId();
    	System.out.println("[ShopDetailAction.java]: apiId "+ apiId);
    	
    	//communityIdとapiIdでDBからReviewをListで取得
    	List<Review> reviews = reviewService.getReviewsByCommunityIdAndApiId(communityId, apiId);
    	System.out.println("[ShopDetailAction.java]: reviews "+ reviews);
    	
    	//取得したReview型のListをRequestに格納
    	request.setAttribute("reviews", reviews);
    	System.out.println("[ShopDetailAction.java]: processRequest(HttpServletRequest request) END");

        // 遷移先のページを返す
        return "shopDetail.jsp";
    }  
}
