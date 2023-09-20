package org.javatraining.service;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import org.javatraining.dao.TeamDAO;
import org.javatraining.entity.Community;
import org.javatraining.entity.Team;

// グループ操作ビジネスロジック
public class TeamService {

    private final TeamDAO dao = new TeamDAO();

    // グループリストを取得する
    public List<Team> getTeams(Community community) throws SQLException, NamingException {
        System.out.println("[TeamService.java]:getTeams Start");
        return dao.findAll(community);
    }
}