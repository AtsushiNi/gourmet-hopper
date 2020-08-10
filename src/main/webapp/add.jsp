<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>在庫管理システム</title>
    <link type="text/css" rel="stylesheet" href="resources/style.css" />
    <link type="text/css" rel="stylesheet" href="resources/cssLayout.css" />
  </head>
  <body>
    <div id="top" class="top">
      <jsp:include page="template/top.jsp" />
    </div>
    <div>
      <div id="left">
        <jsp:include page="template/side.jsp" />
      </div>
      <div id="content">
        <div class="content_title">
          <h1>商品登録</h1>
        </div>
        <form action="result.jsp" class="register_form">
          <table>
            <tr>
              <th><label for="prod_name">商品名</label></th>
              <td><input id="prod_name" type="text" class="name_input" /></td>
            </tr>
            <tr>
              <th><label for="prc">単価</label></th>
              <td>
                <input id="prc" type="number" value="0" class="number_input" />
              </td>
            </tr>
            <tr>
              <th><label for="amt">在庫数量</label></th>
              <td>
                <input id="amt" type="number" value="0" class="number_input" />
              </td>
            </tr>
            <tr>
              <th><label for="loc">保存場所</label></th>
              <td>
                <select id="loc" size="1">
                  <option value="東京">東京</option>
                  <option value="大阪">大阪</option>
                  <option value="名古屋">名古屋</option>
                  <option value="福岡">福岡</option>
                  <option value="札幌">札幌</option>
                  <option value="那覇">那覇</option>
                </select>
              </td>
            </tr>
            <tr>
              <th><label for="desc">商品説明</label></th>
              <td><textarea id="desc"></textarea></td>
            </tr>
          </table>
          <p class="button">
            <input type="submit" value="登録" class="submit button" />
          </p>
        </form>
      </div>
    </div>
  </body>
</html>
