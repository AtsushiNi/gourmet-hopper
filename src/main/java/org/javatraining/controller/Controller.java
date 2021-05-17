package org.javatraining.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.javatraining.action.Action;
import org.javatraining.action.ActionFactory;

//クライアントからの入力を受け付け、必要に応じて他のクラスJSPへ処理を振り分ける制御クラス
@MultipartConfig
@WebServlet(urlPatterns = { "/control" })
public class Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get,Post共に同様の処理
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 文字コードを設定
        request.setCharacterEncoding("UTF-8");

        // 遷移のためのリクエストディスパッチャー
        RequestDispatcher rd = null;

        try {
            // 遷移元で指定されたアクションを取得する。
            String strActionName = request.getParameter("action_name");
            Action action = ActionFactory.getInstance(strActionName);

            System.out.println("[Controller.java] ActionName:"+ strActionName);

            if (action == null) {
                // アクションが取得できなかった場合、セッションを破棄してログインページに遷移
                HttpSession session = request.getSession(false);
                if (session != null) {
                    session.invalidate();
                }

                // ログアウトでない場合は、エラーメッセージを表示
                if (!strActionName.equals("logout")) {
                    request.setAttribute("errorMsg", "不正なページ遷移が行われました。ログイン画面から再度やり直してください");
                }

                // ログインページへの遷移設定
                rd = request.getRequestDispatcher("login.jsp");
            } else {
                // アクションが取得できた場合、処理を実行して遷移先ページを取得
                String forwardPath = action.execute(request);
                rd = request.getRequestDispatcher(forwardPath);
            }

        } catch (Exception e) {
            // 例外のスタックトレースを出力
            e.printStackTrace();

            // 例外が発生した場合、エラーメッセージをセットしてログイン画面に遷移
            request.setAttribute("errorMsg", "不正なページ遷移が行われました。ログイン画面から再度やり直してください");
            rd = request.getRequestDispatcher("login.jsp");
        }
        // 遷移先のページに遷移
        rd.forward(request, response);
    }
}