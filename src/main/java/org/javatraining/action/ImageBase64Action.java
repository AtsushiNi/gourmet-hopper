package org.javatraining.action;

import javax.servlet.http.HttpServletRequest;
import org.javatraining.service.ImageService;
import org.javatraining.entity.Image;
import java.sql.SQLException;
import javax.naming.NamingException;
import java.io.IOException;

public class ImageBase64Action extends Action{
    private final ImageService service = new ImageService();

    @Override
    protected String processRequest(HttpServletRequest request) throws SQLException, NamingException,IOException {

        // 画像のURLからBase64変換したコードのテキストを画面に返す
        String imageUrl = "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png";
        Image image = service.getImage(imageUrl);

        request.setAttribute("image", image);

        // 遷移先のページを返す
        return "image.jsp";
        
}

}