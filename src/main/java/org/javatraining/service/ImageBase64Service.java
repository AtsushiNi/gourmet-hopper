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


//API処理 ビジネスロジック
public class ImageBase64Service {
    
    public List<Station> search(String postalCode) throws IOException {
        
        //外部APIに接続
        URL url = new URL(image_url);
        HttpURLConnection conn = (HttpURLConnection)url.openConnection();

        //値の取得＆出力
		StringBuilder output = new StringBuilder();
		
        try(BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()))){
            while (reader.ready()) {
                output.append(reader.readLine());
            }
        }

    //結果のJSON整形
    JSONObject json = new JSONObject(output.toString()); 
    JSONArray locations = json.getJSONObject("response").getJSONArray("station");
        
    //駅情報オブジェクトの List を生成
    List<Station> stations = new ArrayList<>();
    
    for (int i = 0; i < locations.length(); i++) {

        JSONObject data = locations.getJSONObject(i);
        // 駅名、路線名を取得
        String StationName = data.getString("name");
        String lineName = data.getString("line");

        // Stationオブジェクトを作成しリスト追加
        Station station = new Station();
        station.setStationName(StationName);
        station.setLineName(lineName);
        stations.add(station);        
        }
                
        return stations; 
    }
}