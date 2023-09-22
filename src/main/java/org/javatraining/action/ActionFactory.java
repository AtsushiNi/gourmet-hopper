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
            case "logout":
            	return new LogoutAction();
            case "search":
                return new SearchAction();
            case "apicall":
                return new ApiCallAction();
            case "imageshow":
                return new ImageShowAction();
            case "imageupload":
<<<<<<< HEAD
                return new ImageUploadAction();    
            case "home":
            	return new HomeAction();
            case "select_group_type":
            	return new SelectGroupTypeAction();
            case "team_list":
            	return new TeamListAction();
            case "team_detail":
            	return new TeamDetailAction();
=======
                return new ImageUploadAction();
            case "topcommunity":
            	return new TopCommunityAction();
            case "shop_detail":
            	return new ShopDetailAction();
            case "review_new":
            	return new ReviewNewAction();
            case "review_create":
            	return new ReviewCreateAction();
>>>>>>> master
            default:
                return null;

        }
    }

}