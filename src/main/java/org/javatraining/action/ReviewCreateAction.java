package org.javatraining.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Objects;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import org.javatraining.entity.Review;
import org.javatraining.entity.Shop;
import org.javatraining.repository.HotpepperRepository;
import org.javatraining.service.ReviewService;
import org.javatraining.service.ShopService;

//　レビュー情報登録アクションクラス
public class ReviewCreateAction extends Action {

    protected final ReviewService reviewService = new ReviewService();
    protected final ShopService shopService = new ShopService();
	
    protected String processRequest(HttpServletRequest request) throws SQLException, NamingException {
    	Shop shop = getOrCreateShop(request);
    	
    	Review review = createReview(request, shop);
    	
    	reviewService.create(review);
		// 遷移先のページを返す
		return "control?action_name=shop_detail&apiId=" + shop.getApiId();
    }    
    
	// リクエストの情報によりレビュー情報オブジェクトを作成
	private Review createReview(HttpServletRequest request, Shop shop) throws NamingException, SQLException{

		// レビュー情報オブジェクトを生成
		Review review = new Review();

		// レビュー情報オブジェクトの各フィールドを設定
		String title = request.getParameter("title");
		review.setTitle(title);
		
		int rating = Integer.parseInt(request.getParameter("rating"));
		review.setRating(rating);
		
		String Budget = request.getParameter("budget");
		review.setBudget(Budget);
		
		
		String forParty = request.getParameter("forParty");
		review.setForParty(Objects.isNull(forParty));
		
		String forReception = request.getParameter("forReception");
		review.setForParty(Objects.isNull(forReception));
		
		String forDate = request.getParameter("forDate");
		review.setForDate(Objects.isNull(forDate));
		
		String tabaco = request.getParameter("tabaco");
		review.setTabaco(Objects.isNull(tabaco));
		String free = request.getParameter("free");
		review.setFree(Objects.isNull(free));
		
		String partySpace = request.getParameter("patrySpace");
		review.setPartySpace(Objects.isNull(partySpace));
		
		String reservation = request.getParameter("reservation");
		review.setReservation(Objects.isNull(reservation));
		
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

		String apiId = request.getParameter("apiId");
		Shop dbshop = shopService.find(apiId);
		
		if(dbshop == null) {
			
			Shop shop = null;
			HotpepperRepository repository = new HotpepperRepository();
			
			try {
				shop = repository.getShopByApiId(apiId);
			} catch (IOException e) {
				e.printStackTrace();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			shopService.create(shop);
			dbshop = shopService.find(apiId);
			return dbshop;
		}else{
			return dbshop;
		}
		
    }

}