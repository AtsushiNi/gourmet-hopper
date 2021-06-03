package org.javatraining.entity;

import java.io.Serializable;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

// 在庫情報エンティティクラス
public class Book implements Serializable {

	@NotNull
    private int productId;

	@NotNull
    @Size(max = 100, message= "書籍名は100文字以内にしてください。")
    private String bookName = "";

	@NotNull
    @Size(max = 100,message= "著者名は100文字以内にしてください。")
    private String author = "";

	@Min(value = 0,message="数量は0以上を入力してください。")
    private int amount;

	private String location = "";

	@Size(max = 100,message= "説明文は100文字以内にしてください。")
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
