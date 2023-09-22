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

            case "home":
            	return new HomeAction();

            case "search":
                return new SearchAction();
            case "topcommunity":
            	return new TopCommunityAction();
            case "shop_detail":
            	return new ShopDetailAction();

            // レビュー機能
            case "review_new":
            	return new ReviewNewAction();
            case "review_create":
            	return new ReviewCreateAction();

            // グループ機能
            case "select_group_type":
            	return new SelectGroupTypeAction();
            case "team_list":
            	return new TeamListAction();
            case "team_detail":
            	return new TeamDetailAction();

            default:
                return null;

        }
    }

}