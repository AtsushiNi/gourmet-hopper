package org.javatraining.entity;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

// レビューのエンティティクラス
public class Review implements Serializable {

	@NotNull
    private int id;

	@NotNull
    private String title = "";
	private int rating;
	private String budget;
	private boolean forParty;
	private boolean forReception;
	private boolean forDate;
	private boolean tabaco;
	private boolean free;
	private boolean partySpace;
	private boolean reservation;
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
	
	
    public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getBudget() {
		return budget;
	}

	public void setBudget(String budget) {
		this.budget = budget;
	}

	public boolean isForParty() {
		return forParty;
	}

	public void setForParty(boolean forParty) {
		this.forParty = forParty;
	}

	public boolean isForReception() {
		return forReception;
	}

	public void setForReception(boolean forReception) {
		this.forReception = forReception;
	}

	public boolean isForDate() {
		return forDate;
	}

	public void setForDate(boolean forDate) {
		this.forDate = forDate;
	}

	public boolean isTabaco() {
		return tabaco;
	}

	public void setTabaco(boolean tabaco) {
		this.tabaco = tabaco;
	}

	public boolean isFree() {
		return free;
	}

	public void setFree(boolean free) {
		this.free = free;
	}

	public boolean isPartySpace() {
		return partySpace;
	}

	public void setPartySpace(boolean partySpace) {
		this.partySpace = partySpace;
	}

	public boolean isReservation() {
		return reservation;
	}

	public void setReservation(boolean reservation) {
		this.reservation = reservation;
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
