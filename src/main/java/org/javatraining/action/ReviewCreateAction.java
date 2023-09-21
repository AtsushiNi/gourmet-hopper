package org.javatraining.action;

import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import org.javatraining.entity.Review;
import org.javatraining.entity.Shop;
import org.javatraining.service.ReviewService;
import org.javatraining.service.ShopService;

//　レビュー情報登録アクションクラス
public class ReviewCreateAction extends Action {

    protected final ReviewService reviewService = new ReviewService();
    protected final ShopService shopService = new ShopService();
	
    protected String processRequest(HttpServletRequest request) throws SQLException, NamingException {
    	Shop shop = getOrCreateShop(request);
    	
    	Review review = createReview(request, shop);
    	
    	
		// 遷移先のページを返す
		return (new ShopDetailAction()).execute(request);
    }    
    
	// リクエストの情報によりレビュー情報オブジェクトを作成
	private Review createReview(HttpServletRequest request, Shop shop) throws NamingException, SQLException{

		// レビュー情報オブジェクトを生成
		Review review = new Review();

		// レビュー情報オブジェクトの各フィールドを設定
		String title = request.getParameter("title");
		review.setTitle(title);

		String comment = request.getParameter("comment");
		review.setComment(comment);

		int userId = Integer.parseInt(request.getParameter("userId"));
		review.setUserId(userId);

		int shopId = shop.getId();
		review.setShopId(shopId);

		// レビュー情報オブジェクトを返す
		return review;
	}
	
    protected Shop getOrCreateShop(HttpServletRequest request) throws SQLException, NamingException{

		String shopApiId = request.getParameter("shopApiId");
		Shop dbshop = shopService.find(shopApiId);
		
		if(dbshop == null) {
			
			Shop shop = new Shop();
			
			String shopName = request.getParameter("shopName");
			shop.setName(shopName);
			
			String smallAreaCode = request.getParameter("smallAreaCode");
			shop.setSmallAreaCode(smallAreaCode);

			shop.setSmallAreaCode(shopApiId);
			
			shopService.create(shop);
			return shop;
		}else{
			return dbshop;
		}
		
    }

}