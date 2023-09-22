package org.javatraining.action;

import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import org.javatraining.entity.Team;
import org.javatraining.service.TeamService;

public class TeamDetailAction extends Action {

    // サービス
    private final TeamService service = new TeamService();

    @Override
    protected String processRequest(HttpServletRequest request) throws SQLException, NamingException {
    	
    	int teamId = Integer.parseInt(request.getParameter("id"));
    	Team team = service.find(teamId);
    	
    	request.setAttribute("team", team);
    	request.setAttribute("users", team.getUsers());
    	
    	return "teamDetail.jsp";
    }
}
