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

	public int getid() {
		return id;
	}

	public void setid(int id) {
		this.id = id;
	}

	public String getname() {
		return name;
	}

	public void setname(String name) {
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
