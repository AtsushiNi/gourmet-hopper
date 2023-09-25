package org.javatraining.ajaxServlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.javatraining.repository.HotpepperRepository;
import org.json.JSONArray;
import org.json.JSONObject;

//クライアントからの入力を受け付け、必要に応じて他のクラスJSPへ処理を振り分ける制御クラス
@MultipartConfig
@WebServlet(urlPatterns = { "/ajaxEndpoint/middleArea" })
public class AreaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get,Post共に同様の処理
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 文字コードを設定
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        try {
            System.out.println("[AreaServlet.java]");

            HotpepperRepository repository = new HotpepperRepository();
            List<Map<String, String>> middleAreas = repository.getMiddleAreas();
            JSONArray array = new JSONArray();
            for(Map<String, String> middleArea : middleAreas) {
            	JSONObject area = new JSONObject(middleArea);
            	array.put(area);
            }
            String json = array.toString();
            
            PrintWriter out = response.getWriter();
            out.print(json);
            out.flush();
        } catch (Exception e) {
            // 例外のスタックトレースを出力
            e.printStackTrace();
        }
    }
}