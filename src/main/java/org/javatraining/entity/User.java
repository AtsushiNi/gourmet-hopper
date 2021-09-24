package org.javatraining.entity;

import java.io.Serializable;

//ユーザ情報エンティティクラス
public class User implements Serializable {

    private int userId;
    private String userName;
    private String password;

    // ユーザIDを取得する
    public int getUserId() {
        return userId;
    }

    // ユーザIDを設定する
    public void setUserId(int userId) {
        this.userId = userId;
    }

    // ユーザIDを取得する
    public String getUserName() {
        return userName;
    }

    // ユーザIDを設定する
    public void setUserName(String userName) {
        this.userName = userName;
    }

    // ユーザIDを取得する
    public String getPassword() {
        return password;
    }

    // ユーザIDを設定する
    public void setPassword(String password) {
        this.password = password;
    }
    
        @Override
    public String toString() {
        return "User {" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                '}';
    }

}