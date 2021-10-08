package org.javatraining.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.util.Base64;

import javax.servlet.http.Part;


//画像取得処理 ビジネスロジック
public class ImageService {
	
	//URL上の画像を取得する処理 ビジネスロジック
    public String getImage(String imageUrl) throws Exception {
        
        System.out.println("[ImageService.java]:getImage Start");
        
        //画像のURLを元にBase64変換コードを生成
        URL url = new URL(imageUrl);
        
        try {
            InputStream fileContent = new BufferedInputStream(url.openStream());
            byte[] byteArray = getByteArray(fileContent);
            String base64String = Base64.getEncoder().encodeToString(byteArray);
            
            System.out.println("[ImageService.java]:getImage 画像のBase64変換済コード" + base64String);
            System.out.println("[ImageService.java]:getImage End");
            return base64String;
            
        } finally {
        }
    }

	//アップロードした画像を取得する処理 ビジネスロジック
    public String uploadImage(Part filePart) throws Exception {
        
        System.out.println("[ImageService.java]:uploadImage Start");

        try {
        //アップロードした画像のBase64変換コードを生成
        InputStream fileContent = filePart.getInputStream();
        byte[] byteArray = getByteArray(fileContent);
        String base64String = Base64.getEncoder().encodeToString(byteArray);
        String contentType = filePart.getContentType();
        String image = "data:" + contentType + ";base64," + base64String;

        System.out.println("[ImageService.java]:uploadImage 画像のBase64変換済コード" + image);
        System.out.println("[ImageService.java]:uploadImage End");
        return image;
        
        } finally {
        }
    }
    
	//InputStreamの中身をByte配列に書き換えるロジック
    private static byte[] getByteArray(InputStream is) throws Exception {
        ByteArrayOutputStream b = new ByteArrayOutputStream();
        BufferedOutputStream os = new BufferedOutputStream(b);
        while (true) {
          int i = is.read();
          if (i == -1) break;
          os.write(i);
        }
        os.flush();
        os.close();
        return b.toByteArray();
      }
    
    
}