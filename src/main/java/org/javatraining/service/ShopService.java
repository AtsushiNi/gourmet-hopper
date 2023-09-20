package org.javatraining.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import org.javatraining.dao.ShopDAO;
import org.javatraining.entity.Shop;
import org.javatraining.repository.HotpepperRepository;

// ビジネスロジック
public class ShopService {

    private final ShopDAO dao = new ShopDAO();
    String inputName = null;
    
    
    // Shopリストを取得する
    public List<Shop> getShops() throws SQLException, NamingException, IOException, InterruptedException {
        System.out.println("[ShopService.java]:getShops Start");
       //apiから情報を取得
        HotpepperRepository repository = new HotpepperRepository();
        List<Shop> shops = repository.getShops("X175", inputName);
        List<Shop> allShops = new ArrayList<>();
        allShops.addAll(dao.findAll() );
        allShops.addAll(shops);
        return allShops;
    }

    // Shopを取得する
    public Shop find(int id) throws SQLException, NamingException {
        System.out.println("[ShopService.java]:find Start");
        return dao.findById(id);
    }

    // Shop情報を登録する
    public boolean create(Shop shop) throws SQLException, NamingException {
        System.out.println("[ShopService.java]:create Start");
    	return dao.create(shop);
    }

}