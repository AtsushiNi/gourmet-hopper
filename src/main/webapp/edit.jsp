<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="book" scope="request" class="org.javatraining.entity.Book" />
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
        <h1>書籍詳細</h1>
      </div>
      <form action="control" method="get" class="register_form">
        <input name="prod_id" type="hidden" value="<jsp:getProperty name="book" property="productId" />" />
        <table>
          <tr>
            <th>
              <label for="book name">書籍名</label>
            </th>
            <td>
              <input id="book_name" name="book_name" type="text" value="<jsp:getProperty name="book" property="bookName" />" class="name_input" required />
            </td>
          </tr>
          <tr>
            <th>
              <label for="author">著者名</label>
            </th>
            <td>
              <input id="author" name="author" type="text" value="<jsp:getProperty name="book" property="author" />" class="name_input" required />
            </td>
          </tr>
          <tr>
            <th>
              <label for="amt">数量</label>
            </th>
            <td>
              <input id="amt" name="amount" type="number" value="<jsp:getProperty name="book" property="amount" />" class="number_input" required />
            </td>
          </tr>
          <tr>
            <th>
              <label for="loc">保管場所</label>
            </th>
            <td>
              <select id="loc" name="location" size="1">
                <option value="Tokyo" 
                  <%= "Tokyo".equals(book.getLocation()) ? "selected" : "" %>>Tokyo
                </option>
                <option value="Osaka" 
                  <%= "Osaka".equals(book.getLocation()) ? "selected" : "" %>>Osaka
                </option>
                <option value="Nagoya" 
                  <%= "Nagoya".equals(book.getLocation()) ? "selected" : "" %>>Nagoya
                </option>
                <option value="Fukuoka" 
                  <%= "Fukuoka".equals(book.getLocation()) ? "selected" : "" %>>Fukuoka
                </option>
                <option value="Sapporo" 
                  <%= "Sapporo".equals(book.getLocation()) ? "selected" : "" %>>Sapporo
                </option>
                <option value="Naha" 
                  <%= "Naha".equals(book.getLocation()) ? "selected" : "" %>>Naha
                </option>
              </select>
            </td>
          </tr>
          <tr>
            <th>
              <label for="desc">商品説明</label>
            </th>
            <td>
              <textarea id="desc" name="description">
                <jsp:getProperty name="book" property="description"/>
              </textarea>
            </td>
          </tr>
        </table>
        <p class="button">
          <% if(book.getProductId() == 0) { %>
          <input type="submit" value="登録" class="submit_button" />
          <% } else { %>
          <input type="submit" value="更新" class="submit_button" />
          <input type="submit" value="削除" onclick="window.location.href='control?action_name=delete_confirm&prod_id=<jsp:getProperty name="book" property="productId"/>'; return false;" class="submit_button" />
          <% } %>
          <input type="hidden" name="action_name" value="registration" />
        </p>
      </form>
      <!-- エラー・メッセージがある場合は表示 -->
      <% if (request.getAttribute("errorMsg") != null) { %>
      <ul class="error">
        <li>
          <%= request.getAttribute("errorMsg") %>
        </li>
      </ul>
      <% } %>
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