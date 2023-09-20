package org.javatraining.entity;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

// レビューのエンティティクラス
public class Review implements Serializable {

	@NotNull
    private int id;

	@NotNull
    private String title = "";
	private String comment = "";
	private int userId;
	private int shopId;

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
    public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
	}

	@Override
    public String toString() {
        return "Book {" +
                "id=" + id +
                ", title ='" + title + '\'' +
                ", comment ='" + comment + '\'' +
                '}';
    }
}
