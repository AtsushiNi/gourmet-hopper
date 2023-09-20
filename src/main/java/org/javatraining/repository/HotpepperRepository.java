package org.javatraining.repository;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.http.HttpClient;
import java.util.ArrayList;

import org.javatraining.entity.Shop;
import org.json.JSONArray;
import org.json.JSONObject;

public class HotpepperRepository {
	// create a client
	private final HttpClient client;

	public HotpepperRepository() {
		this.client = HttpClient.newHttpClient();
	}
	
	//お店の一覧返す
	public ArrayList<Shop> getShops(String smallAreaCode, String inputName) throws IOException, InterruptedException {
        URL url = new URL("https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=7eaca5563e5d7d8e&small_area=" + smallAreaCode +"&name=" + inputName +"&count=10&format=json");
        HttpURLConnection conn = (HttpURLConnection)url.openConnection();

        //値の取得＆出力
		StringBuilder output = new StringBuilder();
	        try(BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"))){
            while (reader.ready()) {
                output.append(reader.readLine());
            }
        }

        //結果のJSON整形
        JSONObject json = new JSONObject(output.toString());
        JSONArray shopsJson = json.getJSONObject("results").getJSONArray("shop");
        ArrayList<Shop> shops = new ArrayList<>();
        for(Object shopJson : shopsJson) {
        	Shop shop = createShop((JSONObject)shopJson);
        	shops.add(shop);
        }
        return shops;		
    }

	private Shop createShop(JSONObject json) {
        Shop shop = new Shop();
        shop.setName(json.getString("name"));
        return shop;
    }
}
