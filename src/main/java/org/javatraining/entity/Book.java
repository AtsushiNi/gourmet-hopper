package org.javatraining.entity;

import java.io.Serializable;

// 在庫情報エンティティクラス
public class Book implements Serializable {

    private int productId;
    private String bookName = "";
    private String author = "";
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
    public String getBookName() {
        return bookName;
    }

    // 商品名を設定する
    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    // 著者名を取得する
    public String getAuthor() {
        return author;
    }

    // 著者名を設定する
    public void setAuthor(String author) {
        this.author = author;
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
