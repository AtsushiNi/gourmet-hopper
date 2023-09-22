DROP DATABASE javatraining;
CREATE DATABASE javatraining CHARACTER SET UTF8;
USE javatraining;

CREATE TABLE SHOPS(
   ID INT(10) AUTO_INCREMENT NOT NULL, 
    NAME VARCHAR(30) NOT NULL,
    SMALL_AREA_CODE VARCHAR(30) ,
    API_ID VARCHAR(30) ,
    LAT DOUBLE,
    LNG DOUBLE,
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
	TITLE VARCHAR(40),
	REVIEW VARCHAR(300),
	USER_ID INT(10) NOT NULL,
	SHOP_ID INT(10) NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY(USER_ID) REFERENCES USERS(ID),
	FOREIGN KEY(SHOP_ID) REFERENCES SHOPS(ID)
	);
	
CREATE TABLE TEAMS(
	ID INT(10) AUTO_INCREMENT NOT NULL,
	NAME VARCHAR(30) NOT NULL,
	COMMUNITY_ID INT(10) NOT NULL,
	PRIMARY KEY (ID),
    FOREIGN KEY (COMMUNITY_ID) REFERENCES COMMUNITIES (ID)
	);

CREATE TABLE TEAMS_USERS(
	ID INT(10) AUTO_INCREMENT NOT NULL,
	TEAM_ID INT(10) NOT NULL,
    USER_ID INT(10) NOT NULL,
	PRIMARY KEY (ID),
    FOREIGN KEY (TEAM_ID) REFERENCES TEAMS (ID),
	FOREIGN KEY(USER_ID) REFERENCES USERS(ID)
	);

CREATE TABLE EVENTS(
	ID INT(10) AUTO_INCREMENT NOT NULL,
	TEAM_ID INT(10) NOT NULL,
	SHOP_ID INT(10) NOT NULL,
	PRIMARY KEY (ID),
    FOREIGN KEY (TEAM_ID) REFERENCES TEAMS (ID),
    FOREIGN KEY (SHOP_ID) REFERENCES SHOPS (ID)
	);

INSERT INTO USERS VALUE(1,"Takei","takei");
INSERT INTO USERS VALUE(2,"Suzuki","suzuki");
INSERT INTO USERS VALUE(3,"Ozaki","ozaki");
INSERT INTO USERS VALUE(4,"Sasaki","sasaki");
INSERT INTO USERS VALUE(5,"Murata","murata");
INSERT INTO USERS VALUE(6,"Okada","okada");
INSERT INTO USERS VALUE(7,"Nomura","nomura");
INSERT INTO USERS VALUE(8,"Matsumoto","matsumoto");
INSERT INTO USERS VALUE(9,"Inoue","inoue");
INSERT INTO USERS VALUE(10,"Yoshida","yoshida");
INSERT INTO USERS VALUE(11,"Fujimoto","fujimoto");
INSERT INTO USERS VALUE(12,"Kawaguchi","kawaguchi");
INSERT INTO USERS VALUE(13,"Okamoto","okamoto");
INSERT INTO USERS VALUE(14,"Morita","morita");
INSERT INTO USERS VALUE(15,"Shimizu","shimizu");
INSERT INTO USERS VALUE(16,"Nakata","nakata");
INSERT INTO USERS VALUE(17,"Ogawa","ogawa");
INSERT INTO USERS VALUE(18,"Tamura","tamura");
INSERT INTO USERS VALUE(19,"Kikuchi","kikuchi");
INSERT INTO USERS VALUE(20,"Sugiyama","sugiyama");
INSERT INTO USERS VALUE(21,"Takagi","takagi");
INSERT INTO USERS VALUE(22,"Aoki","aoki");
INSERT INTO USERS VALUE(23,"Takahashi","takahashi");
INSERT INTO USERS VALUE(24,"Tanaka","tanaka");
INSERT INTO USERS VALUE(25,"Yamamoto","yamamoto");
INSERT INTO USERS VALUE(26,"Sato","sato");
INSERT INTO USERS VALUE(27,"Nakamura","nakamura");
INSERT INTO USERS VALUE(28,"Ito","ito");
INSERT INTO USERS VALUE(29,"Watanabe","watanabe");
INSERT INTO USERS VALUE(30,"Kato","kato");

INSERT INTO SHOPS VALUE(1,"Maison de MURA メゾン ド ムラ中野店","X175","J001192710", 35.7074540574, 139.6653579201);
INSERT INTO SHOPS VALUE(2,"アティックルーム 中野","X175","J003324939", 35.7065247369, 139.6660756742);
INSERT INTO SHOPS VALUE(3,"0秒レモンサワー 仙台ホルモン焼肉酒場 ときわ亭 中野店","X175","J003599955", 35.7086395082, 139.6664344477);
INSERT INTO SHOPS VALUE(4,"【全席喫煙可能】 イタめし酒場Viva (ビバ)","X175","J003298105", 35.7052912328, 139.6648794365);
INSERT INTO SHOPS VALUE(5,"豊洲市場 さかな酒場 魚星中野駅 北口店","X175","J000036282", 35.7076415633, 139.6663678267);

INSERT INTO COMMUNITIES VALUE(1,"北海道","hokkaido");
INSERT INTO COMMUNITIES VALUE(2,"大学","university");
INSERT INTO COMMUNITIES VALUE(3,"SLEEP銀行","sleep");

INSERT INTO COMMUNITIES_USERS VALUE(1,1,1);
INSERT INTO COMMUNITIES_USERS VALUE(2,1,2);
INSERT INTO COMMUNITIES_USERS VALUE(3,1,3);
INSERT INTO COMMUNITIES_USERS VALUE(4,2,3);
INSERT INTO COMMUNITIES_USERS VALUE(5,3,3);
INSERT INTO COMMUNITIES_USERS VALUE(6,4,3);
INSERT INTO COMMUNITIES_USERS VALUE(7,5,3);
INSERT INTO COMMUNITIES_USERS VALUE(8,6,3);
INSERT INTO COMMUNITIES_USERS VALUE(9,7,3);
INSERT INTO COMMUNITIES_USERS VALUE(10,8,3);
INSERT INTO COMMUNITIES_USERS VALUE(11,9,3);
INSERT INTO COMMUNITIES_USERS VALUE(12,10,3);
INSERT INTO COMMUNITIES_USERS VALUE(13,11,3);
INSERT INTO COMMUNITIES_USERS VALUE(14,12,3);
INSERT INTO COMMUNITIES_USERS VALUE(15,13,3);
INSERT INTO COMMUNITIES_USERS VALUE(16,14,3);
INSERT INTO COMMUNITIES_USERS VALUE(17,15,3);
INSERT INTO COMMUNITIES_USERS VALUE(18,16,2);
INSERT INTO COMMUNITIES_USERS VALUE(19,17,2);
INSERT INTO COMMUNITIES_USERS VALUE(20,18,2);
INSERT INTO COMMUNITIES_USERS VALUE(21,19,2);
INSERT INTO COMMUNITIES_USERS VALUE(22,20,2);
INSERT INTO COMMUNITIES_USERS VALUE(23,21,2);
INSERT INTO COMMUNITIES_USERS VALUE(24,22,2);
INSERT INTO COMMUNITIES_USERS VALUE(25,23,2);
INSERT INTO COMMUNITIES_USERS VALUE(26,24,2);
INSERT INTO COMMUNITIES_USERS VALUE(27,25,1);
INSERT INTO COMMUNITIES_USERS VALUE(28,26,1);
INSERT INTO COMMUNITIES_USERS VALUE(29,27,1);
INSERT INTO COMMUNITIES_USERS VALUE(30,28,1);
INSERT INTO COMMUNITIES_USERS VALUE(31,29,1);
INSERT INTO COMMUNITIES_USERS VALUE(32,30,1);

INSERT INTO REVIEWS VALUE(1, "Maison de MURA メゾン ド ムラ中野店のレビュー", "最高", 1, 1);
INSERT INTO REVIEWS VALUE(2, "Maison de MURA メゾン ド ムラ中野店のレビュー", "最高", 2, 1);
INSERT INTO REVIEWS VALUE(3, "Maison de MURA メゾン ド ムラ中野店のレビュー", "最高", 3, 1);
INSERT INTO REVIEWS VALUE(4, "Maison de MURA メゾン ド ムラ中野店のレビュー", "最高", 4, 1);
INSERT INTO REVIEWS VALUE(5, "Maison de MURA メゾン ド ムラ中野店のレビュー", "最高", 5, 1);
INSERT INTO REVIEWS VALUE(6, "Maison de MURA メゾン ド ムラ中野店のレビュー", "最高", 6, 1);
INSERT INTO REVIEWS VALUE(7, "Maison de MURA メゾン ド ムラ中野店のレビュー", "最高", 7, 1);
INSERT INTO REVIEWS VALUE(8, "Maison de MURA メゾン ド ムラ中野店のレビュー", "最高", 8, 1);
INSERT INTO REVIEWS VALUE(9, "Maison de MURA メゾン ド ムラ中野店のレビュー", "最高", 9, 1);
INSERT INTO REVIEWS VALUE(10, "Maison de MURA メゾン ド ムラ中野店のレビュー", "最高", 10, 1);
INSERT INTO REVIEWS VALUE(11, "Maison de MURA メゾン ド ムラ中野店のレビュー", "最高", 11, 1);
INSERT INTO REVIEWS VALUE(12, "Maison de MURA メゾン ド ムラ中野店のレビュー", "最高", 12, 1);
INSERT INTO REVIEWS VALUE(13, "Maison de MURA メゾン ド ムラ中野店のレビュー", "まあまあ。", 13, 1);
INSERT INTO REVIEWS VALUE(14, "Maison de MURA メゾン ド ムラ中野店のレビュー", "良き", 14, 1);
INSERT INTO REVIEWS VALUE(15, "Maison de MURA メゾン ド ムラ中野店のレビュー", "良き", 15, 1);
INSERT INTO REVIEWS VALUE(16, "Maison de MURA メゾン ド ムラ中野店のレビュー", "まあまあ。", 16, 1);
INSERT INTO REVIEWS VALUE(17, "Maison de MURA メゾン ド ムラ中野店のレビュー", "良き", 17, 1);
INSERT INTO REVIEWS VALUE(18, "Maison de MURA メゾン ド ムラ中野店のレビュー", "良き", 18, 1);
INSERT INTO REVIEWS VALUE(19, "Maison de MURA メゾン ド ムラ中野店のレビュー", "もう行かない", 19, 1);
INSERT INTO REVIEWS VALUE(20, "Maison de MURA メゾン ド ムラ中野店のレビュー", "微妙", 20, 1);
INSERT INTO REVIEWS VALUE(21, "Maison de MURA メゾン ド ムラ中野店のレビュー", "また行く", 25, 1);
INSERT INTO REVIEWS VALUE(22, "Maison de MURA メゾン ド ムラ中野店のレビュー", "まあまあ。", 26, 1);
INSERT INTO REVIEWS VALUE(23, "Maison de MURA メゾン ド ムラ中野店のレビュー", "良き", 27, 1);
INSERT INTO REVIEWS VALUE(24, "Maison de MURA メゾン ド ムラ中野店のレビュー", "良き", 28, 1);
INSERT INTO REVIEWS VALUE(25, "アティックルーム 中野のレビュー", "まあまあ。", 2, 2);
INSERT INTO REVIEWS VALUE(26, "アティックルーム 中野のレビュー", "良き", 3, 2);
INSERT INTO REVIEWS VALUE(27, "アティックルーム 中野のレビュー", "良き", 4, 2);
INSERT INTO REVIEWS VALUE(28, "アティックルーム 中野のレビュー", "もう行かない", 5, 2);
INSERT INTO REVIEWS VALUE(29, "アティックルーム 中野のレビュー", "微妙", 6, 2);
INSERT INTO REVIEWS VALUE(30, "アティックルーム 中野のレビュー", "また行く", 7, 2);
INSERT INTO REVIEWS VALUE(31, "アティックルーム 中野のレビュー", "まあまあ。", 8, 2);
INSERT INTO REVIEWS VALUE(32, "アティックルーム 中野のレビュー", "良き", 9, 2);
INSERT INTO REVIEWS VALUE(33, "アティックルーム 中野のレビュー", "良き", 10, 2);
INSERT INTO REVIEWS VALUE(34, "アティックルーム 中野のレビュー", "もう行かない", 11, 2);
INSERT INTO REVIEWS VALUE(35, "アティックルーム 中野のレビュー", "微妙", 12, 2);
INSERT INTO REVIEWS VALUE(36, "アティックルーム 中野のレビュー", "また行く", 13, 2);
INSERT INTO REVIEWS VALUE(37, "アティックルーム 中野のレビュー", "まあまあ。", 16, 2);
INSERT INTO REVIEWS VALUE(38, "アティックルーム 中野のレビュー", "良き", 17, 2);
INSERT INTO REVIEWS VALUE(39, "アティックルーム 中野のレビュー", "良き", 18, 2);
INSERT INTO REVIEWS VALUE(40, "アティックルーム 中野のレビュー", "もう行かない", 25, 2);
INSERT INTO REVIEWS VALUE(41, "アティックルーム 中野のレビュー", "微妙", 26, 2);
INSERT INTO REVIEWS VALUE(42, "0秒レモンサワー 仙台ホルモン焼肉酒場 ときわ亭 中野店のレビュー", "まあまあ。", 2, 3);
INSERT INTO REVIEWS VALUE(43, "0秒レモンサワー 仙台ホルモン焼肉酒場 ときわ亭 中野店のレビュー", "良き", 3, 3);
INSERT INTO REVIEWS VALUE(44, "0秒レモンサワー 仙台ホルモン焼肉酒場 ときわ亭 中野店のレビュー", "良き", 4, 3);
INSERT INTO REVIEWS VALUE(45, "0秒レモンサワー 仙台ホルモン焼肉酒場 ときわ亭 中野店のレビュー", "まあまあ。", 5, 3);
INSERT INTO REVIEWS VALUE(46, "0秒レモンサワー 仙台ホルモン焼肉酒場 ときわ亭 中野店のレビュー", "良き", 6, 3);
INSERT INTO REVIEWS VALUE(47, "0秒レモンサワー 仙台ホルモン焼肉酒場 ときわ亭 中野店のレビュー", "良き", 7, 3);
INSERT INTO REVIEWS VALUE(48, "0秒レモンサワー 仙台ホルモン焼肉酒場 ときわ亭 中野店のレビュー", "もう行かない", 8, 3);
INSERT INTO REVIEWS VALUE(49, "0秒レモンサワー 仙台ホルモン焼肉酒場 ときわ亭 中野店のレビュー", "微妙", 9, 3);
INSERT INTO REVIEWS VALUE(50, "0秒レモンサワー 仙台ホルモン焼肉酒場 ときわ亭 中野店のレビュー", "また行く", 10, 3);
INSERT INTO REVIEWS VALUE(51, "【全席喫煙可能】 イタめし酒場Viva (ビバ)のレビュー", "まあまあ。", 2, 4);
INSERT INTO REVIEWS VALUE(52, "【全席喫煙可能】 イタめし酒場Viva (ビバ)のレビュー", "良き", 3, 4);
INSERT INTO REVIEWS VALUE(53, "【全席喫煙可能】 イタめし酒場Viva (ビバ)のレビュー", "良き", 4, 4);
INSERT INTO REVIEWS VALUE(54, "【全席喫煙可能】 イタめし酒場Viva (ビバ)のレビュー", "まあまあ。", 5, 4);
INSERT INTO REVIEWS VALUE(55, "【全席喫煙可能】 イタめし酒場Viva (ビバ)のレビュー", "良き", 6, 4);
INSERT INTO REVIEWS VALUE(56, "【全席喫煙可能】 イタめし酒場Viva (ビバ)のレビュー", "良き", 7, 4);
INSERT INTO REVIEWS VALUE(57, "豊洲市場 さかな酒場 魚星中野駅 北口店のレビュー", "まあまあ。", 2, 5);
INSERT INTO REVIEWS VALUE(58, "豊洲市場 さかな酒場 魚星中野駅 北口店のレビュー", "良き", 3, 5);
INSERT INTO REVIEWS VALUE(59, "豊洲市場 さかな酒場 魚星中野駅 北口店のレビュー", "良き", 4, 5);

INSERT INTO TEAMS VALUE(1,"取引先課第二課",3);
INSERT INTO TEAMS VALUE(2,"システム部同期Gr",3);

INSERT INTO TEAMS_USERS VALUE(1,1,1);
INSERT INTO TEAMS_USERS VALUE(2,1,2);
INSERT INTO TEAMS_USERS VALUE(3,1,3);

INSERT INTO EVENTS VALUE(1,1,1);
INSERT INTO EVENTS VALUE(2,1,2);
