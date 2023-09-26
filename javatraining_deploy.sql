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
	RATING INT(1),
	BUDGET VARCHAR(30),
	FORPARTY BOOLEAN,
	FORRECEPTION BOOLEAN,
	FORDATE BOOLEAN,
	TABACO BOOLEAN,
	FREE BOOLEAN,
	PARTYSPACE BOOLEAN,
	RESERVATION BOOLEAN,
	REVIEW VARCHAR(1000),
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
	(1,"武井 凱","takei", "takei@test.com", "ビール, ワイン, フレンチ", "日本酒, 刺身"),
	(2, "鈴木 佳子", "suzuki", "suzuki@test.com", "ビール, フレンチ", "刺身"),
	(3, "尾崎 寛人", "ozaki", "ozaki@test.com", "ビール, ワイン, 焼き鳥", "日本酒, ホルモン"),
	(4, "佐々木 美咲", "sasaki", "sasaki@test.com", "ビール, フレンチ", "刺身"),
	(5, "村田 雄大", "murata", "murata@test.com", "焼き鳥", "ビール"),
	(6, "岡田 恵美", "okada", "okada@test.com", "ビール, ワイン, フレンチ", "日本酒, ホルモン"),
	(7, "野村 健太", "nomura", "nomura@test.com", "ビール", "刺身"),
	(8, "松本 亜美", "matsumoto", "matsumoto@test.com", "ビール, ワイン", "刺身"),
	(9, "井上 大輝", "inoue", "inoue@test.com", "焼き鳥", "ビール, ホルモン"),
	(10, "吉田 明日香", "yoshida", "yoshida@test.com", "", "ビール"),
	(11, "高橋 優馬", "takahashi", "takahashi@test.com", "ビール, ワイン, 焼き鳥", "日本酒, ホルモン"),
	(12, "田中 さくら", "tanaka", "tanaka@test.com", "ビール, フレンチ", "刺身"),
	(13, "伊藤 龍之介", "ito", "ito@test.com", "ビール, ワイン, フレンチ", "日本酒, ホルモン"),
	(14, "渡辺 莉子", "watanabe", "watanabe@test.com", "焼き鳥", "ビール"),
	(15, "加藤 千尋", "kato", "kato@test.com", "ビール, ワイン, フレンチ", "刺身"),
	(16, "山田 海斗", "yamada", "yamada@test.com", "ビール, 焼き鳥", "日本酒"),
	(17, "中村 あやか", "nakamura", "nakamura@test.com", "ビール, ワイン", "刺身"),
	(18, "森田 悠希", "morita", "morita@test.com", "ビール, フレンチ", "刺身"),
	(19, "斉藤 真央", "saito", "saito@test.com", "ビール, ワイン, 焼き鳥", "日本酒, ホルモン"),
	(20, "西村 啓介", "nishimura", "nishimura@test.com", "ビール", "刺身"),
	(21, "佐藤 健太郎", "sato", "sato@test.com", "ビール, ワイン, フレンチ", "日本酒, ホルモン"),
	(22, "小林 みさき", "kobayashi", "kobayashi@test.com", "ビール, フレンチ", "刺身"),
	(23, "田村 大輝", "tamura", "tamura@test.com", "焼き鳥", "ビール"),
	(24, "加藤 亜美", "kato", "kato@test.com", "ビール, ワイン, フレンチ", "刺身"),
	(25, "伊藤 修一", "ito", "ito@test.com", "ビール, 焼き鳥", "日本酒"),
	(26, "山本 美香", "yamamoto", "yamamoto@test.com", "ビール, ワイン", "刺身"),
	(27, "鈴木 達也", "suzuki", "suzuki@test.com", "ビール, フレンチ", "刺身"),
	(28, "佐々木 竜司", "sasaki", "sasaki@test.com", "ビール, ワイン, 焼き鳥", "日本酒, ホルモン"),
	(29, "高田 裕美", "takada", "takada@test.com", "焼き鳥", "ビール"),
	(30, "岡田 剛", "okada", "okada@test.com", "ビール", "刺身");

INSERT INTO SHOPS VALUE(1,"Maison de MURA メゾン ド ムラ中野店","X175","J001192710",35.7074540574, 139.6653579201);
INSERT INTO SHOPS VALUE(2,"アティックルーム 中野","X175","J003324939",35.7065247369, 139.6660756742);
INSERT INTO SHOPS VALUE(3,"0秒レモンサワー 仙台ホルモン焼肉酒場 ときわ亭 中野店","X175","J003599955",35.7086395082, 139.6664344477);
INSERT INTO SHOPS VALUE(4,"【全席喫煙可能】 イタめし酒場Viva (ビバ)","X175","J003298105", 35.7052912328, 139.6648794365);
INSERT INTO SHOPS VALUE(5,"豊洲市場 さかな酒場 魚星中野駅 北口店","X175","J000036282",35.7076415633, 139.6663678267);
INSERT INTO SHOPS VALUE(6,"グラン パ 中野北口店","X175","J000002734",35.709269919, 139.6636732683);
INSERT INTO SHOPS VALUE(7,"ガレット garret 中野店","X175","J000000945",35.7084675843, 139.6664800062);
INSERT INTO SHOPS VALUE(8,"楽蔵 RAKUZO 中野北口駅前店","X175","J001118745",35.707366568, 139.6653856991);
INSERT INTO SHOPS VALUE(9,"中野の隠れ家居酒屋 笑い上戸","X175","J001287338",35.7082267824, 139.6666422243);
INSERT INTO SHOPS VALUE(10,"ナプリモ 中野店","X175","J001238772",35.7071707848, 139.6664342288);


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

INSERT INTO REVIEWS VALUE(1, "シャレ乙なランチプレートは映え乙SNS乙女に最適", 5, "￥4,000~5,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "プレートの見た目はオシャレ感漂っているのでデートや女子会に最適かと。<br>SNS映えする料理の質も味も良いと思う。<br>ご馳走様でした。", 1, 1);
INSERT INTO REVIEWS VALUE(2, "友人の誕生日祝いでランチ利用", 5, "￥4,000~5,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "食事は普通にランチメニューからの注文で鴨のローストが柔らかくとても美味しかったです。<br>バースデープレートの対応もしていただきその点は良かったと思います。", 2, 1);
INSERT INTO REVIEWS VALUE(3, "シンプルオシャレなワンプレートランチ", 4, "￥4,000~5,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "土曜の昼に２名で予約訪問。ワンプレート5種類（¥1,200）を注文。<br>ホールの店員さんにもう少し愛想があると良いな...<br>日差しが差し込む明るい店なだけに。<br>ご馳走様でした。", 3, 1);
INSERT INTO REVIEWS VALUE(4, "こんなに嫌な気分になったお店は初めて", 1, "￥4,000~5,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "味はまずまずでしたが、絶対リピートしないです。<br>料金の割に店員の教育があまりにもできていない。", 4, 1);
INSERT INTO REVIEWS VALUE(5, "来るのは遅いです", 2, "￥4,000~5,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "できあがってるものを乗せるだけ？と思ってるのにすごく来るのが遅いです。<br>20分は待ちました。", 5, 1);
INSERT INTO REVIEWS VALUE(6, "新年会をこちらで…", 5, "￥4,000~5,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "お酒の提供が素早く､空グラスが貯まる事無く…<br>お料理の量が僅か少なめ？と、感じるが､残す事無く…<br>皆が好きなモノがリズム良く出て来ました。<br>この内容でこの値段なら､またここで宴会も良さそう♪", 6, 1);
INSERT INTO REVIEWS VALUE(7, "おしゃれで豪華10種盛りワンプレートランチ", 5, "￥4,000~5,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "この素晴らしいレストランでの食事は、まさに一生の思い出になりました！シェフの技術は驚くべきもので、一皿一皿が芸術品のようでした。特にフォアグラのテリーヌは絶品で、口に入れた瞬間に幸せが広がりました。ソムリエのおすすめワインも、料理との相性が抜群で、完璧なペアリングでした。<br><br>店内の雰囲気も素晴らしく、落ち着いた雰囲気で心地よく過ごすことができました。スタッフの皆さんも親切で、サービスが行き届いていました。<br><br>こちらのレストランは、フレンチ料理の真髄を味わいたい方には絶対におすすめです。また必ず訪れたいと思います！", 7, 1);
INSERT INTO REVIEWS VALUE(8, "なかなかの中野ランチ", 5, "￥4,000~5,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "<br>3階の単品のプレートだともっと早いので急ぐ時には3階に行った方が良いかもです。", 8, 1);
INSERT INTO REVIEWS VALUE(9, "中野でイタリアン", 5, "￥4,000~5,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "中野駅から徒歩5分ほどの所にある店舗様<br>生ハムもパテもどれも美味しかったです<br><br>ドリンクや、フードメニューも充実しており<br>デート向きな印象<br>また、機会があればお伺いさせて頂きます", 9, 1);
INSERT INTO REVIEWS VALUE(10, "大満足ランチ★", 5, "￥4,000~5,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "メニューはこんな感じ。<br>カブトカリフラワーのクリーム煮<br>ローストポーク<br>ローストチキン<br>キャロットラペ<br>ポテトサラダ<br>スパイシーポークのペンネ<br>ベビーホタテのマリネ<br>枝豆とベーコンのキッシュ<br>コーンポタージュ<br><br>彩りもバランスもよく、とても美味しい！<br>ローストチキンはとても柔らかかったです。おかずそれぞれ手間がかかっていてすごいー！", 10, 1);
INSERT INTO REVIEWS VALUE(11, "ランチタイムにちょうどいいボリューム☆", 5, "￥4,000~5,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "ランチタイムに初めてお邪魔したところ、待ち時間0で通してもらえました。お客さんは女性9割！運よく個室チックな席に通してもらえてラッキーです。10種類のお惣菜メニューから5種類、7種類、10種類いずれかの数の惣菜を頂くというスタイル。私はそこまでお腹もすいていなかったので、1000円5種類で！小さいバケットもついてきて、こちらはおかわり自由でした。全部をひとつのプレートにのっけてくれるので食べやすくて助かります。お野菜たっぷりでこちらもうれしい。枝豆とベーコンのキッシュが美味しかったな～。お腹に余裕があれば全部のせの10種類にチャレンジしてみたいです☆", 11, 1);
INSERT INTO REVIEWS VALUE(12, "どれも美味しい", 5, "￥5,000~6,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "3階にあるビストロムラの1つ上の階にあるメゾンドムラ。<br>こちらは10種類のメニューの中から5.7.10種類選択出来てそれぞれ値段が違います。<br>以前来た時は5種類選べて1000円、それにドリンクがついていたのですがドリンクが別料金になっていました。<br>ローストポークとローストチキンは3階のメニューのものですね。今回はローストポークを選びましたが、やっぱり味が落ちた気がします。<br>それでもキッシュもレバーパテもおいしいです。<br>3階よりもこっちがおすすめ。", 12, 1);
INSERT INTO REVIEWS VALUE(13, "大満足ランチ。おすすめは10種！", 3, "￥5,000~6,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "思わず「おぉ！」と他のテーブルのお客さんも私も声が出てしまいます。<br>なぜなら写真の通りの豪快さとボリューム！<br>フレンチの10種盛りなんて聞くと小ぶりなのがちょんと盛りつけられているのをイメージしますが<br>こちらでは違います。<br><br>ローストポーク<br>ローストチキン<br>カボチャロースト<br>キャロットラペ　<br>レバームース<br>パスタデリ<br>シーフードマリネ<br>カボチャのキッシュ<br>コーンスープ<br><br>サラダ添え　パンおかわり自由<br>10種類 1500円<br><br>どの品も手抜きなく一つ一つ丁寧に作られていて拘りを感じます。<br>本当どれも美味しかった。", 13, 1);
INSERT INTO REVIEWS VALUE(14, "デザートも抜かりない！", 4, "￥5,000~6,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "久しぶりの再訪だったけどとっても良かった♡<br>お料理もデザートも美味しい！<br>店員さんがとっても可愛いくて気のつく子で見惚れてしまった(〃ω〃)<br>また行きたいなー♪", 14, 1);
INSERT INTO REVIEWS VALUE(15, "豊富なグラスワインとすごい肉料理", 4, "￥3,000~4,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "本日のスパークリングワインで乾杯！<br>もうひとつの本日のおすすめ、鹿肉のローストは何の臭みも荒々しさも無い、柔らかで上品なお肉です。<br>火入れが上手で、じゅわっとジューシーな仕上がり。<br>忘年会向きのコースも気になります。<br>大勢で盛り上がるのも良さげですね。", 15, 1);
INSERT INTO REVIEWS VALUE(16, "若いコ向けのオシャレビストロ？", 3, "￥3,000~4,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "全体的に年齢層低めでワイガヤな雰囲気、びみょ～～に年イッちゃった私らには少し可愛いらしすぎたお店だったかしらん？笑<br>御馳走様でした～", 16, 1);
INSERT INTO REVIEWS VALUE(17, "鴨料理は美味しい。", 4, "￥3,000~4,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "今回夜の来店は2度目でした。初回はお得な3980円の飲み放題付コースでシェフの鴨料理を堪能出来なかったため、今回はアラカルトメニューで注文しました。<br>初回のコース飲み放題付は確かにお得感があるのですが、ポテトフライがかなりの量ついてきたりして、大人向けではありません。<br>せっかくの鴨料理ですから、別に鴨料理メインのコースを作っていただけたらなと思います。", 17, 1);
INSERT INTO REVIEWS VALUE(18, "選べて満足", 4, "￥2,000~3,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "選べる5品目1000円で、いつもローストポークとローストチキン両方選びます(笑)<br>あとはキッシュとスープ。<br>この日のスープはコンソメでした。<br>野菜系は全く頼みませんでしたが、サラダがたくさん添えてあるので十分です", 18, 1);
INSERT INTO REVIEWS VALUE(19, "お野菜たっぷり頂きました。", 1, "￥2,000~3,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "平日のお昼時ということもあり、ほぼ満席でしたか、すぐに着席。野菜をたくさん頂き大満足です。", 19, 1);
INSERT INTO REVIEWS VALUE(20, "マッシュルームのタルトがスキ", 2, "￥3,000~4,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "こんかい中野の駅のお店にいきました(^▽^)/<br>ここのお店のマッシュルームのリゾットはわたしは好きでよくたべますー(^▽^)/<br>お店もとてもおしゃれでとても好きです(^▽^)/<br>またいきますありがとうございます(^▽^)/", 20, 1);
INSERT INTO REVIEWS VALUE(21, "女子会で使いやすい", 4, "￥3,000~4,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "女子会ランチで利用しました。<br>コスパもいいし、お酒もコーヒーも美味しいしいろいろな使い方ができて便利です。<br>鴨のお肉も柔らかくて美味しかったです。", 25, 1);
INSERT INTO REVIEWS VALUE(22, "しょっぱい", 1, "￥6,000~8,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "選択肢がないね", 26, 1);
INSERT INTO REVIEWS VALUE(23, "Maison de MURA", 4, "￥6,000~8,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "おまかせコース、旬の食材を楽しめてすごく良かったです！<br>大人数でワイワイならアラカルトでも楽しいし、少人数やデートならこのおまかせコースはとってもオススメ♡<br>リーズナブルにこれだけのお料理をいただけるって素晴らしい。<br>今回いらっしゃったサービスの女性の接客も素敵でした^^", 27, 1);
INSERT INTO REVIEWS VALUE(24, "CP抜群。季節を感じるお料理の数々。", 4, "￥6,000~8,000", TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, "今回も季節感溢れるお皿の数々を堪能しました。<br>食材に拘ったしっかりフレンチ、それでいてこのお値段。驚愕のコスパです。<br>普段からあまり飲まない私ながら、ここにくると3杯は行ってしまうー笑<br><br>お店も綺麗ですし、大人数でも、少人数でもいけます。<br>都内広しといえど、このようなバランス感溢れるお店は希少。また季節を変えてお邪魔します。<br><br>ご馳走さまでした☆", 28, 1);
INSERT INTO REVIEWS VALUE(25, "アティックルーム 中野のレビュー", 3, "￥8,000~10,000", TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, "まあまあ。", 2, 2);
INSERT INTO REVIEWS VALUE(26, "アティックルーム 中野のレビュー", 4, "￥8,000~10,000", TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE,"良き", 3, 2);
INSERT INTO REVIEWS VALUE(27, "アティックルーム 中野のレビュー", 4, "￥8,000~10,000", TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, "良き", 4, 2);
INSERT INTO REVIEWS VALUE(28, "アティックルーム 中野のレビュー", 1, "￥8,000~10,000", TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, "もう行かない", 5, 2);
INSERT INTO REVIEWS VALUE(29, "アティックルーム 中野のレビュー", 2, "￥8,000~10,000", TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, "微妙", 6, 2);
INSERT INTO REVIEWS VALUE(30, "アティックルーム 中野のレビュー", 4, "￥6,000~8,000", TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, "また行く", 7, 2);
INSERT INTO REVIEWS VALUE(31, "アティックルーム 中野のレビュー", 3, "￥6,000~8,000", TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, "まあまあ。", 8, 2);
INSERT INTO REVIEWS VALUE(32, "アティックルーム 中野のレビュー", 4, "￥6,000~8,000", TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, "良き", 9, 2);
INSERT INTO REVIEWS VALUE(33, "アティックルーム 中野のレビュー", 4, "￥6,000~8,000", TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, "良き", 10, 2);
INSERT INTO REVIEWS VALUE(34, "アティックルーム 中野のレビュー", 1, "￥6,000~8,000", TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, "もう行かない", 11, 2);
INSERT INTO REVIEWS VALUE(35, "アティックルーム 中野のレビュー", 2, "￥6,000~8,000", TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, "微妙", 12, 2);
INSERT INTO REVIEWS VALUE(36, "アティックルーム 中野のレビュー", 4, "￥6,000~8,000", TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, "また行く", 13, 2);
INSERT INTO REVIEWS VALUE(37, "アティックルーム 中野のレビュー", 3, "￥10,000~15,000", TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, "まあまあ。", 16, 2);
INSERT INTO REVIEWS VALUE(38, "アティックルーム 中野のレビュー", 4, "￥10,000~15,000", TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, "良き", 17, 2);
INSERT INTO REVIEWS VALUE(39, "アティックルーム 中野のレビュー", 4, "￥5,000~6,000", TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, "良き", 18, 2);
INSERT INTO REVIEWS VALUE(40, "アティックルーム 中野のレビュー", 1, "￥5,000~6,000", TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, "もう行かない", 25, 2);
INSERT INTO REVIEWS VALUE(41, "アティックルーム 中野のレビュー", 2, "￥5,000~6,000", TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, "微妙", 26, 2);
INSERT INTO REVIEWS VALUE(42, "0秒レモンサワー 仙台ホルモン焼肉酒場 ときわ亭 中野店のレビュー", 3, "￥3,000~4,000", TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, "まあまあ。", 2, 3);
INSERT INTO REVIEWS VALUE(43, "0秒レモンサワー 仙台ホルモン焼肉酒場 ときわ亭 中野店のレビュー", 4, "￥3,000~4,000", TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, "良き", 3, 3);
INSERT INTO REVIEWS VALUE(44, "0秒レモンサワー 仙台ホルモン焼肉酒場 ときわ亭 中野店のレビュー", 4, "￥3,000~4,000", TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, "良き", 4, 3);
INSERT INTO REVIEWS VALUE(45, "0秒レモンサワー 仙台ホルモン焼肉酒場 ときわ亭 中野店のレビュー", 3, "￥3,000~4,000", TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, "まあまあ。", 5, 3);
INSERT INTO REVIEWS VALUE(46, "0秒レモンサワー 仙台ホルモン焼肉酒場 ときわ亭 中野店のレビュー", 4, "￥4,000~5,000", TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, "良き", 6, 3);
INSERT INTO REVIEWS VALUE(47, "0秒レモンサワー 仙台ホルモン焼肉酒場 ときわ亭 中野店のレビュー", 4, "￥4,000~5,000", TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, "良き", 7, 3);
INSERT INTO REVIEWS VALUE(48, "0秒レモンサワー 仙台ホルモン焼肉酒場 ときわ亭 中野店のレビュー", 1, "￥4,000~5,000", TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, "もう行かない", 8, 3);
INSERT INTO REVIEWS VALUE(49, "0秒レモンサワー 仙台ホルモン焼肉酒場 ときわ亭 中野店のレビュー", 2, "￥2,000~3,000", TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, "微妙", 9, 3);
INSERT INTO REVIEWS VALUE(50, "0秒レモンサワー 仙台ホルモン焼肉酒場 ときわ亭 中野店のレビュー", 4, "￥2,000~3,000", TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, "また行く", 10, 3);
INSERT INTO REVIEWS VALUE(51, "【全席喫煙可能】 イタめし酒場Viva (ビバ)のレビュー", 3, "￥2,000~3,000", TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, FALSE, "まあまあ。", 2, 4);
INSERT INTO REVIEWS VALUE(52, "【全席喫煙可能】 イタめし酒場Viva (ビバ)のレビュー", 4, "￥2,000~3,000", TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, FALSE, "良き", 3, 4);
INSERT INTO REVIEWS VALUE(53, "【全席喫煙可能】 イタめし酒場Viva (ビバ)のレビュー", 4, "￥2,000~3,000", TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, FALSE, "良き", 4, 4);
INSERT INTO REVIEWS VALUE(54, "【全席喫煙可能】 イタめし酒場Viva (ビバ)のレビュー", 3, "￥3,000~4,000", TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, FALSE, "まあまあ。", 5, 4);
INSERT INTO REVIEWS VALUE(55, "【全席喫煙可能】 イタめし酒場Viva (ビバ)のレビュー", 4, "￥3,000~4,000", TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, FALSE, "良き", 6, 4);
INSERT INTO REVIEWS VALUE(56, "【全席喫煙可能】 イタめし酒場Viva (ビバ)のレビュー", 4, "￥1,000~2,000", TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, FALSE, "良き", 7, 4);
INSERT INTO REVIEWS VALUE(57, "豊洲市場 さかな酒場 魚星中野駅 北口店のレビュー", 4, "￥1,000~2,000", TRUE, TRUE, TRUE, FALSE, TRUE, FALSE, FALSE, "まあまあ。", 2, 5);
INSERT INTO REVIEWS VALUE(58, "豊洲市場 さかな酒場 魚星中野駅 北口店のレビュー", 4, "￥3,000~4,000", TRUE, TRUE, TRUE, FALSE, TRUE, FALSE, FALSE, "良き", 3, 5);
INSERT INTO REVIEWS VALUE(59, "豊洲市場 さかな酒場 魚星中野駅 北口店のレビュー", 4, "￥3,000~4,000", TRUE, TRUE, TRUE, FALSE, TRUE, FALSE, FALSE, "良き", 4, 5);
INSERT INTO REVIEWS VALUE(60, "モチモチ生パスタ！", 4, "￥3,000~4,000", TRUE, TRUE, TRUE, FALSE, TRUE, FALSE, FALSE, "うまい！<br>まず麺が絶妙なモチモチ。麺はスパゲッティの細さで、ソースによく絡みます。<br>そしてソース。<br>料理のレベル高いし種類も豊富だし、ランチとしては大満足です。<br>うちの会社の近くにあるといいのになー。", 4, 6);
INSERT INTO REVIEWS VALUE(61, "生パスタを楽しめるお店", 4, "￥3,000~4,000", TRUE, TRUE, TRUE, FALSE, TRUE, FALSE, FALSE, "「えび＆きのこのマッシュルームクリーム」<br>濃厚なクリームスープに、しめじ等のきのこや、えび、オリーブ等具材もたっぷりです。濃厚なお味ですが、クドくなく、最後まで美味しく食べれます。<br>今回、大盛りにしたので結構お腹いっぱいでした。", 7, 6);
INSERT INTO REVIEWS VALUE(62, "路地裏に佇む濃厚クリーミーソースの生パスタ", 4, "￥3,000~4,000", TRUE, TRUE, TRUE, FALSE, TRUE, FALSE, FALSE, "美味しかったですが、盛り付けがイマイチだったのは残念です。<br>また行きます。ごちそうさまでした。", 4, 6);
INSERT INTO REVIEWS VALUE(63, "中野 garret(ガレット)", 4, "￥4,000~5,000", TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, "気になるあの子とのデートの際に是非。(ノ´∀｀*)アボガド料理とサングリアを与えておけば、たいていの女子は落ちるでしょー笑<br>厨房、STAFFさんは全員男性の方（おそらく）でカウンターもあるのでもちろん男性の方も気軽に入れる空間ですよ～", 6, 7);
INSERT INTO REVIEWS VALUE(64, "普通のダイニング。", 4, "￥4,000~5,000", TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, "一昔前にダイニングとか創作居酒屋とかとても流行ったと思うが、このお店はその類かなぁ…メニューもお洒落な居酒屋にありそうな感じ。<br>何が売りのお店かも分かりずらいから、やっぱり居酒屋の延長感は否めない。ピザを頼んだが、なんのサプライズ感もなくふーんみたいな感じ。", 7, 7);
INSERT INTO REVIEWS VALUE(65, "オシャレディナー", 4, "￥2,000~3,000", TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, "お誕生日会で利用させて頂きました。<br>店内もオシャレで料理もとても美味しかったです。<br>また利用したいです。", 10, 7);
INSERT INTO REVIEWS VALUE(66, "中野の居酒屋", 1, "￥4,000~5,000", TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, "もう行かない", 8, 8);
INSERT INTO REVIEWS VALUE(67, "寄る良い楽蔵ぞ　暗い夜よ", 2, "￥2,000~3,000", TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, "ハイボールはきりりと炭酸がきいていて美味しい。<br>お通しは少し甘いかぼちゃのサラダ。<br>ほっけは脂がのっていて美味。<br>ふたりでつついて十分なサイズだった。<br><br>カルビはもっぱらあなたが食べた。<br><br>ハイボールをおかわりして、ほろほろ時間が過ぎる。<br><br>ねえ、もう一軒あそこに行きたいなあ、と言うとあなたがまたニヤリと笑う。", 9, 8);
INSERT INTO REVIEWS VALUE(68, "焼酎やカクテルが豊富な美味しい肉料理が食べられるお店", 4, "￥2,000~3,000", TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, "店内は落ち着いた感じで、たくさんのお客さんが入っていました。<br>メニューを眺めると、鶏料理や豚肉料理ががたくさんありました<br>料理も美味しくて、ドリンクも楽しめて、久々に大満足のお酒になりました。<br>またリピしたいと思います。", 10, 9);


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
