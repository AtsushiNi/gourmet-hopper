package org.javatraining.entity;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

// レビューエンティティクラス
public class Review implements Serializable {

	@NotNull
    private int id;

	@NotNull
    private String title = "";
	private String comment = "";

    public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

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

	@Override
    public String toString() {
        return "Book {" +
                "id=" + id +
                ", title ='" + title + '\'' +
                ", comment ='" + comment + '\'' +
                '}';
    }
}
