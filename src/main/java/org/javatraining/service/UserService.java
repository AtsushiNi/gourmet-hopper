package org.javatraining.service;

import java.sql.SQLException;
import javax.naming.NamingException;
import org.javatraining.dao.UserDAO;
import org.javatraining.entity.User;

//ログイン処理 ビジネスロジック
public class UserService {

    private final UserDAO dao = new UserDAO();

    // 入力されたユーザ名とパスワードに該当するユーザ情報を取得する
    public User login(String userName, String password) throws SQLException, NamingException {

        System.out.println("[UserService.java]:login Start");
    	// ユーザマスタより、入力されたユーザ名とパスワードに該当するユーザ情報を取得
        System.out.println("[UserService.java]:UserDAO:findByCredentialメソッドを呼び出し");
        return dao.findByCredential(userName, password);
    }
}