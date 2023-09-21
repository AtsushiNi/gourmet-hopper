package org.javatraining.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import org.javatraining.dao.ShopDAO;
import org.javatraining.entity.Shop;
import org.javatraining.repository.HotpepperRepository;

// ビジネスロジック
public class ShopService {

	private final ShopDAO dao = new ShopDAO();
	private HotpepperRepository repository = new HotpepperRepository();

	// Shopリストを取得する
	public List<Shop> getShops(String smallAreaCode, String shopName)
			throws SQLException, NamingException, IOException, InterruptedException {
		System.out.println("[ShopService.java]:getShops Start");


		// apiから情報を取得
		HotpepperRepository repository = new HotpepperRepository();
		List<Shop> shopsFromApi = repository.getShops(smallAreaCode, shopName);
		List<Shop> allShops = new ArrayList<>();
		allShops.addAll(dao.search(smallAreaCode, shopName));
		allShops.addAll(shopsFromApi);
		return allShops;
	}
    // ShopをapiIdから取得する
    public Shop find(String apiId) throws SQLException, NamingException {
        System.out.println("[ShopService.java]:find Start");
        return dao.findByApiId(apiId);
    }

	public Shop getShop(HttpServletRequest request) {
		String apiId = request.getParameter("apiId");
		Shop shopDetail = null;
		try {
			System.out.println("============");
			System.out.println(apiId);
			shopDetail = repository.getShopByApiId("J003324939");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return shopDetail;
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