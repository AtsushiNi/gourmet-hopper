package org.javatraining.action;

import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

// 一覧画面表示アクションクラス
public class BookShowAction extends BookAction {

    @Override
    protected String processBookManagement(HttpServletRequest request) throws SQLException, NamingException {

        // 書籍情報オブジェクトのListを取得
        System.out.println("[BookShowAction.java]: Start");
        System.out.println("[BookShowAction.java]: BookService:getBooksメソッドを呼び出し");
//        List<Book> books = service.getBooks();

        // 書籍情報オブジェクトの List をリクエストに設定
//        request.setAttribute("books", books);

        // 遷移先のページを返す
        System.out.println("[BookShowAction.java]: End");
        return "search.jsp";
    }
}