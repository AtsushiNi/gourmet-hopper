package org.javatraining.action;

import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import org.javatraining.entity.Book;

// 削除処理アクションクラス
public class BookDeleteAction extends BookAction {

    @Override
    protected String processBookManagement(HttpServletRequest request) throws SQLException, NamingException {

        System.out.println("[BookDeleteAction.java]: Start");

        // リクエストから商品IDを取得
        int productId = Integer.parseInt(request.getParameter("prod_id"));

        // 削除対象の書籍情報オブジェクトを作成
        Book book = new Book();
        book.setProductId(productId);

        System.out.println("[BookDeleteAction.java]: BookService:deleteメソッドを呼び出し");
        service.delete(book);
        // 遷移先のページを返す
        System.out.println("[BookDeleteAction.java]: End");
        return "result.jsp";
    }
}