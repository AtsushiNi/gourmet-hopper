package org.javatraining.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import org.javatraining.entity.Shop;
import org.javatraining.service.ShopService;

// 一覧画面表示アクションクラス
public class SearchAction extends Action {
	private final ShopService service = new ShopService();

	@Override
    protected String processRequest(HttpServletRequest request) {
        System.out.println("[ShopShowAction.java]: Start");
        System.out.println("[ShopShowAction.java]: ShopService:getShopsメソッドを呼び出し");

        String smallAreaCode = "X175";
        String shopName = request.getParameter("shopName");

        List<Shop> shops = null;
		try {
			shops = service.getShops(smallAreaCode,shopName);
		} catch (SQLException | NamingException | IOException | InterruptedException e) {
			e.printStackTrace();
		}

        // Shopオブジェクトの List をリクエストに設定
        request.setAttribute("shops", shops);

        // 遷移先のページを返す
        System.out.println("[ShopShowAction.java]: End");
 
        return "search.jsp";
    }
}
