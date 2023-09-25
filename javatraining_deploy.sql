DROP DATABASE javatraining;
CREATE DATABASE javatraining CHARACTER SET UTF8;
USE javatraining;

CREATE TABLE SHOPS(
   ID INT(10) AUTO_INCREMENT NOT NULL, 
    NAME VARCHAR(30) NOT NULL,
    SMALL_AREA_CODE VARCHAR(30) ,
    API_ID VARCHAR(30) ,
    PHOTO VARCHAR(300),
    LAT DOUBLE,
    LNG DOUBLE,
    PRIMARY KEY (ID)
    );

CREATE TABLE USERS(
    ID INT(10) AUTO_INCREMENT NOT NULL, 
    NAME VARCHAR(30) NOT NULL,
    PASSWORD VARCHAR(30) NOT NULL,
    EMAIL VARCHAR(100),
    LIKE_FOOD VARCHAR(100),
    DISLIKE_FOOD VARCHAR(100),
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

INSERT INTO USERS VALUES
	(1,"武井 凱","takei", "takei@test.com", "ビール, ワイン, 中華", "日本酒, 刺身"),
	(2, "鈴木 佳子", "suzuki", "suzuki@test.com", "ビール, 中華", "刺身"),
	(3, "尾崎 寛人", "ozaki", "ozaki@test.com", "ビール, ワイン, 焼き鳥", "日本酒, ホルモン"),
	(4, "佐々木 美咲", "sasaki", "sasaki@test.com", "ビール, 中華", "刺身"),
	(5, "村田 雄大", "murata", "murata@test.com", "焼き鳥", "ビール"),
	(6, "岡田 恵美", "okada", "okada@test.com", "ビール, ワイン, 中華", "日本酒, ホルモン"),
	(7, "野村 健太", "nomura", "nomura@test.com", "ビール", "刺身"),
	(8, "松本 亜美", "matsumoto", "matsumoto@test.com", "ビール, ワイン", "刺身"),
	(9, "井上 大輝", "inoue", "inoue@test.com", "焼き鳥", "ビール, ホルモン"),
	(10, "吉田 明日香", "yoshida", "yoshida@test.com", "", "ビール"),
	(11, "高橋 優馬", "takahashi", "takahashi@test.com", "ビール, ワイン, 焼き鳥", "日本酒, ホルモン"),
	(12, "田中 さくら", "tanaka", "tanaka@test.com", "ビール, 中華", "刺身"),
	(13, "伊藤 龍之介", "ito", "ito@test.com", "ビール, ワイン, 中華", "日本酒, ホルモン"),
	(14, "渡辺 莉子", "watanabe", "watanabe@test.com", "焼き鳥", "ビール"),
	(15, "加藤 千尋", "kato", "kato@test.com", "ビール, ワイン, 中華", "刺身"),
	(16, "山田 海斗", "yamada", "yamada@test.com", "ビール, 焼き鳥", "日本酒"),
	(17, "中村 あやか", "nakamura", "nakamura@test.com", "ビール, ワイン", "刺身"),
	(18, "森田 悠希", "morita", "morita@test.com", "ビール, 中華", "刺身"),
	(19, "斉藤 真央", "saito", "saito@test.com", "ビール, ワイン, 焼き鳥", "日本酒, ホルモン"),
	(20, "西村 啓介", "nishimura", "nishimura@test.com", "ビール", "刺身"),
	(21, "佐藤 健太郎", "sato", "sato@test.com", "ビール, ワイン, 中華", "日本酒, ホルモン"),
	(22, "小林 みさき", "kobayashi", "kobayashi@test.com", "ビール, 中華", "刺身"),
	(23, "田村 大輝", "tamura", "tamura@test.com", "焼き鳥", "ビール"),
	(24, "加藤 亜美", "kato", "kato@test.com", "ビール, ワイン, 中華", "刺身"),
	(25, "伊藤 修一", "ito", "ito@test.com", "ビール, 焼き鳥", "日本酒"),
	(26, "山本 美香", "yamamoto", "yamamoto@test.com", "ビール, ワイン", "刺身"),
	(27, "鈴木 達也", "suzuki", "suzuki@test.com", "ビール, 中華", "刺身"),
	(28, "佐々木 竜司", "sasaki", "sasaki@test.com", "ビール, ワイン, 焼き鳥", "日本酒, ホルモン"),
	(29, "高田 裕美", "takada", "takada@test.com", "焼き鳥", "ビール"),
	(30, "岡田 剛", "okada", "okada@test.com", "ビール", "刺身");

INSERT INTO SHOPS VALUE(1,"Maison de MURA メゾン ド ムラ中野店","X175","J001192710", "https://imgfp.hotp.jp/IMGH/13/27/P029301327/P029301327_168.jpg",35.7074540574, 139.6653579201);
INSERT INTO SHOPS VALUE(2,"アティックルーム 中野","X175","J003324939", "https://imgfp.hotp.jp/IMGH/75/58/P041087558/P041087558_168.jpg", 35.7065247369, 139.6660756742);
INSERT INTO SHOPS VALUE(3,"0秒レモンサワー 仙台ホルモン焼肉酒場 ときわ亭 中野店","X175","J003599955", "https://imgfp.hotp.jp/IMGH/55/09/P042565509/P042565509_168.jpg", 35.7086395082, 139.6664344477);
INSERT INTO SHOPS VALUE(4,"【全席喫煙可能】 イタめし酒場Viva (ビバ)","X175","J003298105", "https://imgfp.hotp.jp/IMGH/37/50/P039613750/P039613750_168.jpg", 35.7052912328, 139.6648794365);
INSERT INTO SHOPS VALUE(5,"豊洲市場 さかな酒場 魚星中野駅 北口店","X175","J000036282", "https://imgfp.hotp.jp/IMGH/28/54/P040922854/P040922854_168.jpg", 35.7076415633, 139.6663678267);

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

INSERT INTO TEAMS VALUE(1,"中野支店 取引先課",3);
INSERT INTO TEAMS VALUE(2,"システム部同期Gr",3);

INSERT INTO TEAMS_USERS VALUE(1,1,1);
INSERT INTO TEAMS_USERS VALUE(2,1,2);
INSERT INTO TEAMS_USERS VALUE(3,1,3);
INSERT INTO TEAMS_USERS VALUE(4,1,4);
INSERT INTO TEAMS_USERS VALUE(5,1,5);
INSERT INTO TEAMS_USERS VALUE(6,1,6);
INSERT INTO TEAMS_USERS VALUE(7,1,7);
INSERT INTO TEAMS_USERS VALUE(8,1,8);

INSERT INTO EVENTS VALUE(1,1,1);
INSERT INTO EVENTS VALUE(2,1,2);
