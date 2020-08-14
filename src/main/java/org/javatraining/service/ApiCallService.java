package org.javatraining.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import org.javatraining.entity.Station;
import org.json.JSONObject;
import java.io.IOException;


//ログイン処理 ビジネスロジック
public class ApiCallService {
    
    public Station search(String postalCode) throws IOException {
        //外部APIに接続
        URL url = new URL("http://geoapi.heartrails.com/api/json?method=searchByPostal&postal=" + postalCode );
        HttpURLConnection conn = (HttpURLConnection)url.openConnection();

		StringBuilder output = new StringBuilder();
		String line;
		
        //値の取得＆出力(パース無し）
        try(BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "Windows-31J"))){
        while ((line = reader.readLine()) != null) {
                output.append(line);
        }
        }
    JSONObject json = new JSONObject(output); 
    String StationName = json.getJSONObject("body").getString("name");
    String lineName = json.getJSONObject("body").getString("line");
 
                 // Userオブジェクトを作成して返す
                Station station = new Station();
                station.setStationName(StationName);
                station.setLineName(lineName);
                return station;    
    }
}