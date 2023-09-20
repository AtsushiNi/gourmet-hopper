package org.javatraining.action;

import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

// 一覧画面表示アクションクラス
public class SearchAction extends ShopAction {

    @Override
    protected String processShopManagement(HttpServletRequest request) throws SQLException, NamingException {
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