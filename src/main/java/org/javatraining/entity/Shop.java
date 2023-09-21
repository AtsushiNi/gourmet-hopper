package org.javatraining.entity;

import java.io.Serializable;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

// Shopエンティティクラス
public class Shop implements Serializable {

	@NotNull
    private int id;
	private String smallAreaCode;
	private String apiId;

	@NotNull
    @Size(max = 100, message= "店名は100文字以内にしてください。")
    private String name = "";

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

	public String getSmallAreaCode() {
		return smallAreaCode;
	}

	public void setSmallAreaCode(String smallAreaCode) {
		this.smallAreaCode = smallAreaCode;
	}

	public String getApiId() {
		return apiId;
	}

	public void setApiId(String apiId) {
		this.apiId = apiId;
	}

	@Override
    public String toString() {
        return "Book {" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", smallAreaCode'" + smallAreaCode + '\'' +
                ", apiId'" + apiId + '\'' +
                '}';
    }
}
