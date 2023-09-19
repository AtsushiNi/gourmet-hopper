package org.javatraining.action;

import java.sql.SQLException;
import javax.naming.NamingException;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;

import org.javatraining.service.CommunityService;

//アクションの抽象クラス
public abstract class Action {

    // 業務処理を呼び出し、その結果を元に遷移先を返す
    public String execute(HttpServletRequest request) {
        try {
        	CommunityService cs = new CommunityService();
        	request.setAttribute("community", cs.getCommunities());
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

    // リクエストに対するActionごとの個別の処理を実行
    protected abstract String processRequest(HttpServletRequest request) throws SQLException, NamingException,IOException;
}