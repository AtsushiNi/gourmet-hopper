package org.javatraining.action;

//Actionオブジェクトを生成するファクトリクラス
public class ActionFactory {

    // 指定された文字列に該当するActionクラスのオブジェクトを取得する
    public static Action getInstance(String actionName) {

        if (actionName == null) {
            return null;
        }

        switch (actionName) {
            case "login":
                return new LoginAction();
            case "search":
                return new SearchAction();
            case "apicall":
                return new ApiCallAction();
            case "imageshow":
                return new ImageShowAction();
            case "imageupload":
                return new ImageUploadAction();
            case "topcommunity":
            	return new TopCommunityAction();
            case "shop_detail":
            	return new ShopDetailAction();
            case "review_new":
            	return new ReviewNewAction();
            case "review_create":
            	return new ReviewCreateAction();
            default:
                return null;

        }
    }

}