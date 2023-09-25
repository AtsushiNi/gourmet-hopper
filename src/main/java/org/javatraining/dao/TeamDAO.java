package org.javatraining.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.javatraining.entity.Community;
import org.javatraining.entity.Team;
import org.javatraining.entity.User;


// Team情報テーブルへのアクセスを行うクラス
public class TeamDAO {
    
    // チーム情報テーブルを全件検索する
    public List<Team> findAll(Community community) throws SQLException, NamingException {

        System.out.println("[TeamDAO.java]:findAll Start");
        // team INFO テーブルを全件検索する SQL文
        String sql = "SELECT * FROM TEAMS WHERE COMMUNITY_ID = ?";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
        	ps.setInt(1, community.getCommunityId());
        	ResultSet rs = ps.executeQuery();
        	List<Team> teams = new ArrayList<>();
            // 検索結果をループしてチーム情報オブジェクトの List に格納
            while (rs.next()) {
                // チーム情報オブジェクトを生成
                Team team = createTeam(rs);
                // チーム情報オブジェクトの List に格納
                teams.add(team);
            }
            // 書籍情報オブジェクトの List を返す
            System.out.println("[TeamDAO.java]:findAll SQL実行結果: "+ teams);
            System.out.println("[TeamDAO.java]:findAll End");
            return teams;
        }
    }
    
    public Team findById(int id) throws SQLException, NamingException {

        System.out.println("[TeamDAO.java]:findById Start");
    	// BOOK_INFO テーブルを商品 ID の条件で検索する SQL 文
        String sql = "SELECT USERS.*, TEAMS.* FROM USERS INNER JOIN TEAMS_USERS ON USERS.ID = TEAMS_USERS.USER_ID INNER JOIN TEAMS ON TEAMS_USERS.TEAM_ID = TEAMS.ID WHERE TEAMS.ID = ?";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)){

            // プレース・ホルダに値を設定
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            Team team = new Team();
            while (rs.next()) {
            	appendUser(rs, team);
            }
            
            System.out.println("[TeamDAO.java]:findById SQL実行結果: "+ team);
            System.out.println("[TeamDAO.java]:findById End");                
            return team;
        }
    }

    private Team createTeam(ResultSet rs) throws SQLException {
        Team team = new Team();

        team.setId(rs.getInt("ID"));
        team.setName(rs.getString("NAME"));

        return team;
    }

    private void appendUser(ResultSet rs, Team team) throws SQLException {
    	User user = new User();
        user.setUserId(rs.getInt("USERS.ID"));
        user.setUserName(rs.getString("USERS.NAME"));
        user.setPassword(rs.getString("USERS.PASSWORD"));
        user.setLikeFood(rs.getString("USERS.LIKE_FOOD"));
        user.setDislikeFood(rs.getString("USERS.DISLIKE_FOOD"));

        team.addUser(user);
        team.setId(rs.getInt("TEAMS.ID"));
        team.setName(rs.getString("TEAMS.NAME"));

        return;
    }
}