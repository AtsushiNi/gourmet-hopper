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

    // ShopsテーブルにShopsを新規登録する
    public boolean create(Shops book) throws SQLException, NamingException {

        System.out.println("[ShopsDAO.java]:create Start");
        // INSERT INFO テーブルにデータを追加する SQL文
        String sql = "INSERT INTO BOOK_INFO (BOOK_NAME,AUTHOR,AMOUNT,LOCATION,DESCRIPTION ) VALUES (?, ?, ?, ?, ?)";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)){

            // プレース・ホルダに値を設定
            ps.setString(1, book.getShopsName());
            ps.setString(2, book.getAuthor());
            ps.setInt(3, book.getAmount());
            ps.setString(4, book.getLocation());
            if ("".equals(book.getDescription().trim())) {
                ps.setNull(5, java.sql.Types.VARCHAR);
            } else {
                ps.setString(5, book.getDescription().trim());
            }

            // SQL 文を実行
            int affectedRows = ps.executeUpdate();
            boolean insResult = affectedRows == 1;
            
            // 実行結果を返す
            System.out.println("[ShopsDAO.java]:create SQL実行結果: "+ insResult);
            System.out.println("[ShopsDAO.java]:create End");
            return insResult;
        }
    }

    // ShopsテーブルにShopsを更新する
    public boolean merge(Shops book) throws SQLException, NamingException {

        System.out.println("[ShopsDAO.java]:merge Start");
        // INSERT INFO テーブルのデータを更新する SQL文
        String sql = "UPDATE BOOK_INFO SET BOOK_NAME = ? ,AUTHOR = ? , AMOUNT = ?, LOCATION = ? , DESCRIPTION = ?  WHERE PROD_ID = ? ";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)){
            // プレース・ホルダに値を設定
            ps.setString(1, book.getShopsName());
            ps.setString(2, book.getAuthor());
            ps.setInt(3, book.getAmount());
            ps.setString(4, book.getLocation());
            if ("".equals(book.getDescription().trim())) {
                ps.setNull(5, java.sql.Types.VARCHAR);
            } else {
                ps.setString(5, book.getDescription().trim());
            }
            ps.setInt(6, book.getProductId());

            // SQL 文を実行
            int affectedRows = ps.executeUpdate();
            boolean updResult = affectedRows == 1;

            // 実行結果を返す
            System.out.println("[ShopsDAO.java]:merge SQL実行結果: "+ updResult);
            System.out.println("[ShopsDAO.java]:merge End");
            return updResult;
        }
    }

    // ShopsテーブルからShopsを削除する
    public boolean remove(Shops book) throws SQLException, NamingException {
    	
        System.out.println("[ShopsDAO.java]:remove Start");
        // BOOK INFO テーブルからデータを削除する SQL 文
        String sql = "DELETE FROM BOOK_INFO WHERE PROD_ID = ?";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)){
            // プレース・ホルダに値を設定
            ps.setInt(1, book.getProductId());
            // SQL 文を実行
            int affectedRows = ps.executeUpdate();
            boolean delResult = affectedRows == 1;

            // 実行結果を返す
            System.out.println("[ShopsDAO.java]:remove SQL実行結果: "+ delResult);
            System.out.println("[ShopsDAO.java]:remove End");
            return delResult;
            
        }
    }

    // ResultSetからShopsオブジェクトを生成する
    private Shops createShops(ResultSet rs) throws SQLException {
        Shops book = new Shops();

        book.setProductId(rs.getInt("PROD_ID"));
        book.setShopsName(rs.getString("BOOK_NAME"));
        book.setAuthor(rs.getString("AUTHOR"));
        book.setAmount(rs.getInt("AMOUNT"));
        book.setLocation(rs.getString("LOCATION"));
        if (rs.getString("DESCRIPTION") == null) {
            book.setDescription("");
        } else {
            book.setDescription(rs.getString("DESCRIPTION"));
        }

        return book;
    }
}