package org.javatraining.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import javax.sql.DataSource;
import org.javatraining.entity.Inventory;

// 在庫情報テーブルへのアクセスを行うクラス
public class InventoryInfoDAO {
    // 在庫情報テーブルを全件検索する
    public List<Inventory> findAll() throws SQLException, NamingException {

        // INVENTORY INFO テーブルを全件検索する SQL文
        String sql = "SELECT PROD_ID,PROD_NAME,PRICE,AMOUNT,LOCATION,DESCRIPTION FROM INVENTORY_INFO";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            // 在庫情報オブジェクトの List を生成
            List<Inventory> inventories = new ArrayList<>();
            // 検索結果をループして在庫情報オブジェクトの List に格納
            while (rs.next()) {
                // 在庫情報オブジェクトを生成
                Inventory inventory = createInventory(rs);
                // 在庫情報オブジェクトの List に格納
                inventories.add(inventory);
            }
            // 在庫情報オブジェクトの List を返す
            return inventories;
        }
    }

    // 在庫情報テーブルを主キー検索する
    public Inventory findById(int productId) throws SQLException, NamingException {

        // INVENTORY_INFO テーブルを商品 ID の条件で検索する SQL 文
        String sql = "SELECT PROD_ID,PROD_NAME,PRICE, AMOUNT,LOCATION,DESCRIPTION FROM INVENTORY_INFO WHERE PROD_ID = ?";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            // プレース・ホルダに値を設定
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                // 検索結果が存在しない場合、NULL を返す
                if (!rs.next()) {
                    return null;
                }
                // 在庫情報オブジェクトを生成
                Inventory inventory = createInventory(rs);

                // 在庫情報を返す
                return inventory;
            }
        }
    }

    // 在庫情報テーブルに在庫情報を新規登録する
    public boolean create(Inventory inventory) throws SQLException, NamingException {

        // INSERT INFO テーブルにデータを追加する SQL文
        String sql = "INSERT INTO INVENTORY_INFO (PROD_NAME,PRICE,AMOUNT,LOCATION,DESCRIPTION ) VALUES (?, ?, ?, ?, ?)";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();

        try (Connection con = ds.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            // プレース・ホルダに値を設定
            ps.setString(1, inventory.getProductName());
            ps.setInt(2, inventory.getPrice());
            ps.setInt(3, inventory.getAmount());
            ps.setString(4, inventory.getLocation());
            if ("".equals(inventory.getDescription().trim())) {
                ps.setNull(5, java.sql.Types.VARCHAR);
            } else {
                ps.setString(5, inventory.getDescription().trim());
            }

            // SQL 文を実行
            int affectedRows = ps.executeUpdate();
            boolean insResult = affectedRows == 1;

            // 実行結果を返す
            return insResult;
        }
    }

    // 在庫情報テーブルに在庫情報を更新する
    public boolean merge(Inventory inventory) throws SQLException, NamingException {

        // INSERT INFO テーブルのデータを更新する SQL文
        String sql = "UPDATE INVENTORY_INFO SET PROD_NAME = ? ,PRICE = ? , AMOUNT = ?, LOCATION = ? , DESCRIPTION = ?  WHERE PROD_ID = ? ";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();

        try (Connection con = ds.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            // プレース・ホルダに値を設定
            ps.setString(1, inventory.getProductName());
            ps.setInt(2, inventory.getPrice());
            ps.setInt(3, inventory.getAmount());
            ps.setString(4, inventory.getLocation());
            if ("".equals(inventory.getDescription().trim())) {
                ps.setNull(5, java.sql.Types.VARCHAR);
            } else {
                ps.setString(5, inventory.getDescription().trim());
            }
            ps.setInt(6, inventory.getProductId());

            // SQL 文を実行
            int affectedRows = ps.executeUpdate();
            boolean updResult = affectedRows == 1;

            // 実行結果を返す
            return updResult;
        }
    }

    // 在庫情報テーブルから在庫情報を削除する
    public boolean remove(Inventory inventory) throws SQLException, NamingException {
        // INVENTORY INFO テーブルからデータを削除する SQL 文
        String sql = "DELETE FROM INVENTORY_INFO WHERE PROD_ID = ?";
        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();

        try (Connection con = ds.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            // プレース・ホルダに値を設定
            ps.setInt(1, inventory.getProductId());
            // SQL 文を実行
            int affectedRows = ps.executeUpdate();
            boolean delResult = affectedRows == 1;
            // 実行結果を返す
            return delResult;
        }
    }

    // ResultSetから在庫情報オブジェクトを生成する
    private Inventory createInventory(ResultSet rs) throws SQLException {
        Inventory inventory = new Inventory();

        inventory.setProductId(rs.getInt("PROD_ID"));
        inventory.setProductName(rs.getString("PROD_NAME"));
        inventory.setPrice(rs.getInt("PRICE"));
        inventory.setAmount(rs.getInt("AMOUNT"));
        inventory.setLocation(rs.getString("LOCATION"));
        if (rs.getString("DESCRIPTION") == null) {
            inventory.setDescription("");
        } else {
            inventory.setDescription(rs.getString("DESCRIPTION"));
        }

        return inventory;
    }
}