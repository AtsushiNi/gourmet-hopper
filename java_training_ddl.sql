DROP DATABASE training;
CREATE DATABASE training;
USE training;

CREATE TABLE INVENTORY_INFO(
    PROD_ID INT(10) AUTO_INCREMENT NOT NULL, 
    PROD_NAME VARCHAR(30) NOT NULL,
    PRICE INT(10) NOT NULL,
    AMOUNT INT(10) NOT NULL,
    LOCATION VARCHAR(30) NOT NULL,
    DESCRIPTION VARCHAR(100),
    PRIMARY KEY (PROD_ID)
    );

CREATE TABLE USER_MASTER(
    USER_ID INT(10) AUTO_INCREMENT NOT NULL, 
    USER_NAME VARCHAR(30) NOT NULL,
    PASSWORD VARCHAR(30) NOT NULL,
    PRIMARY KEY (USER_ID)
    );

INSERT INTO USER_MASTER VALUE(1,"Machida","machida");
INSERT INTO USER_MASTER VALUE(2,"Suzuki","suzuki");
INSERT INTO USER_MASTER VALUE(3,"Ozaki","ozaki");

INSERT INTO INVENTORY_INFO VALUE(1,"PC","200000","10","東京","WindowsPCです");
INSERT INTO INVENTORY_INFO VALUE(2,"iPhone","100000","20","大阪","最新のiPhoneです");