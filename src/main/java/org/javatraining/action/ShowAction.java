package org.javatraining.action;

import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import org.javatraining.entity.Book;

// 一覧画面表示アクションクラス
public class ShowAction extends BookAction {

    @Override
    protected String processBookManagement(HttpServletRequest request) throws SQLException, NamingException {

        // 書籍情報オブジェクトのListを取得
    	System.out.println("ShowAction Start");
        List<Book> books = service.getBooks();

        // 書籍情報オブジェクトの List をリクエストに設定
        request.setAttribute("books", books);

        // 遷移先のページを返す
        return "list.jsp";
    }
}