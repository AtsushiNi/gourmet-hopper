package org.javatraining.entity;

import java.io.Serializable;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

// Shopエンティティクラス
public class Shop implements Serializable {

	@NotNull
    private int id;
	private String apiId;
	private String smallAreaCode;
	private String access;
	private String address;
	private String card;
	private String catchMessage;
	private String photo;
	
	@NotNull
    @Size(max = 100, message= "店名は100文字以内にしてください。")
    private String name = "";
	
	private double lat;
	private double lng;

    public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public String getSmallAreaCode() {
		return smallAreaCode;
	}

	public void setSmallAreaCode(String smallAreaCode) {
		this.smallAreaCode = smallAreaCode;
	}
	
	public String getAccess() {
		return access;
	}

	public void setAccess(String access) {
		this.access = access;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public String getCatchMessage() {
		return catchMessage;
	}

	public void setCatchMessage(String catchMessage) {
		this.catchMessage = catchMessage;
	}

	public String getApiId() {
		return apiId;
	}

	public void setApiId(String apiId) {
		this.apiId = apiId;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Override
    public String toString() {
        return "Shop {" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", apiId'" + apiId + '\'' +
                '}';
    }
}
