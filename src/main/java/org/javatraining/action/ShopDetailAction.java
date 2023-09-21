package org.javatraining.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import org.javatraining.entity.Review;
import org.javatraining.entity.Shop;
import org.javatraining.repository.HotpepperRepository;
import org.javatraining.service.ReviewService;

// Shopの詳細を表示するアクションクラス
public class ShopDetailAction extends Action {
	
	protected final ReviewService service = new ReviewService();
	
    @Override
    protected String processRequest(HttpServletRequest request) throws SQLException, NamingException {
    	HotpepperRepository repository = new HotpepperRepository();
    	//reviewの取得
    	List<Review> reviews = service.getReviews();
    	
    	//apiIdの取得
    	String apiId = request.getParameter("apiId");
    	Shop shopDetail = null;
    	try {
				shopDetail  = repository.getShopByApiId(apiId);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
    	
        request.setAttribute("reviews", reviews);
        request.setAttribute("shopDetail", shopDetail);
        // 遷移先のページを返す
        return "shopDetail.jsp";
    }  
}
