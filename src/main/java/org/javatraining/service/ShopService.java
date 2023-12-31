package org.javatraining.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import org.javatraining.dao.ShopDAO;
import org.javatraining.entity.Shop;
import org.javatraining.repository.HotpepperRepository;

// ビジネスロジック
public class ShopService {

	private final ShopDAO shopDao = new ShopDAO();
	private HotpepperRepository repository = new HotpepperRepository();

	// Shopリストを取得する
	public List<Shop> getShops(Map<String, String> areaCodes, String shopName, int communityId)
			throws SQLException, NamingException, IOException, InterruptedException {
		System.out.println("[ShopService.java]:getShops Start");


		// apiから情報を取得
		HotpepperRepository repository = new HotpepperRepository();
		List<Shop> apiShops = repository.getShops(areaCodes, shopName);
		List<Shop> dbShops = shopDao.search(areaCodes, shopName, communityId);
		List<Shop> allShops = new ArrayList<>();
		allShops.addAll(dbShops);
		
		for (Shop apiShop : apiShops) {
		    Shop dbShop = null;
		    // apiShopがDBに存在するかを調べる
		    for (Shop inDbShop : dbShops) {
		        if (apiShop.getApiId().equals(inDbShop.getApiId())) {
		            dbShop = inDbShop;
		            break;
		        }
		    }
		    if (dbShop == null) {
		        allShops.add(apiShop); // DBになければリストの最後に加える
		    }else { // DBにあれば情報をマージする
				dbShop.setPhoto(apiShop.getPhoto());
				dbShop.setCatchMessage(apiShop.getCatchMessage());
				dbShop.setBudgetAve(apiShop.getBudgetAve());
				dbShop.setLat(apiShop.getLat());
				dbShop.setLng(apiShop.getLng());
		    }
		}
		System.out.println("allShops: " + allShops);
		
		return allShops;
	}
    // ShopをapiIdから取得する
    public Shop find(String apiId) throws SQLException, NamingException {
        System.out.println("[ShopService.java]:find Start");
        return shopDao.findByApiId(apiId);
    }

	public Shop getShop(HttpServletRequest request) {
		String apiId = request.getParameter("apiId");
		System.out.println("[ShopService.java] getShop :apiId "+ apiId);
		Shop shopDetail = null;
		try {
			shopDetail = repository.getShopByApiId(apiId);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return shopDetail;
	}
	
	// Shop情報を登録する
    public boolean create(Shop shop) throws SQLException, NamingException {
        System.out.println("[ShopService.java]:create Start");
    	return shopDao.create(shop);
    }
    
}