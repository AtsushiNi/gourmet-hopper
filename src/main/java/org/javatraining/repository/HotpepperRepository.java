package org.javatraining.repository;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class HotpepperRepository {
	// create a client
	private final HttpClient client;

	public HotpepperRepository() {
		this.client = HttpClient.newHttpClient();
	}
	
	public String getJsonString() throws IOException, InterruptedException {
        // リクエストを作成
        HttpRequest request = HttpRequest
        		.newBuilder(URI.create("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=7eaca5563e5d7d8e&large_area=Z011&format=json"))
                .build();
        // 同期API呼び出し
        HttpResponse<String> response = this.client.send(request, HttpResponse.BodyHandlers.ofString());
        System.out.println(response.body()); // 受信したJSON文字列を確認
        return response.body();
    }	
}
