package org.javatraining.action;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.javatraining.entity.Community;
import org.javatraining.entity.Team;
import org.javatraining.service.TeamService;

public class TeamListAction extends Action {

    // サービス
    private final TeamService service = new TeamService();

    @Override
    protected String processRequest(HttpServletRequest request) throws SQLException, NamingException {
    	
    	HttpSession session = request.getSession();
    	Community community = (Community)session.getAttribute("community");
    	
    	List<Team> teams = service.getTeams(community);
    	
    	request.setAttribute("teams", teams);
    	
    	return "teamList.jsp";
    }
}
