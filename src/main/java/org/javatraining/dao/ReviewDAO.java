package org.javatraining.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.javatraining.entity.Review;
import org.javatraining.entity.User;


// reviewsテーブルへのアクセスを行うクラス
public class ReviewDAO {
    
    // REVIEWSテーブルを全件検索する
    public List<Review> findAll() throws SQLException, NamingException {

        System.out.println("[ReviewDAO.java]:findAll Start");
        // REVIEWSテーブルを全件検索する SQL文
        String sql = "SELECT * FROM REVIEWS";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            // Shopオブジェクトの List を生成
            List<Review> reviews = new ArrayList<>();
            // 検索結果をループしてReviewオブジェクトの List に格納
            while (rs.next()) {
                // Reviewオブジェクトを生成
                Review review = createReview(rs);
                // Reviewオブジェクトの List に格納
                reviews.add(review);
            }
            // Reviewオブジェクトの List を返す
            System.out.println("[ReviewDAO.java]:findAll SQL実行結果: "+ reviews);
            System.out.println("[ReviewDAO.java]:findAll End");
            return reviews;
        }
    }

    // REVIEWテーブルをuserID検索する
    public Review findByUserId(int id) throws SQLException, NamingException {
        System.out.println("[DAO.java]:findByUserId Start");
    	// REVIEW テーブルをuserID の条件で検索する SQL 文
        String sql = "SELECT * FROM REVIEWS WHERE USER_ID = ?";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)){

            // プレース・ホルダに値を設定
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                // 検索結果が存在しない場合、NULL を返す
                if (!rs.next()) {
                    return null;
                }
                // Reviewオブジェクトを生成
                Review review = createReview(rs);
                
                // Reviewを返す
                System.out.println("[ReviewDAO.java]:findByUserId SQL実行結果: "+ review);
                System.out.println("[ReviewDAO.java]:findByUserId End");                
                return review;
            }
        }
    }
 // reviewsテーブルをcommunityIdとshopIdで検索する
    public List<Review> findByCommunityIdAndApiId(int communityId, String apiId) throws SQLException, NamingException {

        System.out.println("[ReviewDAO.java]:findByCommunityIdAndApiId Start");
    	// COMMUNITIES テーブルをUSERが所属しているCOMMUNITYのIDの条件で検索する SQL 文
        String sql = "SELECT * FROM COMMUNITIES_USERS "
        		+ "INNER JOIN REVIEWS ON COMMUNITIES_USERS.USER_ID = REVIEWS.USER_ID "
        		+ "INNER JOIN SHOPS ON REVIEWS.SHOP_ID = SHOPS.ID "
        		+ "WHERE COMMUNITIES_USERS.COMMUNITY_ID = ? AND SHOPS.API_ID = ?";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);) {
        	System.out.println("[ReviewDAO.java]:findByCommunityIdAndApiId communityId="+communityId);
        	ps.setInt(1, communityId);
        	System.out.println("[ReviewDAO.java]:findByCommunityIdAndApiId apiId="+apiId);
        	ps.setString(2, apiId);
            ResultSet rs = ps.executeQuery();
            // Reviewオブジェクトの List を生成
            List<Review> reviews = new ArrayList<>();
            
            // 検索結果をループしてReviewオブジェクトの List に格納
            while (rs.next()) {
                // Reviewオブジェクトを生成
            	Review review = new Review();
            	//　ReviewオブジェクトにSQLの結果を格納
            	review.setId(rs.getInt("REVIEWS.ID"));
            	review.setTitle(rs.getString("REVIEWS.TITLE"));
            	review.setRating(rs.getInt("REVIEWS.RATING"));
            	review.setBudget(rs.getString("REVIEWS.BUDGET"));
            	review.setForParty(rs.getBoolean("REVIEWS.FORPARTY"));
            	review.setForReception(rs.getBoolean("REVIEWS.FORRECEPTION"));
            	review.setForDate(rs.getBoolean("REVIEWS.FORDATE"));
            	review.setTabaco(rs.getBoolean("REVIEWS.TABACO"));
            	review.setFree(rs.getBoolean("REVIEWS.FREE"));
            	review.setPartySpace(rs.getBoolean("REVIEWS.PARTYSPACE"));
            	review.setReservation(rs.getBoolean("REVIEWS.RESERVATION"));
            	review.setComment(rs.getString("REVIEWS.REVIEW"));
            	review.setUserId(rs.getInt("REVIEWS.USER_ID"));
            	review.setShopId(rs.getInt("REVIEWS.SHOP_ID"));
            	
                // Reviewオブジェクトの List に格納
            	reviews.add(review);
            	
            	//デバッグ用にUSER_IDを取得
            	System.out.println("[ReviewDAO.java]:findByCommunityIdAndApiId SQL途中 USER_ID ="+rs.getInt("REVIEWS.USER_ID"));
            	System.out.println("[ReviewDAO.java]:findByCommunityIdAndApiId SQL途中 USER_ID ="+rs.getInt("REVIEWS.SHOP_ID"));
            }
            // Reviewオブジェクトの List を返す
            System.out.println("[ReviewDAO.java]:findByCommunityIdAndApiId SQL実行結果: "+ reviews);
            System.out.println("[ReviewDAO.java]:findByCommunityIdAndApiId End");
            return reviews;
        }
    }
    
    //REVIEWテーブルをshopID検索する
    public Review findByShopId(int id) throws SQLException, NamingException {
        System.out.println("[DAO.java]:findByShopId Start");
    	// REVIEW テーブルをshopID の条件で検索する SQL 文
        String sql = "SELECT * FROM REVIEWS WHERE SHOP_ID = ?";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)){

            // プレース・ホルダに値を設定
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                // 検索結果が存在しない場合、NULL を返す
                if (!rs.next()) {
                    return null;
                }
                // reviewオブジェクトを生成
                Review review = createReview(rs);
                
                // reviewを返す
                System.out.println("[ReviewDAO.java]:findByShopId SQL実行結果: "+ review);
                System.out.println("[ReviewDAO.java]:findByShopId End");                
                return review;
            }
        }
    }
    
    // reviewsテーブルをcommunityIdとshopIdで検索する
    public List<User> findUsers(int communityId, String apiId) throws SQLException, NamingException {

        System.out.println("[ReviewDAO.java]:findUsers Start");
    	// USERが所属しているCOMMUNITYにREVIEWがあるUSER達を検索する SQL 文
        String sql = "SELECT * FROM COMMUNITIES_USERS "
        		+ "INNER JOIN USERS ON COMMUNITIES_USERS.USER_ID = USERS.ID "
        		+ "INNER JOIN REVIEWS ON USERS.ID = REVIEWS.USER_ID "
        		+ "INNER JOIN SHOPS ON REVIEWS.SHOP_ID = SHOPS.ID "
        		+ "WHERE COMMUNITIES_USERS.COMMUNITY_ID = ? AND SHOPS.API_ID = ?";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);) {
        	System.out.println("[ReviewDAO.java]:findUsers communityId="+communityId);
        	ps.setInt(1, communityId);
        	System.out.println("[ReviewDAO.java]:findUsers apiId="+apiId);
        	ps.setString(2, apiId);
            ResultSet rs = ps.executeQuery();
            // Userオブジェクトの List を生成
            List<User> users = new ArrayList<>();
            
            // 検索結果をループしてReviewオブジェクトの List に格納
            while (rs.next()) {
                // Userオブジェクトを生成
            	User user = new User();
            	//　UserオブジェクトにSQLの結果を格納
            	user.setUserId(rs.getInt("USERS.ID"));
            	user.setUserName(rs.getString("USERS.NAME"));
            	user.setPassword(rs.getString("USERS.PASSWORD"));
            	user.setEmail(rs.getString("USERS.EMAIL"));
            	user.setLikeFood(rs.getString("USERS.LIKE_FOOD"));
            	user.setDislikeFood(rs.getString("USERS.DISLIKE_FOOD"));
            	
                // Userオブジェクトの List に格納
            	users.add(user);
            	
            	//デバッグ用
            	System.out.println("[ReviewDAO.java]:findUsers SQL途中 USER_ID ="+rs.getInt("USERS.ID"));
            	System.out.println("[ReviewDAO.java]:findUsers SQL途中 USER_ID ="+rs.getString("USERS.NAME"));
            }
            // Userオブジェクトの List を返す
            System.out.println("[ReviewDAO.java]:findUsers SQL実行結果: "+ users);
            System.out.println("[ReviewDAO.java]:findUsers End");
            return users;
        }
    }
    
    // REVIEWSテーブルにreviewを新規登録する
    public boolean create(Review review) throws SQLException, NamingException {

        System.out.println("[REVIEWDAO.java]:create Start");
        // INSERT INFO テーブルにデータを追加する SQL文
        String sql = "INSERT INTO REVIEWS (TITLE, RATING, BUDGET, FORPARTY, FORRECEPTION, FORDATE, TABACO, FREE, PARTYSPACE, RESERVATION,  REVIEW, USER_ID, SHOP_ID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)){

            // プレース・ホルダに値を設定
        	 ps.setString(1, review.getTitle());
        	 ps.setInt(2, review.getRating());
        	 ps.setString(3, review.getBudget());
        	 ps.setBoolean(4, review.isForParty());
        	 ps.setBoolean(5, review.isForReception());
        	 ps.setBoolean(6, review.isForDate());
        	 ps.setBoolean(7, review.isTabaco());
        	 ps.setBoolean(8, review.isFree());
        	 ps.setBoolean(9, review.isPartySpace());
        	 ps.setBoolean(10, review.isReservation());
        	 ps.setString(11, review.getComment());
        	 ps.setInt(12, review.getUserId());
        	 ps.setInt(13, review.getShopId());

            // SQL 文を実行
            int affectedRows = ps.executeUpdate();
            boolean insResult = affectedRows == 1;
            
            // 実行結果を返す
            System.out.println("[ReviewDAO.java]:create SQL実行結果: "+ insResult);
            System.out.println("[ReviewDAO.java]:create End");
            return insResult;
        }
    }

    // ResultSetからreviewオブジェクトを生成する
    private Review createReview(ResultSet rs) throws SQLException {
        Review review = new Review();
        review.setTitle(rs.getString("TITLE"));
        review.setRating(rs.getInt("RATING"));
        review.setBudget(rs.getString("BUDGET"));
        review.setForParty(rs.getBoolean("FORPARTY"));
        review.setForReception(rs.getBoolean("FORRECEPTION"));
        review.setForDate(rs.getBoolean("FORDATE"));
        review.setTabaco(rs.getBoolean("TABACO"));
        review.setFree(rs.getBoolean("FREE"));
        review.setPartySpace(rs.getBoolean("PARTYSPACE"));
        review.setReservation(rs.getBoolean("RESERVATION"));
        review.setComment(rs.getString("REVIEW"));
        review.setUserId(rs.getInt("USER_ID"));
        review.setShopId(rs.getInt("SHOP_ID"));
        return review;
    }
}