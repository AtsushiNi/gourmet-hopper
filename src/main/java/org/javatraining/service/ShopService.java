package org.javatraining.service;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import org.javatraining.dao.ShopDAO;
import org.javatraining.entity.Shop;

// ビジネスロジック
public class ShopService {

    private final ShopDAO dao = new ShopDAO();

    // Shopリストを取得する
    public List<Shop> getShops() throws SQLException, NamingException {
        System.out.println("[ShopService.java]:getShops Start");
        return dao.findAll();
    }

    // 店情報を取得する
    public Shop find(int productId) throws SQLException, NamingException {
        System.out.println("[ShopService.java]:find Start");
        return dao.findById(productId);
    }

    // 書籍情報を登録する
    public boolean create(Shop shop) throws SQLException, NamingException {
        System.out.println("[ShopService.java]:create Start");
    	return dao.create(shop);
    }

}