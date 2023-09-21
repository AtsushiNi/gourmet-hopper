package org.javatraining.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.javatraining.service.CommunityService;


// 一覧画面表示アクションクラス
public class TopCommunityAction extends Action {
	
    @Override
    protected String processRequest(HttpServletRequest request) {

        //sessionにプルダウンで選択したコミュニティを格納
        System.out.println("[TopCommunityAction.java]: Start");
        System.out.println("[TopCommunityAction.java]: コミュニティオブジェクトを生成し、sessionに格納");
        
        HttpSession session = request.getSession(true);
        
        try {
        	//formのselect boxで選択されたcommunity名に対応するcommunityIdを取得し、sessionに格納
        	int communityId = Integer.parseInt(request.getParameter("communityId"));
        	CommunityService cs = new CommunityService();
        	session.setAttribute("community", cs.getCommunity(communityId));
            System.out.println("[TopCommunityAction.java]: request.getParameter(\"communityId\") "+ request.getParameter("communityId"));
            System.out.println("[TopCommunityAction.java]: cs.getCommunity(communityId) "+ cs.getCommunity(communityId));
        } catch(Exception e) {
        	e.printStackTrace();
        }
    	

        System.out.println("[TopCommunityAction.java]: End");

        return "control?action_name=shop_detail";
    }
}