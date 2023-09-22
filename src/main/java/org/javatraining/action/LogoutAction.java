package org.javatraining.action;

import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.javatraining.service.UserService;

//ログイン処理アクションクラス
public class LogoutAction extends Action {
    private final UserService service = new UserService();

    @Override
    protected String processRequest(HttpServletRequest request) throws SQLException, NamingException {

        System.out.println("[LogoutAction.java]: Start");

        // ログアウト処理: セッションを破棄
        HttpSession session = request.getSession(false);
        if(session != null) {
        	session.invalidate();
        }

        return "login.jsp";
    }
}