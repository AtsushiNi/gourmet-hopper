package org.javatraining.action;

import javax.servlet.http.HttpServletRequest;
import org.javatraining.service.ImageService;

//URL上の画像を取得するアクションクラス
public class ImageShowAction extends Action{
    private final ImageService service = new ImageService();

    @Override
    protected String processRequest(HttpServletRequest request) {

        System.out.println("[ImageShowAction.java]: Start");
	
		try {
	        // 画像のURLをもとにサービスクラスを呼び出し
	        String imageUrl = "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png";			

	        System.out.println("[ImageShowAction.java]: ImageService:getImageメソッドを呼び出し");
			String image = service.getImage(imageUrl);
	        
			request.setAttribute("image", image);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

        // 遷移先のページを返す
        System.out.println("[ImageShowAction.java]: End");
        return "image.jsp";
        
}

}