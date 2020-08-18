package org.javatraining.action;

import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import org.javatraining.entity.Book;

// 削除処理アクションクラス
public class DeleteAction extends BookAction {

    @Override
    protected String processBookManagement(HttpServletRequest request) throws SQLException, NamingException {

        // リクエストから商品IDを取得
        int productId = Integer.parseInt(request.getParameter("prod_id"));

        // 削除対象の書籍情報オブジェクトを作成
        Book book = new Book();
        book.setProductId(productId);

        service.delete(book);
        // 遷移先のページを返す
        return "result.jsp";
    }
}