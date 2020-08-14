package org.javatraining.entity;

import java.io.Serializable;

//ユーザ情報エンティティクラス
public class Station implements Serializable {

    private String stationName;
    private String lineName;


    public String getStationName() {
        return stationName;
    }

    public void setStationName(String stationName) {
        this.stationName = stationName;
    }

    public String getLineName() {
        return lineName;
    }

    public void setLineName(String lineName) {
        this.lineName = lineName;
    }

}