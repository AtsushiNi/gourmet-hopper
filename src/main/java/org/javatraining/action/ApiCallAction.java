package org.javatraining.action;

import javax.servlet.http.HttpServletRequest;
import org.javatraining.entity.Station;
import org.javatraining.service.ApiCallService;
import java.sql.SQLException;
import javax.naming.NamingException;
import java.io.IOException;
import java.util.List;

//WebAPIを実行するアクションクラス
public class ApiCallAction extends Action{
    private final ApiCallService service = new ApiCallService();

    @Override
    protected String processRequest(HttpServletRequest request) throws SQLException, NamingException,IOException {

        System.out.println("[ApiCallAction.java]: Start");
  
        // リクエストから郵便番号を取得。
        String postalCode = request.getParameter("postal_code");

        // 郵便番号をもとにサービスクラスを呼び出し
        System.out.println("[ApiCallAction.java]: ApiCallService searchメソッドを呼び出し");
        List<Station> stations = service.search(postalCode);

        request.setAttribute("stations", stations);

        // 遷移先のページを返す
        System.out.println("[ApiACallAction.java]: End");
        return "stationresult.jsp";
        
}

}