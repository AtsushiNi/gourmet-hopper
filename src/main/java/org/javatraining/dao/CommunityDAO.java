package org.javatraining.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.javatraining.entity.Community;


// コミュニティテーブルへのアクセスを行うクラス
public class CommunityDAO {
    
    // コミュニティテーブルを全件検索する
    public List<Community> findAll() throws SQLException, NamingException {

        System.out.println("[CommunityDAO.java]:findAll Start");
        // COMMUNITIES テーブルを全件検索する SQL文
        String sql = "SELECT ID,NAME,PASSWORD FROM COMMUNITIES";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            // Communityオブジェクトの List を生成
            List<Community> communities = new ArrayList<>();
            // 検索結果をループしてCommunityオブジェクトの List に格納
            while (rs.next()) {
                // Communityオブジェクトを生成
            	Community community = createCommunity(rs);
                // Communityオブジェクトの List に格納
                communities.add(community);
            }
            // Communityオブジェクトの List を返す
            System.out.println("[CommunityDAO.java]:findAll SQL実行結果: "+ communities);
            System.out.println("[CommunityDAO.java]:findAll End");
            return communities;
        }
    }
    
    // ログイン情報に対応するCommunity情報を検索する
    public Community findByCredential(String communityName, String communityPassword) throws SQLException, NamingException {

    	System.out.println("[CommunityDAO.java]:findByCredential Start");
        String sql = "SELECT ID,NAME,PASSWORD FROM COMMUNITIES WHERE NAME = ? AND PASSWORD = ? ";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)){

            // SQL文のプレースホルダに値をセット
            ps.setString(1, communityName);
            ps.setString(2, communityPassword);

            // SQL実行
            try (ResultSet rs = ps.executeQuery()) {
                // ResultSetのカーソルを一行進める
                if (!rs.next()) {
                    // 対象がない場合は処理を中断
                    return null;
                }

                // Communityオブジェクトを作成して返す
                Community community = new Community();
                community.setCommunityId(rs.getInt("ID"));
                community.setCommunityName(rs.getString("NAME"));
                community.setCommunityPassword(rs.getString("PASSWORD"));
                
            	System.out.println("[CommunityDAO.java]:findByCredential SQL実行結果 :"+ community);
                return community;
            }
        }
    }

    // Communityテーブルを主キー検索する
    public Community findById(int communityId) throws SQLException, NamingException {

        System.out.println("[CommunityDAO.java]:findById Start");
    	// COMMUNITIES テーブルを商品 ID の条件で検索する SQL 文
        String sql = "SELECT ID,NAME,PASSWORD FROM COMMUNITIES WHERE ID = ?";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)){

            // プレース・ホルダに値を設定
            ps.setInt(1, communityId);
            try (ResultSet rs = ps.executeQuery()) {
                // 検索結果が存在しない場合、NULL を返す
                if (!rs.next()) {
                    return null;
                }
                // Communityオブジェクトを生成
                Community community = createCommunity(rs);
                
                // Communityを返す
                System.out.println("[CommunityDAO.java]:findById SQL実行結果: "+ community);
                System.out.println("[CommunityDAO.java]:findById End");                
                return community;
            }
        }
    }
    
    
    // CommunityテーブルにCommunityを新規登録する
    public boolean create(Community community) throws SQLException, NamingException {

        System.out.println("[CommunityDAO.java]:create Start");
        // COMMUNITIES テーブルにデータを追加する SQL文
        String sql = "INSERT INTO COMMUNITIES (NAME, PASSWORD) VALUES (?, ?)";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)){

            // プレース・ホルダに値を設定
            ps.setString(1, community.getCommunityName());
            ps.setString(2, community.getCommunityPassword());

            // SQL 文を実行
            int affectedRows = ps.executeUpdate();
            boolean insResult = affectedRows == 1;
            
            // 実行結果を返す
            System.out.println("[CommunityDAO.java]:create SQL実行結果: "+ insResult);
            System.out.println("[CommunityDAO.java]:create End");
            return insResult;
        }
    }

    // CommunityテーブルにCommunity情報を更新する
    public boolean merge(Community community) throws SQLException, NamingException {

        System.out.println("[CommunityDAO.java]:merge Start");
        // INSERT INFO テーブルのデータを更新する SQL文
        String sql = "UPDATE COMMUNITIES SET NAME = ?, PASSWORD = ?  WHERE ID = ? ";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)){
            // プレース・ホルダに値を設定
            ps.setString(1, community.getCommunityName());
            ps.setString(2, community.getCommunityPassword());
            ps.setInt(3, community.getCommunityId());

            // SQL 文を実行
            int affectedRows = ps.executeUpdate();
            boolean updResult = affectedRows == 1;

            // 実行結果を返す
            System.out.println("[CommunityDAO.java]:merge SQL実行結果: "+ updResult);
            System.out.println("[CommunityDAO.java]:merge End");
            return updResult;
        }
    }

    // CommunityテーブルからCommunityを削除する
    public boolean remove(Community community) throws SQLException, NamingException {
    	
        System.out.println("[CommunityDAO.java]:remove Start");
        // COMMUNITIES テーブルからデータを削除する SQL 文
        String sql = "DELETE FROM COMMUNITIES WHERE ID = ?";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)){
            // プレース・ホルダに値を設定
            ps.setInt(1, community.getCommunityId());
            // SQL 文を実行
            int affectedRows = ps.executeUpdate();
            boolean delResult = affectedRows == 1;

            // 実行結果を返す
            System.out.println("[CommunityDAO.java]:remove SQL実行結果: "+ delResult);
            System.out.println("[CommunityDAO.java]:remove End");
            return delResult;
            
        }
    }

    // ResultSetから書籍情報オブジェクトを生成する
    private Community createCommunity(ResultSet rs) throws SQLException {
    	Community community = new Community();

    	community.setCommunityId(rs.getInt("ID"));
    	community.setCommunityName(rs.getString("NAME"));
    	community.setCommunityPassword(rs.getString("PASSWORD"));

        return community;
    }
}