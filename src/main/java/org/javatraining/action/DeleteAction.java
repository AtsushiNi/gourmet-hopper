package org.javatraining.action;

import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import org.javatraining.entity.Inventory;

// 削除処理アクションクラス
public class DeleteAction extends InventoryAction {

    @Override
    protected String processInventoryManagement(HttpServletRequest request) throws SQLException, NamingException {

        // リクエストから商品IDを取得
        int productId = Integer.parseInt(request.getParameter("prod_id"));

        // 削除対象の在庫情報オブジェクトを作成
        Inventory inventory = new Inventory();
        inventory.setProductId(productId);

        service.delete(inventory);
        // 遷移先のページを返す
        return "result.jsp";
    }
}