package org.javatraining.action;

import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import org.javatraining.entity.Book;

// 削除確認アクションクラス
public class DeleteConfirmAction extends BookAction {

    @Override
    protected String processBookManagement(HttpServletRequest request) throws SQLException, NamingException {
        // リクエストから商品 ID を取得
        int productId = Integer.parseInt(request.getParameter("prod_id"));

        // 商品 ID に該当する書籍情報を取得
        Book book = service.find(productId);

        // 書籍情報オブジェクトをリクエストに設定
        request.setAttribute("book", book);

        // 遷移先のページを返す
        return "delete.jsp";
    }
}
