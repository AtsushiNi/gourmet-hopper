package org.javatraining.entity;

import java.io.Serializable;

//コミュニティ情報エンティティクラス
public class CommunitiesUsers implements Serializable {

    private int id;
    private int communityId;
    private int userId;

    // コミュニティーズユーザーズIDを取得する
    public int getId() {
        return id;
    }

    // コミュニティーズユーザーズIDを設定する
    public void setId(int id) {
        this.id = id;
    }

    // コミュニティIDを取得する
    public int getCommunityId() {
        return communityId;
    }

    // コミュニティIDを設定する
    public void setCommunityId(int communityId) {
        this.communityId = communityId;
    }

    // ユーザーIDを取得する
    public int getUserId() {
        return userId;
    }

    // ユーザーIDを設定する
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
        @Override
    public String toString() {
        return "CommunitiesUsers {" +
                "id=" + id +
                ", communityId='" + communityId + '\'' +
                ", userId='" + userId + '\'' +
                '}';
    }

}