package org.javatraining.action;

import javax.servlet.http.HttpServletRequest;

// 一覧画面表示アクションクラス
public class SearchAction extends Action {

    @Override
    protected String processRequest(HttpServletRequest request) {
/*
        // ShopオブジェクトのListを取得
        System.out.println("[ShopShowAction.java]: Start");
        System.out.println("[ShopShowAction.java]: ShopService:getShopsメソッドを呼び出し");
        List<Shop> shops = service.getShops();

        // Shopオブジェクトの List をリクエストに設定
        request.setAttribute("shops", shops);

        // 遷移先のページを返す
        System.out.println("[ShopShowAction.java]: End");
 */
        return "search.jsp";
    }
}