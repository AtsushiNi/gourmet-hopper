package org.javatraining.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.javatraining.entity.Shop;

// shopsテーブルへのアクセスを行うクラス
public class ShopDAO {

	// SHOPSテーブルで入力された名前に関してあいまい検索する
	public List<Shop> search(String smallAreaCode, String shopName) throws SQLException, NamingException {
		System.out.println("[ShopDAO.java]:search Start");
		String sql = null;
		if (shopName != null) {
			sql = "SELECT * FROM SHOPS WHERE NAME LIKE ? AND SMALL_AREA_CODE = ?";
		} else {
			sql = "SELECT * FROM SHOPS WHERE SMALL_AREA_CODE = ?";
		}
		// データソースを取得
		DataSource ds = DataSourceSupplier.getDataSource();
		try (Connection con = ds.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			// プレースホルダに値をセット
			if (shopName != null) {
				ps.setString(1, "%" + shopName + "%");
				ps.setString(2, smallAreaCode);
			}else {
				ps.setString(1, smallAreaCode);
			}
			// 実行
			ResultSet rs = ps.executeQuery();
			// Shopオブジェクトの List を生成
			List<Shop> shops = new ArrayList<>();
			// 検索結果をループしてShopオブジェクトの List に格納
			while (rs.next()) {
				// Shopオブジェクトを生成
				Shop shop = createShop(rs);
				// Shopオブジェクトの List に格納
				shops.add(shop);
			}
			// Shopオブジェクトの List を返す
			System.out.println("[ShopDAO.java]:search SQL実行結果: " + shops);
			System.out.println("[ShopDAO.java]:search End");
			return shops;
		}
	}

	// SHOPSテーブルを主キー検索する
	public Shop findById(int id) throws SQLException, NamingException {
		System.out.println("[ShopDAO.java]:findById Start");
		// SHOPS テーブルを商品 ID の条件で検索する SQL 文
		String sql = "SELECT *　FROM SHOPS WHERE ID = ?";
		// データソースを取得
		DataSource ds = DataSourceSupplier.getDataSource();
		try (Connection con = ds.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            // プレース・ホルダに値を設定
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                // 検索結果が存在しない場合、NULL を返す
                if (!rs.next()) {
                    return null;
                }
                // Shopオブジェクトを生成
                Shop shop = createShop(rs);
                
                // Shopを返す
                System.out.println("[ShopDAO.java]:findById SQL実行結果: "+ shop);
                System.out.println("[ShopDAO.java]:findById End");                
                return shop;
            }
        }
    }
    
    //SHOPSテーブルをapiIDで検索する
    public Shop findByApiId(String apiId) throws SQLException, NamingException {
        System.out.println("[ShopDAO.java]:findById Start");
    	// SHOPS テーブルを商品 ID の条件で検索する SQL 文
        String sql = "SELECT * FROM SHOPS WHERE API_ID = ?";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)){

            // プレース・ホルダに値を設定
            ps.setString(1, apiId);
            try (ResultSet rs = ps.executeQuery()) {
                // 検索結果が存在しない場合、NULL を返す
                if (!rs.next()) {
                    return null;
                }
                // Shopオブジェクトを生成
                Shop shop = createShop(rs);
                
                // Shopを返す
                System.out.println("[ShopDAO.java]:findById SQL実行結果: "+ shop);
                System.out.println("[ShopDAO.java]:findById End");                
                return shop;
            }
        }
    }
    

	// SHOPSテーブルにshopを新規登録する
	public boolean create(Shop shop) throws SQLException, NamingException {

		System.out.println("[ShopDAO.java]:create Start");
		// INSERT INFO テーブルにデータを追加する SQL文
		String sql = "INSERT INTO SHOPS (NAME, SMALL_AREA_CODE, API_ID) VALUES (?, ?, ?)";
		// データソースを取得
		DataSource ds = DataSourceSupplier.getDataSource();
		try (Connection con = ds.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			// プレース・ホルダに値を設定
			ps.setString(1, shop.getName());
			ps.setString(2, shop.getSmallAreaCode() );
			ps.setString(3, shop.getApiId());

			// SQL 文を実行
			int affectedRows = ps.executeUpdate();
			boolean insResult = affectedRows == 1;

			// 実行結果を返す
			System.out.println("[ShopDAO.java]:create SQL実行結果: " + insResult);
			System.out.println("[ShopDAO.java]:create End");
			return insResult;
		}
	}

	// ResultSetからShopオブジェクトを生成する
	private Shop createShop(ResultSet rs) throws SQLException {
		Shop shop = new Shop();

		shop.setId(rs.getInt("ID"));
		shop.setName(rs.getString("NAME"));
		shop.setApiId(rs.getString("API_ID"));
		return shop;
	}
}