package org.javatraining.action;

import java.sql.SQLException;
import java.util.Set;
import org.javatraining.entity.Book;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

// 書籍情報登録アクションクラス
public class BookAddAction extends BookAction {

	@Override
	protected String processBookManagement(HttpServletRequest request) throws SQLException, NamingException {

		System.out.println("[BookAddAction.java]: Start");

		// リクエスト値の検証
		// バリデータの作成
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		Validator validator = factory.getValidator();

		// リクエストの情報により書籍情報オブジェクトを作成
		Book book = createBook(request);

		// 書籍情報オブジェクトに対して入力値チェック
		Set<ConstraintViolation<Book>> results = validator.validate(book);
		System.out.println("[BookAddAction.java]: 入力値チェック結果:" + results);

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

		// 商品IDが0かどうかで処理を分岐
		if (book.getProductId() == 0) {
			// 新規登録処理
			System.out.println("[BookAddAction.java]: BookService:createメソッドを呼び出し");
			service.create(book);
			System.out.println("[BookAddAction.java]: End(新規登録完了)");

		} else {
			// 更新処理
			System.out.println("[BookAddAction.java]: BookService:updateメソッドを呼び出し");
			service.update(book);
			System.out.println("[BookAddAction.java]: End(更新完了)");
		}

		// 遷移先のページを返す
		return "result.jsp";
	}

	// リクエストの情報により書籍情報オブジェクトを作成
	private Book createBook(HttpServletRequest request) {

		// 書籍情報オブジェクトを生成
		Book book = new Book();

		// リクエストの入力値を取得しながら
		// 書籍情報オブジェクトの各フィールドを設定
		int productId = Integer.parseInt(request.getParameter("prod_id"));
		book.setProductId(productId);

		String bookName = request.getParameter("book_name");
		book.setBookName(bookName);

		String author = request.getParameter("author");
		book.setAuthor(author);

		int amount = Integer.parseInt(request.getParameter("amount"));
		book.setAmount(amount);

		String location = request.getParameter("location");
		book.setLocation(location);

		String description = request.getParameter("description");
		book.setDescription(description);

		// 書籍情報オブジェクトを返す
		return book;
	}

}