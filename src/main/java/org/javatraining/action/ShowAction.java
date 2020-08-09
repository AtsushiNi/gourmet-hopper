package org.javatraining.action;

import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import org.javatraining.entity.Inventory;

// 一覧画面表示アクションクラス
public class ShowAction extends InventoryAction {

    @Override
    protected String processInventoryManagement(HttpServletRequest request) throws SQLException, NamingException {

        // 在庫情報オブジェクトのListを取得
        List<Inventory> inventories = service.getInventories();

        // 在庫情報オブジェクトの List をリクエストに設定
        request.setAttribute("inventories", inventories);

        // 遷移先のページを返す
        return "list.jsp";
    }
}