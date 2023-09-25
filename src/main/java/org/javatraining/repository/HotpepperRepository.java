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
import java.util.List;
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
	
	//お店の詳細返す
	public Shop getShopByApiId(String apiId) throws IOException, InterruptedException {
		// URLを組み立て
		String baseURL = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=7eaca5563e5d7d8e";
		URL url = new URL(baseURL + "&id=" + apiId + "&format=json");
		System.out.println(url);
		// リクエスト実行
        String response = sendRequest(url);
        //結果のJSON整形
        JSONObject json = new JSONObject(response);
        JSONArray shopsJson = json.getJSONObject("results").getJSONArray("shop");
        Shop shop = null;
        for(Object shopJson : shopsJson) {
        	shop = createShopFromApi((JSONObject)shopJson);
        }
        return shop;		
    }


	// 中エリアコードの一覧を取得する(東京都内の)
	public List<Map<String, String>> getMiddleAreas() throws IOException, InterruptedException {
        URL url = new URL("https://webservice.recruit.co.jp/hotpepper/small_area/v1/?key=7eaca5563e5d7d8e&large_area=Z011&format=json");

        String response = sendRequest(url);

        //結果のJSON整形
	    JSONObject json = new JSONObject(response);
        JSONArray areasJson = json.getJSONObject("results").getJSONArray("middle_area");
		ArrayList<Map<String, String>> areas = new ArrayList<>();
		for(Object areaJson : areasJson) {
			JSONObject data = (JSONObject)areaJson;
			Map<String, String> area = new HashMap<>();
			area.put("code", data.getString("code"));
			area.put("name", data.getString("name"));
			areas.add(area);
		}
		
		return areas;
	}
	
	// 小エリアコードの一覧を取得する
	public List<Map<String, String>> getSmallAreas(String middleAreaCode) throws IOException, InterruptedException {
        URL url = new URL("https://webservice.recruit.co.jp/hotpepper/small_area/v1/?key=7eaca5563e5d7d8e&middle_area="+middleAreaCode+"&format=json");

        String response = sendRequest(url);

        //結果のJSON整形
	    JSONObject json = new JSONObject(response);
        JSONArray areasJson = json.getJSONObject("results").getJSONArray("small_area");
		ArrayList<Map<String, String>> areas = new ArrayList<>();
		for(Object areaJson : areasJson) {
			JSONObject data = (JSONObject)areaJson;
			Map<String, String> area = new HashMap<>();
			area.put("code", data.getString("code"));
			area.put("name", data.getString("name"));
			areas.add(area);
		}
		
		return areas;
	}
	
	private Shop createShop(JSONObject json) {
        Shop shop = new Shop();
        shop.setName(json.getString("name"));
        shop.setApiId(json.getString("id"));
        shop.setLat(json.getDouble("lat"));
        shop.setLng(json.getDouble("lng"));
        shop.setPhoto(json.getJSONObject("photo").getJSONObject("pc").getString("l"));
        shop.setBudgetAve(json.getJSONObject("budget").getString("average"));
        return shop;
    }
	
	private Shop createShopFromApi(JSONObject json) {
        Shop shop = new Shop();
        shop.setName(json.getString("name"));
        shop.setApiId(json.getString("id"));
        shop.setLat(json.getDouble("lat"));
        shop.setLng(json.getDouble("lng"));
        shop.setAccess(json.getString("access"));
        shop.setAddress(json.getString("address"));
        shop.setCard(json.getString("card"));
        shop.setCatchMessage(json.getString("catch"));
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
