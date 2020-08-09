package org.javatraining.action;

import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import org.javatraining.entity.Inventory;

// 削除確認アクションクラス
public class DeleteConfirmAction extends InventoryAction {

    @Override
    protected String processInventoryManagement(HttpServletRequest request) throws SQLException, NamingException {
        // リクエストから商品 ID を取得
        int productId = Integer.parseInt(request.getParameter("prod_id"));

        // 商品 ID に該当する在庫情報を取得
        Inventory inventory = service.find(productId);

        // 在庫情報オブジェクトをリクエストに設定
        request.setAttribute("inventory", inventory);

        // 遷移先のページを返す
        return "delete.jsp";
    }
}
