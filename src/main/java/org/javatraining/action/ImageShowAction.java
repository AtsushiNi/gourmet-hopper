package org.javatraining.action;

import javax.servlet.http.HttpServletRequest;
import org.javatraining.service.ImageService;
import org.javatraining.entity.Image;
import java.sql.SQLException;
import javax.naming.NamingException;
import java.io.IOException;

public class ImageShowAction extends Action{
    private final ImageService service = new ImageService();

    @Override
    protected String processRequest(HttpServletRequest request) throws SQLException, NamingException,IOException {

        System.out.println("[ImageShowAction.java]: Start");
	
        // 画像のURLからBase64変換したコードのテキストを画面に返す
        String imageUrl = "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png";

        System.out.println("[ImageShowAction.java]: ImageService:getImageメソッドを呼び出し");
        Image image = service.getImage(imageUrl);

        request.setAttribute("image", image);

        // 遷移先のページを返す
        System.out.println("[ImageShowAction.java]: End");
        return "image.jsp";
        
}

}