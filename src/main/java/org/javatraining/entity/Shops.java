package org.javatraining.entity;

import java.io.Serializable;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

// Shopsエンティティクラス
public class Shops implements Serializable {

	@NotNull
    private int id;

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

	@Override
    public String toString() {
        return "Book {" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
