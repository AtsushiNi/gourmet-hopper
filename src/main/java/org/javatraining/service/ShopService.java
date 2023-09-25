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

	private final ShopDAO shopDao = new ShopDAO();
	private HotpepperRepository repository = new HotpepperRepository();

	// Shopリストを取得する
	public List<Shop> getShops(String smallAreaCode, String shopName)
			throws SQLException, NamingException, IOException, InterruptedException {
		System.out.println("[ShopService.java]:getShops Start");


		// apiから情報を取得
		HotpepperRepository repository = new HotpepperRepository();
		List<Shop> apiShops = repository.getShops(smallAreaCode, shopName);
		List<Shop> dbShops = shopDao.search(smallAreaCode, shopName);
		List<Shop> allShops = new ArrayList<>();
		allShops.addAll(dbShops);
		
		for (Shop apiShop : apiShops) {
		    Shop dbShop = null;
		    for (Shop inDbShop : dbShops) {
		        if (apiShop.getApiId().equals(inDbShop.getApiId())) {
		            dbShop = inDbShop;
		            break;
		        }
		    }
		    if (dbShop == null) {
		        allShops.add(apiShop);
		    }else {
				dbShop.setPhoto(apiShop.getPhoto());
				dbShop.setBudgetAve(apiShop.getBudgetAve());
		    }
		}
		
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