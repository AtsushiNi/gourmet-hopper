package org.javatraining.action;

import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.javatraining.entity.User;
import org.javatraining.service.BookService;

// 書籍情報管理の抽象アクションクラス
public abstract class BookAction extends Action {

    // 書籍情報管理サービス
    protected final BookService service = new BookService();

    @Override
    protected String processRequest(HttpServletRequest request) throws SQLException, NamingException {

        // ログイン済みかどうかのチェック
        if (!checkSession(request)) {
            // ログイン済みでなければ、セッションを破棄してログイン・ページに恐移
            request.setAttribute("errorMsg", "セッションが切断されました。もう一度ログイン画面からやり直してください。");
            return "login.jsp";
        }

        // 書籍情報管理の処理を実行
        return processBookManagement(request);
    }

    // 書籍情報管理の処理
    protected abstract String processBookManagement(HttpServletRequest request)
            throws SQLException, NamingException;

    // セッションが存在するかどうかのチェック
    protected boolean checkSession(HttpServletRequest request) {
        // セッションオブジェクトを取得
        HttpSession session = request.getSession(false);
        // セッションに User オブジェクトが格納されていなければ false
        if (session == null) {
            return false;
        } else if (session.getAttribute("user") == null) {
            return false;
        }

        // セッションから User オブジェクトを取り出す
        User user = (User) session.getAttribute("user");
        // User オブジェクトのユーザ名が null なら false
        if (user.getUserName() == null) {
            return false;
        }
        // どれにも当てはまらなければtrue
        return true;
    }
}
