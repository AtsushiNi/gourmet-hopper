package org.javatraining.action;

import javax.servlet.http.HttpServletRequest;
import org.javatraining.service.ImageBase64Service;
import java.sql.SQLException;
import javax.naming.NamingException;
import java.io.IOException;

public class ImageBase64Action extends Action{
    private final ImageBase64Service service = new ImageBase64Service();

    @Override
    protected String processRequest(HttpServletRequest request) throws SQLException, NamingException,IOException {

        // 郵便番号から最寄駅を検索するWebAPIを実行する
//        String postalCode = request.getParameter("postal_code");
        String imageUrl = "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png";
        String base64Code = service.getImage(imageUrl);

        request.setAttribute("imageCode", base64Code);

        // 遷移先のページを返す
        return "image.jsp";
        
}

}