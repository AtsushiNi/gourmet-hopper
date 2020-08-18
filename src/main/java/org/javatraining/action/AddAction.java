package org.javatraining.action;

import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import org.javatraining.entity.Book;
import org.javatraining.util.Validator;

// 書籍情報登録アクションクラス
public class AddAction extends BookAction {
    private static final int PROD_NAME_MAX_LEN = 100;
    private static final int DESCRIPTION_MAX_LEN = 500;

    @Override
    protected String processBookManagement(HttpServletRequest request) throws SQLException, NamingException {
        // リクエスト値の検証
        if (!validateParameters(request)) {
            String productId = request.getParameter("prod_id");
            return "control?action_name=edit&prod_id=" + productId;
        }

        // リクエストの情報により書籍情報オブジェクトを作成
        Book book = createBook(request);

        // 商品IDが0かどうかで処理を分岐
        if (book.getProductId() == 0) {
            // 新規登録処理
            service.create(book);
        } else {
            // 更新処理
            service.update(book);
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

    // リクエストのパラメータ値を検証
    private boolean validateParameters(HttpServletRequest request) {

        // 検証結果
        boolean isValid = true;

        // エラーメッセージ
        StringBuilder errMsgBuilder = new StringBuilder();
        // エラー件数
        int errCount = 0;

        // 正の整数値チェック
        // 書籍数量の検証
        String strAmount = request.getParameter("amount");
        if (!Validator.isInteger(strAmount)) {
            isValid = false;
            errMsgBuilder.append("・書籍数量の値は正の整数にしてください。<br />");
            errCount++;
        }
        // 文字データの長さチェック
        // 商品名
        String strBookName = request.getParameter("book_name");
        if (strBookName.length() > PROD_NAME_MAX_LEN) {
            isValid = false;
            errMsgBuilder.append("・書籍名は" + PROD_NAME_MAX_LEN + "文字までにしてください。<br />");
            errCount++;
        }

        // 商品説明
        String strDescription = request.getParameter("description");
        if (strDescription.length() > DESCRIPTION_MAX_LEN) {
            isValid = false;
            errMsgBuilder.append("・商品説明は" + DESCRIPTION_MAX_LEN + "文字までにしてください。<br />");
            errCount++;
        }
        // 検証失敗なら、エラーメッセージを設定
        if (!isValid) {
            errMsgBuilder.insert(0, "エラー:" + errCount + "件<br />");
            request.setAttribute("errorMsg", errMsgBuilder.toString());

        }
        // 検証結果を返す。
        return isValid;

    }
}