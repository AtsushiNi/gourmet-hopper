package org.javatraining.service;

import java.sql.SQLException;
import javax.naming.NamingException;
import org.javatraining.dao.UserMasterDAO;
import org.javatraining.entity.User;

//ログイン処理 ビジネスロジック
public class LoginService {

    private final UserMasterDAO dao = new UserMasterDAO();

    // 入力されたユーザ名とパスワードに該当するユーザ情報を取得する
    public User login(String userName, String password) throws SQLException, NamingException {
        // ユーザマスタより、入力されたユーザ名とパスワードに該当するユーザ情報を取得
        return dao.findByCredential(userName, password);
    }
}