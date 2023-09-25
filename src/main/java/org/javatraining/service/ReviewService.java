package org.javatraining.service;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import org.javatraining.dao.ReviewDAO;
import org.javatraining.entity.Review;

public class ReviewService {
	
	private final ReviewDAO dao = new ReviewDAO();
	
	public List<Review> getReviews() throws SQLException, NamingException{
		System.out.println("[ReviewService.java:getReviews Start");
		return dao.findAll();
	}
	
	public List<Review> getReviewsByCommunityIdAndApiId(int communityId, String apiId) throws SQLException, NamingException{
		System.out.println("[ReviewService.java:getReviewsByCommunityIdAndApiId Start");
		return dao.findByCommunityIdAndApiId(communityId, apiId);
	}
	
    // review情報を登録する
    public boolean create(Review review) throws SQLException, NamingException {
        System.out.println("[ReviewService.java]:create Start");
    	return dao.create(review);
    }
}
