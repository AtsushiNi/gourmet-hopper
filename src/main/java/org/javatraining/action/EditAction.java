package org.javatraining.action;

import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import org.javatraining.entity.Inventory;

// 在庫情報編集アクションクラス
public class EditAction extends InventoryAction {

    @Override
    protected String processInventoryManagement(HttpServletRequest request) throws SQLException, NamingException {
        // クエリパラメータとして商品 ID が渡ってきた場合、更新処理と見なす
        if (request.getParameter("prod_id") != null) {

            // 商品 ID を取得。
            int productId = Integer.parseInt(request.getParameter("prod_id"));

            // 商品 ID に該当する在庫情報オブジェクトを取得
            Inventory inventory = service.find(productId);
            // 在庫情報オブジェクトをリクエストに設定
            request.setAttribute("inventory", inventory);
        }
        // 遷移先のページを返す
        return "edit.jsp";
    }
}