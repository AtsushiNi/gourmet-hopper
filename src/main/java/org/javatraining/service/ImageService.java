package org.javatraining.service;

import java.net.URL;
import java.io.IOException;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import org.javatraining.entity.Image;

//画像取得処理 ビジネスロジック
public class ImageService {
    
    public Image getImage(String imageUrl) throws IOException {
        
        System.out.println("[ImageService.java]:getImage Start");
        //画像のURLを元にBase64変換コードを生成
        URL url = new URL(imageUrl);
        BufferedInputStream bis = null;

        try {
            bis = new BufferedInputStream(url.openStream());
            String base64Code = new String(Base64.encodeBase64(IOUtils.toByteArray(bis)));

        Image image = new Image();
        image.setImageCode(base64Code);
        System.out.println("[ImageService.java]:getImage image:"+ image);

        System.out.println("[ImageService.java]:getImage End");
        return image;
            
        } finally {
            bis.close();
        }
    }
}