package org.javatraining.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import org.javatraining.service.ImageService;

//画像アップロード処理
public class ImageUploadAction extends Action {
	private final ImageService service = new ImageService();

	@Override
	protected String processRequest(HttpServletRequest request) {

		System.out.println("[ImageUploadAction.java]: Start");

		try {
			//HTMLから画像ファイルを取得。
			Part filePart = request.getPart("file");
			
			//受け取った画像をもとにBase64変換した文字列を取得。
            System.out.println("[ImageUploadAction.java]: ImageService:uploadImageメソッドを呼び出し");
			String image = service.uploadImage(filePart);

			request.setAttribute("image", image);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 遷移先のページを返す
		System.out.println("[ImageUploadAction.java]: End");
		return "imageuploaded.jsp";
	}

}