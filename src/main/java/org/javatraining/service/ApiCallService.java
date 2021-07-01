package org.javatraining.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import org.javatraining.entity.Station;
import org.json.JSONObject;
import org.json.JSONArray;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


//API実行 ビジネスロジック
public class ApiCallService {
    
    public List<Station> search(String postalCode) throws IOException {
        
        System.out.println("[ApiCallAction.java]:search Start");
        
        //郵便番号から最寄り駅を検索するAPIに接続
        //APIの仕様は　http://geoapi.heartrails.com/api.html#nearest　に記載
        URL url = new URL("http://geoapi.heartrails.com/api/json?method=getStations&postal=" + postalCode );
        HttpURLConnection conn = (HttpURLConnection)url.openConnection();

        //値の取得＆出力
		StringBuilder output = new StringBuilder();
        try(BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()))){
            while (reader.ready()) {
                output.append(reader.readLine());
            }
        }
 
        System.out.println("[ApiCallAction.java]:search API実行結果:"+ output);
        System.out.println("[ApiCallAction.java]:search API実行結果:"+ output);

        //結果のJSON整形
        JSONObject json = new JSONObject(output.toString()); 
        JSONArray locations = json.getJSONObject("response").getJSONArray("station");
        System.out.println("[ApiCallAction.java]:search API実行結果のJson整形後:"+ json);
    
        //駅情報オブジェクトの List を生成
        List<Station> stations = new ArrayList<>();
    
    for (int i = 0; i < locations.length(); i++) {

        JSONObject data = locations.getJSONObject(i);
        // JSON整形済の実行結果から駅名、路線名を取得
        String StationName = data.getString("name");
        String lineName = data.getString("line");

        // Stationオブジェクトを作成しリスト追加
        Station station = new Station();
        station.setStationName(StationName);
        station.setLineName(lineName);
        stations.add(station);        
        }
    
    	System.out.println("[ApiCallAction.java]:search stations:"+ stations);
        return stations; 
    }
}