package org.javatraining.action;

import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.javatraining.entity.User;
import org.javatraining.service.LoginService;

//ログイン処理アクションクラス
public class LoginAction extends Action {
    private final LoginService service = new LoginService();

    @Override
    protected String processRequest(HttpServletRequest request) throws SQLException, NamingException {

        // ユーザIDとパスワードを取得
        String userName = request.getParameter("user_name");
        String password = request.getParameter("user_password");

        // ユーザマスタより、入力されたユーザ名とパスワードに該当するユーザ情報を取得
        User user = service.login(userName, password);

        if (user == null) {
            // 該当するユーザが存在ししない場合、エラーメッセージをセットしてログインページに推移
            request.setAttribute("errorMsg", "ユーザ名もしくはログイン名が間違っています");

            return "login.jsp";

        } else {
            // 該当するユーザが存在する場合、必要な情報をセッションに格納して商品一覧ページに推移
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            return "control?action_name=show";
        }
    }

}