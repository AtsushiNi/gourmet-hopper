package org.javatraining.service;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import org.javatraining.dao.CommunityDAO;
import org.javatraining.entity.Community;

// Community操作ビジネスロジック
public class CommunityService {

    private final CommunityDAO dao = new CommunityDAO();

    // Communityリストを取得する
    public List<Community> getCommunities(int userId) throws SQLException, NamingException {
        System.out.println("[CommunityService.java]:getCommunities Start");
        return dao.findByUserId(userId);
    }
    
    public Community getCommunity(int userId) throws SQLException, NamingException {
        System.out.println("[CommunityService.java]:getCommunity Start");
        return dao.findById(userId);
    }
}