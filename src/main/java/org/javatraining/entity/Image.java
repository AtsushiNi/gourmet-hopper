package org.javatraining.entity;

import java.io.Serializable;

//Image情報エンティティクラス
public class Image implements Serializable {

    private String imageName;
    private String imageCode;


    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public String getImageCode() {
        return imageCode;
    }

    public void setImageCode(String imageCode) {
        this.imageCode = imageCode;
    }

}