DROP DATABASE javatraining;
CREATE DATABASE javatraining CHARACTER SET UTF8;
USE javatraining;

CREATE TABLE SHOPS(
   ID INT(10) AUTO_INCREMENT NOT NULL, 
    NAME VARCHAR(30) NOT NULL,
    PRIMARY KEY (ID)
    );

CREATE TABLE USERS(
    ID INT(10) AUTO_INCREMENT NOT NULL, 
    NAME VARCHAR(30) NOT NULL,
    PASSWORD VARCHAR(30) NOT NULL,
    PRIMARY KEY (ID)
    );
    
CREATE TABLE COMMUNITIES(
	ID INT(10) AUTO_INCREMENT NOT NULL, 
    NAME VARCHAR(30) NOT NULL,
    PASSWORD VARCHAR(30) NOT NULL,
    PRIMARY KEY (ID)
    );
    
CREATE TABLE COMMUNITIES_USERS(
	ID INT(10) AUTO_INCREMENT NOT NULL, 
    USER_ID INT(10) NOT NULL,
    COMMUNITY_ID INT(10) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (COMMUNITY_ID) REFERENCES COMMUNITIES (ID),
    FOREIGN KEY (USER_ID) REFERENCES USERS (ID)
    );
    
CREATE TABLE REVIEWS(
	ID INT(10) AUTO_INCREMENT NOT NULL,
	TITLE VARCHAR(30),
	COMMENT VARCHAR(300),
	USER_ID INT(10) NOT NULL,
	SHOP_ID INT(10) NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY(USER_ID) REFERENCES USERS(ID),
	FOREIGN KEY(SHOP_ID) REFERENCES SHOPS(ID)
	);


INSERT INTO USERS VALUE(1,"Machida","muit123");
INSERT INTO USERS VALUE(2,"Suzuki","suzuki");
INSERT INTO USERS VALUE(3,"Ozaki","ozaki");

INSERT INTO SHOPS VALUE(1,"がい屋");
INSERT INTO SHOPS VALUE(2,"たけ屋");

INSERT INTO COMMUNITIES VALUE(1,"りんご","apple");
INSERT INTO COMMUNITIES VALUE(2,"ばなな","banana");
INSERT INTO COMMUNITIES VALUE(3,"れもん","lemon");

INSERT INTO COMMUNITIES_USERS VALUE(1,1,1);
INSERT INTO COMMUNITIES_USERS VALUE(2,1,2);
INSERT INTO COMMUNITIES_USERS VALUE(3,2,3);
INSERT INTO COMMUNITIES_USERS VALUE(4,3,1);

INSERT INTO REVIEWS VALUE(1, "初来店", "また行きたい。", 1, 1);
INSERT INTO REVIEWS VALUE(2, "2度目の来店", "まあまあ。", 2, 1);
INSERT INTO REVIEWS VALUE(3, "3度目の来店", "もう行かない。", 3, 1);
