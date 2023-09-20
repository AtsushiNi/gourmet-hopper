package org.javatraining.entity;

import java.io.Serializable;
import java.util.ArrayList;

import javax.validation.constraints.NotNull;

// レビューのエンティティクラス
public class Team implements Serializable {

	@NotNull
    private int id;

	@NotNull
    private String name = "";
	private Community community;
	private ArrayList<User> users;

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

	public Community getCommunity() {
		return community;
	}

	public void setCommunity(Community community) {
		this.community = community;
	}	

	public ArrayList<User> getUsers() {
		return users;
	}

	public void setUsers(ArrayList<User> users) {
		this.users = users;
	}
	
	public void addUser(User user) {
		this.users.add(user);
	}

	@Override
    public String toString() {
        return "Community {" +
                "id=" + id +
                ", name ='" + name + '\'' +
                '}';
    }
}
