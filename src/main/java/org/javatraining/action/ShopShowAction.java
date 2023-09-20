package org.javatraining.action;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import org.javatraining.entity.Shop;

// 一覧画面表示アクションクラス
public class ShopShowAction extends ShopAction {

    @Override
    protected String processShopManagement(HttpServletRequest request) throws SQLException, NamingException {

        // ShopオブジェクトのListを取得
        System.out.println("[ShopShowAction.java]: Start");
        System.out.println("[ShopShowAction.java]: ShopService:getShopsメソッドを呼び出し");
        List<Shop> shops = service.getShops();

        // Shopオブジェクトの List をリクエストに設定
        request.setAttribute("shops", shops);

        // 遷移先のページを返す
        System.out.println("[ShopShowAction.java]: End");
        return "shopDetail.jsp";
    }
}