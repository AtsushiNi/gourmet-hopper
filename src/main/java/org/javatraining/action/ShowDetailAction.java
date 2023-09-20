package org.javatraining.action;

import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.javatraining.entity.User;
import org.javatraining.service.BookService;

// 書籍情報管理の抽象アクションクラス
public abstract class ShowDetailAction extends Action {

    // 書籍情報管理サービス
    protected final BookService service = new BookService();

    @Override
    protected String processRequest(HttpServletRequest request) throws SQLException, NamingException {

        

        // 書籍情報管理の処理を実行
        return processBookManagement(request);
    }

    // 書籍情報管理の処理
    protected abstract String processBookManagement(HttpServletRequest request)
            throws SQLException, NamingException;

  
}
