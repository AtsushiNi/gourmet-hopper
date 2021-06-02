package org.javatraining.action;

import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import org.javatraining.entity.Book;

// 書籍情報編集アクションクラス
public class BookEditAction extends BookAction {

    @Override
    protected String processBookManagement(HttpServletRequest request) throws SQLException, NamingException {
        
        System.out.println("[BookEditAction.java]: Start");
    	// クエリパラメータとして商品 ID が渡ってきた場合、更新処理と見なす
    	if (request.getParameter("prod_id") != null) {

            // 商品 ID を取得。
            int productId = Integer.parseInt(request.getParameter("prod_id"));

            // 商品 ID に該当する書籍情報オブジェクトを取得
            System.out.println("[BookEditAction.java]: BookService:findメソッドを呼び出し");
            Book book = service.find(productId);

            // 書籍情報オブジェクトをリクエストに設定
            request.setAttribute("book", book);
        }
        // 遷移先のページを返す
        System.out.println("[BookEditAction.java]: End");
    	return "edit.jsp";
    }
}