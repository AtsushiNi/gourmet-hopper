package org.javatraining.service;

import org.javatraining.repository.HotpepperRepository;

//ログイン処理 ビジネスロジック
public class SearchService {
	
	// APIからお店を取得するサンプルコード
	public void search() {        
        System.out.println("================================");
        HotpepperRepository repository = new HotpepperRepository();
        try {
        	System.out.println(repository.getShops("X175", "メゾン"));
        } catch(Exception e) {
        	e.printStackTrace();
        }
	}
}