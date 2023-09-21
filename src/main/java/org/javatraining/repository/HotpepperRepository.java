package org.javatraining.repository;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.javatraining.entity.Shop;
import org.json.JSONArray;
import org.json.JSONObject;

public class HotpepperRepository {
	// create a client
	private final HttpClient client;
	
	private static final int MAX_RETRY_NUM = 10; 

	public HotpepperRepository() {
		this.client = HttpClient.newHttpClient();
	}
	
	//お店の一覧返す
	public ArrayList<Shop> getShops(String smallAreaCode, String shopName) throws IOException, InterruptedException {
		// URLを組み立て
		String baseURL = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=7eaca5563e5d7d8e";
		URL url = null;
		if(shopName != null) {
			@SuppressWarnings("deprecation")
			String encodedSearchName = URLEncoder.encode(shopName, "UTF-8");
			url = new URL(baseURL + "&small_area=" + smallAreaCode +"&name=" + encodedSearchName +"&count=10&format=json");
		} else {
			url = new URL(baseURL + "&small_area=" + smallAreaCode +"&count=10&format=json");			
		}

		// リクエスト実行
        String response = sendRequest(url);

        //結果のJSON整形
        JSONObject json = new JSONObject(response);
        JSONArray shopsJson = json.getJSONObject("results").getJSONArray("shop");
        ArrayList<Shop> shops = new ArrayList<>();
        for(Object shopJson : shopsJson) {
        	Shop shop = createShop((JSONObject)shopJson);
        	shops.add(shop);
        }
        return shops;		
    }

	// エリアコードの一覧を取得する
	public Map<String, String> getSmallAreas() throws IOException, InterruptedException {
        URL url = new URL("https://webservice.recruit.co.jp/hotpepper/small_area/v1/?key=7eaca5563e5d7d8e&format=json");

        String response = sendRequest(url);

        //結果のJSON整形
	    JSONObject json = new JSONObject(response);
        JSONArray areasJson = json.getJSONObject("results").getJSONArray("small_area");
		Map<String, String> areas = new HashMap<>();
		for(Object areaJson : areasJson) {
			JSONObject data = (JSONObject)areaJson;
			areas.put(data.getString("code"),data.getString("name"));
		}
		
		return areas;
	}
	
	private Shop createShop(JSONObject json) {
        Shop shop = new Shop();
        shop.setName(json.getString("name"));
        shop.setApiId(json.getString("id"));
        return shop;
    }
	
	// 指定したURLにアクセスして、レスポンスを得る
	private String sendRequest(URL url) throws IOException, InterruptedException {
		StringBuilder output = null;

        // API通信が成功するまで繰り返し(最大でMAX_RETRY_NUM回)
        for(int num = MAX_RETRY_NUM; num>0; num--) {
	        HttpURLConnection conn = (HttpURLConnection)url.openConnection();
	
	        //値の取得＆出力
			output = new StringBuilder();
	        try(BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"))){
	            while (reader.ready()) {
	                output.append(reader.readLine());
	            }
	        }
	        
	        if(!output.toString().isEmpty()) break;
        }

        return output.toString();
	}
}
