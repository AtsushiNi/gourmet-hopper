package org.javatraining.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.javatraining.entity.User;

// ユーザマスタへのアクセスを行うクラス
public class UserDAO {
	
	
    // ログイン情報に対応するユーザ情報を検索する
    public User findByCredential(String userName, String password) throws SQLException, NamingException {

    	System.out.println("[UserDAO.java]:findByCredential Start");
        String sql = "SELECT * FROM USERS WHERE NAME = ? AND PASSWORD = ? ";

        // データソースを取得
        DataSource ds = DataSourceSupplier.getDataSource();
        try (Connection con = ds.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)){

            // SQL文のプレースホルダに値をセット
            ps.setString(1, userName);
            ps.setString(2, password);

            // SQL実行
            try (ResultSet rs = ps.executeQuery()) {
                // ResultSetのカーソルを一行進める
                if (!rs.next()) {
                    // 対象がない場合は処理を中断
                    return null;
                }

                // Userオブジェクトを作成して返す
                User user = new User();
                user.setUserId(rs.getInt("ID"));
                user.setUserName(rs.getString("NAME"));
                user.setPassword(rs.getString("PASSWORD"));
                user.setEmail(rs.getString("EMAIL"));
                user.setLikeFood(rs.getString("LIKE_FOOD"));
                user.setDislikeFood(rs.getString("DISLIKE_FOOD"));
                
            	System.out.println("[UserDAO.java]:findByCredential SQL実行結果 :"+ user);
                return user;
            }
        }
    }
}
