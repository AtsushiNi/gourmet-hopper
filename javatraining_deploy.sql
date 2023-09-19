DROP DATABASE javatraining;
CREATE DATABASE javatraining CHARACTER SET UTF8;
USE javatraining;

CREATE TABLE SHOPS(
   ID INT(10) AUTO_INCREMENT NOT NULL, 
    NAME VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
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

INSERT INTO USERS VALUE(1,"Machida","muit123");
INSERT INTO USERS VALUE(2,"Suzuki","suzuki");
INSERT INTO USERS VALUE(3,"Ozaki","ozaki");

INSERT INTO SHOPS VALUE(1,"がい屋");

INSERT INTO COMMUNITIES VALUE(1,"りんご","apple");
INSERT INTO COMMUNITIES VALUE(2,"ばなな","banana");
INSERT INTO COMMUNITIES VALUE(3,"れもん","lemon");

INSERT INTO COMMUNITIES_USERS VALUE(1,1,1);
INSERT INTO COMMUNITIES_USERS VALUE(2,1,2);
INSERT INTO COMMUNITIES_USERS VALUE(3,1,3);
