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
            case "shop_show":
                return new ShopShowAction();
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
            default:
                return null;

        }
    }

}