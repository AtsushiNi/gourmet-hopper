package org.javatraining.service;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import org.javatraining.dao.InventoryInfoDAO;
import org.javatraining.entity.Inventory;

// 在庫情報操作ビジネスロジック
public class InventoryService {

    private final InventoryInfoDAO dao = new InventoryInfoDAO();

    // 在庫情報リストを取得する
    public List<Inventory> getInventories() throws SQLException, NamingException {
        return dao.findAll();
    }

    // 在庫情報を取得する
    public Inventory find(int productId) throws SQLException, NamingException {
        return dao.findById(productId);
    }

    // 在庫情報を登録する
    public boolean create(Inventory inventory) throws SQLException, NamingException {
        return dao.create(inventory);
    }

    // 在庫情報を変更する
    public boolean update(Inventory inventory) throws SQLException, NamingException {
        return dao.merge(inventory);
    }

    // 在庫情報を削除する
    public boolean delete(Inventory inventory) throws SQLException, NamingException {
        return dao.remove(inventory);
    }
}