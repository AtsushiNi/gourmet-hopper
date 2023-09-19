package org.javatraining.entity;

import java.io.Serializable;

//コミュニティ情報エンティティクラス
public class Community implements Serializable {

    private int communityId;
    private String communityName;
    private String communityPassword;

    // コミュニティIDを取得する
    public int getCommunityId() {
        return communityId;
    }

    // コミュニティIDを設定する
    public void setCommunityId(int communityId) {
        this.communityId = communityId;
    }

    // コミュニティ名を取得する
    public String getCommunityName() {
        return communityName;
    }

    // コミュニティ名を設定する
    public void setCommunityName(String communityName) {
        this.communityName = communityName;
    }

    // コミュニティパスワードを取得する
    public String getCommunityPassword() {
        return communityPassword;
    }

    // コミュニティパスワードを設定する
    public void setCommunityPassword(String communityPassword) {
        this.communityPassword = communityPassword;
    }
    
        @Override
    public String toString() {
        return "Community {" +
                "communityId=" + communityId +
                ", communityName='" + communityName + '\'' +
                ", communityPassword='" + communityPassword + '\'' +
                '}';
    }

}