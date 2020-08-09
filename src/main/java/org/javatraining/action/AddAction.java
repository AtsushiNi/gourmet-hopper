package org.javatraining.action;

import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import org.javatraining.entity.Inventory;
import org.javatraining.util.Validator;

// 在庫情報登録アクションクラス
public class AddAction extends InventoryAction {
    private static final int PROD_NAME_MAX_LEN = 100;
    private static final int DESCRIPTION_MAX_LEN = 500;

    @Override
    protected String processInventoryManagement(HttpServletRequest request) throws SQLException, NamingException {
        // リクエスト値の検証
        if (!validateParameters(request)) {
            String productId = request.getParameter("prod_id");
            return "control?action_name=edit&prod_id=" + productId;
        }

        // リクエストの情報により在庫情報オブジェクトを作成
        Inventory inventory = createInventory(request);

        // 商品IDが0かどうかで処理を分岐
        if (inventory.getProductId() == 0) {
            // 新規登録処理
            service.create(inventory);
        } else {
            // 更新処理
            service.update(inventory);
        }

        // 遷移先のページを返す
        return "result.jsp";
    }

    // リクエストの情報により在庫情報オブジェクトを作成
    private Inventory createInventory(HttpServletRequest request) {

        // 在庫情報オブジェクトを生成
        Inventory inventory = new Inventory();

        // リクエストの入力値を取得しながら
        // 在庫情報オブジェクトの各フィールドを設定
        int productId = Integer.parseInt(request.getParameter("prod_id"));
        inventory.setProductId(productId);

        String productName = request.getParameter("prod_name");
        inventory.setProductName(productName);

        int price = Integer.parseInt(request.getParameter("price"));
        inventory.setPrice(price);

        int amount = Integer.parseInt(request.getParameter("amount"));
        inventory.setAmount(amount);

        String location = request.getParameter("location");
        inventory.setLocation(location);

        String description = request.getParameter("description");
        inventory.setDescription(description);

        // 在庫情報オブジェクトを返す
        return inventory;
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
        // 単価の検証
        String strPrice = request.getParameter("price");
        if (!Validator.isInteger(strPrice)) {
            isValid = false;
            errMsgBuilder.append("・単価の値は正の整数にしてください。<br />");
            errCount++;
        }

        // 在庫数量の検証
        String strAmount = request.getParameter("amount");
        if (!Validator.isInteger(strAmount)) {
            isValid = false;
            errMsgBuilder.append("・在庫数量の値は正の整数にしてください。<br />");
            errCount++;
        }
        // 文字データの長さチェック
        // 商品名
        String strProdName = request.getParameter("prod_name");
        if (strProdName.length() > PROD_NAME_MAX_LEN) {
            isValid = false;
            errMsgBuilder.append("・商品名は" + PROD_NAME_MAX_LEN + "文字までにしてください。<br />");
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