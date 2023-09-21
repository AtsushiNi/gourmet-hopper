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

    protected final ReviewService service = new ReviewService();
    protected final ShopService service2 = new ShopService();
	
    protected String processRequest(HttpServletRequest request) throws SQLException, NamingException {
    	processShopManagement(request);

        // レビュー情報管理の処理を実行
        return processReviewManagement(request);
    }    
    
	protected String processReviewManagement(HttpServletRequest request) throws SQLException, NamingException {

		System.out.println("[ReviewCreateAction.java]: Start");

		// リクエストの情報によりレビュー情報オブジェクトを作成
		Review review = createReview(request);
		

		//レビュー情報の新規登録
		System.out.println("[ReviewCreateAction.java]: ReviewService:createメソッドを呼び出し");
		service.create(review);
		System.out.println("[ReviewCreateAction.java]: End(新規登録完了)");


		// 遷移先のページを返す
		return "shopDetail.jsp";
	}

	// リクエストの情報によりレビュー情報オブジェクトを作成
	private Review createReview(HttpServletRequest request) throws NamingException, SQLException{

		// レビュー情報オブジェクトを生成
		Review review = new Review();
		Shop shop = processShopManagement(request);

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
	
	/*private Shop createShop(HttpServletRequest request) {
		Shop shop = new Shop();
		
		String shopName = request.getParameter("shopName");
		shop.setName(shopName);
		
		String smallAreaCode = request.getParameter("smallAreaCode");
		shop.setSmallAreaCode(smallAreaCode);
		
		String shopApiId = request.getParameter("shopApiId");
		shop.setSmallAreaCode(shopApiId);
		
		//ショップ情報を返す
		return shop;
	}*/
	
    protected Shop processShopManagement(HttpServletRequest request) throws SQLException, NamingException{

		String shopApiId = request.getParameter("shopApiId");
		Shop dbshop = service2.find(shopApiId);
		
		if(dbshop == null) {
			
			Shop shop = new Shop();
			
			String shopName = request.getParameter("shopName");
			shop.setName(shopName);
			
			String smallAreaCode = request.getParameter("smallAreaCode");
			shop.setSmallAreaCode(smallAreaCode);

			shop.setSmallAreaCode(shopApiId);
			
			service2.create(shop);
			return shop;
		}else{
			return dbshop;
		}
		
    }

}