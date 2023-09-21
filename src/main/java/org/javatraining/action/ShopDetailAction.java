package org.javatraining.action;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

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
    	//reviewの取得
    	List<Review> reviews = reviewService.getReviews();
    	
    	//shopDetailの取得
    	Shop shopDetail = shopService.getShop(request);
    	
        request.setAttribute("reviews", reviews);
        request.setAttribute("shopDetail", shopDetail);
        // 遷移先のページを返す
        return "shopDetail.jsp";
    }  
}
