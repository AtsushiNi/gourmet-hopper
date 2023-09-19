package org.javatraining.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.javatraining.entity.Shops;


// shopsテーブルへのアクセスを行うクラス
public class ShopsDAO {
    
    // SHOPSテーブルを全件検索する
    public List<Shops> findAll() throws SQLException, NamingException {

        System.out.println("[ShopsDAO.java]:findAll Start");
        // SHOPSテーブルを全件検索する SQL文
        String sql = "SELECT * FROM SHOPS";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            // Shopsオブジェクトの List を生成
            List<Shops> shops = new ArrayList<>();
            // 検索結果をループしてShopsオブジェクトの List に格納
            while (rs.next()) {
                // Shopsオブジェクトを生成
                Shops shop = createShops(rs);
                // Shopsオブジェクトの List に格納
                shops.add(shop);
            }
            // Shopsオブジェクトの List を返す
            System.out.println("[ShopsDAO.java]:findAll SQL実行結果: "+ shops);
            System.out.println("[ShopsDAO.java]:findAll End");
            return shops;
        }
    }

    // SHOPSテーブルを主キー検索する
    public Shops findById(int id) throws SQLException, NamingException {
        System.out.println("[ShopsDAO.java]:findById Start");
    	// SHOPS テーブルを商品 ID の条件で検索する SQL 文
        String sql = "SELECT * WHERE ID = ?";

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
                // Shopsオブジェクトを生成
                Shops shop = createShops(rs);
                
                // Shopsを返す
                System.out.println("[ShopsDAO.java]:findById SQL実行結果: "+ shop);
                System.out.println("[ShopsDAO.java]:findById End");                
                return shop;
            }
        }
    }

    // SHOPSテーブルにshopsを新規登録する
    public boolean create(Shops shops) throws SQLException, NamingException {

        System.out.println("[ShopsDAO.java]:create Start");
        // INSERT INFO テーブルにデータを追加する SQL文
        String sql = "INSERT INTO SHOPS (NAME) VALUES (?)";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)){

            // プレース・ホルダに値を設定
        	 ps.setString(1, shops.getName());

            // SQL 文を実行
            int affectedRows = ps.executeUpdate();
            boolean insResult = affectedRows == 1;
            
            // 実行結果を返す
            System.out.println("[ShopsDAO.java]:create SQL実行結果: "+ insResult);
            System.out.println("[ShopsDAO.java]:create End");
            return insResult;
        }
    }

    // ResultSetからShopsオブジェクトを生成する
    private Shops createShops(ResultSet rs) throws SQLException {
        Shops shops = new Shops();

        shops.setId(rs.getInt("ID"));
        shops.setName(rs.getString("NAME"));
        return shops;
    }
}