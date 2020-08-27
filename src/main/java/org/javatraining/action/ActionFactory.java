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
            case "show":
                return new ShowAction();
            case "registration":
                return new AddAction();
            case "edit":
                return new EditAction();
            case "delete_confirm":
                return new DeleteConfirmAction();
            case "delete":
                return new DeleteAction();
            case "apicall":
                return new ApiCallAction();
            case "imagebase64":
                return new ImageBase64Action();
    
            default:
                return null;

        }
    }

}