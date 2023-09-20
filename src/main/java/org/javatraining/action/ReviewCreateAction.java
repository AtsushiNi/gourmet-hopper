package org.javatraining.action;

import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import org.javatraining.service.ReviewService;

// Shopの詳細を表示するアクションクラス
public class ReviewCreateAction extends Action {
	
	protected final ReviewService service = new ReviewService();

    @Override
    protected String processRequest(HttpServletRequest request) throws SQLException, NamingException {
    	
    	//reviewの取得
    	//List<Review> reviews = service.getReviews();
        //request.setAttribute("reviews", reviews);

        // 遷移先のページを返す
        return "reviewNew.jsp";
    }  
}
