package org.javatraining.action;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.javatraining.entity.Community;
import org.javatraining.entity.Review;
import org.javatraining.service.ReviewService;

// Shopの詳細を表示するアクションクラス
public class ShopDetailAction extends Action {
	
	protected final ReviewService reviewService = new ReviewService();
	
    @Override
    protected String processRequest(HttpServletRequest request) throws SQLException, NamingException {
    
    	System.out.println("[ShopDetailAction.java: processRequest(HttpServletRequest request) Start");
    	//CommunityIdに対応したReviewをリスト型で取得
    	
    	//CommunityIdをsessionから取得
        HttpSession session = request.getSession(true);
    	Community community = (Community)session.getAttribute("community");
    	int communityId = community.getCommunityId();
    	System.out.println("[ShopDetailAction.java:community.getCommunityId() "+ communityId);
    	
    	//shopIdをRequestから取得
    	ShopDetail shopDetail = (ShopDetail)request.getAttribute("shopDetail");
    	int shopId = shopDetail.getShopId();
    	System.out.println("[ShopDetailAction.java: shopDetail.getShopId() "+ shopId);
    	
    	//communityIdでDBからReviewをListで取得
    	List<Review> reviews = reviewService.getReviews(communityId, shopId);
    	System.out.println("[ShopDetailAction.java: service.getReviews(communityId) "+ reviews);
    	
    	//取得したReview型のListをRequestに格納
    	request.setAttribute("reviews", reviews);
    	System.out.println("[ShopDetailAction.java: processRequest(HttpServletRequest request) END");

    	//apiIdの取得
    	String apiId = request.getParameter("apiId");
        request.setAttribute("apiId", apiId);

        // 遷移先のページを返す
        return "shopDetail.jsp";
    }  
}
