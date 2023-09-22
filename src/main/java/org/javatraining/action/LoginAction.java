package org.javatraining.action;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.javatraining.entity.Community;
import org.javatraining.entity.User;
import org.javatraining.service.CommunityService;
import org.javatraining.service.UserService;

//ログイン処理アクションクラス
public class LoginAction extends Action {
    private final UserService service = new UserService();

    @Override
    protected String processRequest(HttpServletRequest request) throws SQLException, NamingException {

        System.out.println("[LoginAction.java]: Start");

        // ユーザIDとパスワードを取得
        String userName = request.getParameter("name");
        String password = request.getParameter("password");

        // ユーザDBより、入力されたユーザ名とパスワードに該当するユーザ情報を取得
        System.out.println("[LoginAction.java]: username,password = "+ userName +","+ password);
        System.out.println("[LoginAction.java]: UserService:loginメソッドを呼び出し");
        User user = service.login(userName, password);

        if (user == null) {
            // 該当するユーザが存在ししない場合、エラーメッセージをセットしてログインページに推移
            request.setAttribute("errorMsg", "ユーザ名もしくはログイン名が間違っています");

            System.out.println("[LoginAction.java]: End(該当ユーザなし)");
            return "login.jsp";

        } else {
            // 該当するユーザが存在する場合、必要な情報をセッションに格納して商品一覧ページに推移
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            
            //ログイン中のユーザーが所属しているコミュニティ全てをList<Community>型でsessionに格納
            if (session == null || session.getAttribute("communities") == null) {
	        	CommunityService cs = new CommunityService();
	        	session.setAttribute("communities", cs.getCommunities(user.getUserId()));
	        	
	        	//コミュニティIDが一番小さいコミュニティを初期値としてsessionに格納
	        	List<Community> communities = (List<Community>)session.getAttribute("communities");
	        	Community firstCommunity = communities.get(0);
	        	System.out.println("[LoginAction.java]: firstCommunity" + firstCommunity);
	        	session.setAttribute("community", firstCommunity);
        	}
            
            System.out.println("[LoginAction.java]: End(該当ユーザあり)");
            return "control?action_name=home";
        }
    }
    @Override
    public String execute(HttpServletRequest request) {
    	try {
        	// リクエストに対するActionごとの個別の処理
            return processRequest(request);

        } catch (SQLException | NamingException e) {
            // 例外のスタックトレースを出力
            e.printStackTrace();

            // SQLやJNDIの例外が発生した場合、エラ〜メッセージをセットしてエラーページに遷移
            request.setAttribute("errorMsg", "DBアクセス中に例外が発生しました");
            return "error.jsp";
        }
    }
}