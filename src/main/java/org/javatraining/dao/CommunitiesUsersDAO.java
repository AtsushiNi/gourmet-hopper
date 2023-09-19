package org.javatraining.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.sql.DataSource;
import org.javatraining.entity.CommunitiesUsers;

// ユーザマスタへのアクセスを行うクラス
public class CommunitiesUsersDAO {
	
	
    // ログイン情報に対応するユーザ情報を検索する
    public CommunitiesUsers findByCredential(int communityId, int userId) throws SQLException, NamingException {

    	System.out.println("[CommunitiesUsersDAO.java]:findByCredential Start");
        String sql = "SELECT ID, COMMUNITY_ID, USER_ID FROM COMMUNITIES_USERS WHERE COMMUNITY_ID = ? AND USER_ID = ? ";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)){

            // SQL文のプレースホルダに値をセット
            ps.setInt(1, communityId);
            ps.setInt(2, userId);

            // SQL実行
            try (ResultSet rs = ps.executeQuery()) {
                // ResultSetのカーソルを一行進める
                if (!rs.next()) {
                    // 対象がない場合は処理を中断
                    return null;
                }

                // Userオブジェクトを作成して返す
                CommunitiesUsers communitiesusers = new CommunitiesUsers();
                communitiesusers.setId(rs.getInt("ID"));
                communitiesusers.setCommunityId(rs.getInt("COMMUNITY_ID"));
                communitiesusers.setUserId(rs.getInt("USER_ID"));
                
            	System.out.println("[CommunitiesUsersDAO.java]:findByCredential SQL実行結果 :"+ communitiesusers);
                return communitiesusers;
            }
        }
    }
}
