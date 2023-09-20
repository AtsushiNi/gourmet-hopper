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
    private Team createTeam(ResultSet rs) throws SQLException {
        Team team = new Team();

        team.setId(rs.getInt("ID"));
        team.setName(rs.getString("NAME"));

        return team;
    }
}