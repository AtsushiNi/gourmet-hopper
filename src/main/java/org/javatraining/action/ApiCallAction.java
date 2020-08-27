package org.javatraining.action;

import javax.servlet.http.HttpServletRequest;
import org.javatraining.entity.Station;
import org.javatraining.service.ApiCallService;
import java.sql.SQLException;
import javax.naming.NamingException;
import java.io.IOException;
import java.util.List;

public class ApiCallAction extends Action{
    private final ApiCallService service = new ApiCallService();

    @Override
    protected String processRequest(HttpServletRequest request) throws SQLException, NamingException,IOException {

        // 郵便番号から最寄駅を検索するWebAPIを実行する
        String postalCode = request.getParameter("postal_code");
        List<Station> stations = service.search(postalCode);

        request.setAttribute("stations", stations);

        // 遷移先のページを返す
        return "stations7.jsp";
        
}

}