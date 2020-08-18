<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <!DOCTYPE html>
<html>
<header id="header">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>書籍管理システム</title>
    <div id="top" class="top">
      <jsp:include page="template/top.jsp" />
    </div>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
</header>
<main id="main">
      <div id="content">
        <div class="content_title">
          <h1>書籍登録</h1>
        </div>
        <form action="result.jsp" class="register_form">
          <table>
            <tr>
              <th><label for="book_name">書籍名</label></th>
              <td><input id="book_name" type="text" class="name_input" /></td>
            </tr>
            <tr>
              <th><label for="author">著者名</label></th>
              <td><input id="author" type="text" class="name_input" /></td>
            </tr>
            <tr>
              <th><label for="amt">在庫数量</label></th>
              <td><input id="amt" type="number" value="0" class="number_input"/></td>
            </tr>
            <tr>
              <th><label for="loc">保存場所</label></th>
              <td>
                <select id="loc" size="1">
                  <option value="Tokyo">Tokyo</option>
                  <option value="Osaka">Osaka</option>
                  <option value="Nagoya">Nagoya</option>
                  <option value="Fukuoka">Fukuoka</option>
                  <option value="Sapporo">Sapporo</option>
                  <option value="Naha">Naha</option>
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
  </main>
<aside id="sub">
    <div>
      <div id="left">
        <jsp:include page="template/side.jsp" />
      </div>
</aside>
</html>
