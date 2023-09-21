package org.javatraining.action;

import java.sql.SQLException;
import java.util.Set;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.javatraining.entity.Review;
import org.javatraining.service.ReviewService;

// 書籍情報登録アクションクラス
public class ReviewCreateAction extends Action {

    protected final ReviewService service = new ReviewService();
	
    protected String processRequest(HttpServletRequest request) throws SQLException, NamingException {

        // 書籍情報管理の処理を実行
        return processReviewManagement(request);
    }

    
	protected String processReviewManagement(HttpServletRequest request) throws SQLException, NamingException {

		System.out.println("[ReviewCreateAction.java]: Start");

		// リクエスト値の検証
		// バリデータの作成
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		Validator validator = factory.getValidator();

		// リクエストの情報により書籍情報オブジェクトを作成
		Review review = createReview(request);

		// 書籍情報オブジェクトに対して入力値チェック
		Set<ConstraintViolation<Review>> results = validator.validate(review);
		System.out.println("[ReviewCreateAction.java]: 入力値チェック結果:" + results);

		// 入力値チェックエラーありの場合、エラーメッセージ生成して再度登録画面に遷移
		int errorCount = results.size();
		if (errorCount > 0) {
			// エラーメッセージ用StringBuilderを生成
			StringBuilder errMsgBuilder = new StringBuilder();

			// エラー結果からメッセージをStringBuilderに追記
			errMsgBuilder.append("エラー:" + errorCount + "件<br />");
			results.forEach(result -> {
				errMsgBuilder.append(result.getMessage() + "<br />");
			});

			request.setAttribute("errorMsg", errMsgBuilder.toString());
			String productId = request.getParameter("prod_id");

			System.out.println("[BookAddAction.java]: End(入力値エラーのため登録画面に遷移)");
			return "control?action_name=edit&prod_id=" + productId;
		}

		System.out.println("[BookAddAction.java]: BookService:createメソッドを呼び出し");
		service.create(review);
		System.out.println("[BookAddAction.java]: End(新規登録完了)");


		// 遷移先のページを返す
		return "shopDetail.jsp";
	}

	// リクエストの情報により書籍情報オブジェクトを作成
	private Review createReview(HttpServletRequest request) {

		// 書籍情報オブジェクトを生成
		Review review = new Review();

		// 書籍情報オブジェクトの各フィールドを設定

		String title = request.getParameter("title");
		review.setTitle(title);

		String comment = request.getParameter("comment");
		review.setComment(comment);

		int userId = Integer.parseInt(request.getParameter("userId"));
		review.setUserId(userId);

		int shopId = Integer.parseInt(request.getParameter("shopId"));
		review.setShopId(shopId);

		// 書籍情報オブジェクトを返す
		return review;
	}

}