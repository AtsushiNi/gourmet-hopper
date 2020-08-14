package org.javatraining.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.javatraining.entity.Station;
import org.javatraining.service.ApiCallService;
import java.sql.SQLException;
import javax.naming.NamingException;

public class ApiCallAction extends Action{
    private final ApiCallService service = new ApiCallService();

    @Override
    protected String processRequest(HttpServletRequest request) throws SQLException, NamingException,IOException {

        // ユーザIDとパスワードを取得
        String postalCode = request.getParameter("postal_code");
        Station station = service.search(postalCode);

        return "control?action_name=show";
}

}