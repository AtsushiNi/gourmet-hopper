package org.javatraining.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


// 一覧画面表示アクションクラス
public class TopCommunityAction extends Action {
	
    @Override
    protected String processRequest(HttpServletRequest request) {

        // ShopオブジェクトのListを取得
        System.out.println("[TopCommunityAction.java]: Start");
        System.out.println("[TopCommunityAction.java]: コミュニティオブジェクトを生成し、sessionに格納");
        
        HttpSession session = request.getSession(false);
        
        if(session == null || session.getAttribute("community") == null) {
        	session = request.getSession(true);
        } 

        //session.setAttribute("community", request.getParameter("topcommunity") );
        System.out.println("[TopCommunityAction.java]: "+ request.getParameter("topcommunity"));
        System.out.println("[TopCommunityAction.java]: End");

        return "login.jsp";
    }
}