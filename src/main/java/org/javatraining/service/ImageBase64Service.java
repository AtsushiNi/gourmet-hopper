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
public class ImageBase64Service {
    
    public Image getImage(String imageUrl) throws IOException {
        
        //画像のURLを元にBase64変換コードを生成
        URL url = new URL(imageUrl);
        BufferedInputStream bis = null;
//        BufferedOutputStream bos = null;

        try {
            bis = new BufferedInputStream(url.openStream());
            String base64Code = new String(Base64.encodeBase64(IOUtils.toByteArray(bis)));

//            final byte[] buf = Base64.encodeBase64(base64Code.getBytes());
//            final FileOutputStream fos = new FileOutputStream("./test.png");
//            bos = new BufferedOutputStream(fos);
//            bos.write(buf);

        Image image = new Image();
        image.setImageCode(base64Code);

        return image;
            
        } finally {
            bis.close();
//            bos.close();
        }
    }
}