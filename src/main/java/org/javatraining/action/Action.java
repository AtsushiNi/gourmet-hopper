package org.javatraining.action;

import java.sql.SQLException;
import javax.naming.NamingException;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.javatraining.entity.User;
import org.javatraining.service.CommunityService;

//アクションの抽象クラス
public abstract class Action {

    // 業務処理を呼び出し、その結果を元に遷移先を返す
    public String execute(HttpServletRequest request) {
    	// ログイン済みかどうかのチェック
        if (!checkSession(request)) {
            // ログイン済みでなければ、セッションを破棄してログイン・ページに恐移
            request.setAttribute("errorMsg", "セッションが切断されました。もう一度ログイン画面からやり直してください。");
            return "login.jsp";
        }
    	
        try {
        	HttpSession session = request.getSession(false);
        	if (session == null || session.getAttribute("communities") == null) {
	        	CommunityService cs = new CommunityService();
	        	User user = (User)session.getAttribute("user");
	        	session.setAttribute("communities", cs.getCommunities(user.getUserId()));
        	}
        	// リクエストに対するActionごとの個別の処理
            return processRequest(request);

        } catch (SQLException | NamingException | IOException e) {
            // 例外のスタックトレースを出力
            e.printStackTrace();

            // SQLやJNDIの例外が発生した場合、エラ〜メッセージをセットしてエラーページに遷移
            request.setAttribute("errorMsg", "DBアクセス中に例外が発生しました");
            return "error.jsp";
        }
    }

    
    
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
    
    // リクエストに対するActionごとの個別の処理を実行
    protected abstract String processRequest(HttpServletRequest request) throws SQLException, NamingException,IOException;
}