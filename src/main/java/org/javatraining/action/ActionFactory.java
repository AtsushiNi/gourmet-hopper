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
            case "regist":
                return new BookAddAction();
            case "edit":
                return new BookEditAction();
            case "delete_confirm":
                return new BookDeleteConfirmAction();
            case "delete":
                return new BookDeleteAction();
            case "apicall":
                return new ApiCallAction();
            case "imageshow":
                return new ImageShowAction();
            case "imageupload":
                return new ImageUploadAction();    
            case "home":
            	return new HomeAction();
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