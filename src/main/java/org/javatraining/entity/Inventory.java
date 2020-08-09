package org.javatraining.entity;

import java.io.Serializable;

// 在庫情報エンティティクラス
public class Inventory implements Serializable {

    private int productId;
    private String productName = "";
    private int price;
    private int amount;
    private String location = "";
    private String description = "";

    // 商品 ID を取得する
    public int getProductId() {
        return productId;
    }

    // 商品 ID を設定する
    public void setProductId(int productId) {
        this.productId = productId;
    }

    // 商品名を取得する
    public String getProductName() {
        return productName;
    }

    // 商品名を設定する
    public void setProductName(String productName) {
        this.productName = productName;
    }

    // 単価を取得する
    public int getPrice() {
        return price;
    }

    // 単価を設定する
    public void setPrice(int price) {
        this.price = price;
    }

    // 在庫数量を取得する
    public int getAmount() {
        return amount;
    }

    // 在庫数量を設定する
    public void setAmount(int amount) {
        this.amount = amount;
    }

    // 保管場所を取得する
    public String getLocation() {
        return location;
    }

    // 保管場所を設定する
    public void setLocation(String location) {
        this.location = location;
    }

    // 商品説明を取得する
    public String getDescription() {
        return description;
    }

    // 商品説明を設定する
    public void setDescription(String description) {
        this.description = description;
    }
}
