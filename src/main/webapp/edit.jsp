<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean
  id="book"
  scope="request"
  class="org.javatraining.entity.Book"
/>
<!DOCTYPE html>
<html>
  <head>
    <meta charset=UTF-8" />
    <title>書籍管理システム</title>
    <link rel="stylesheet" href="css/style.css" />
  </head>
  <body>
    <header id="header">
      <jsp:include page="template/top.jsp" />
    </header>
    <main id="main">
      <h1>書籍詳細</h1>
      <form action="control">
        <input type="hidden" name="prod_id" value="<jsp:getProperty name="book" property="productId" />" />
        <table>
          <tr>
            <th>
              <label for="book_name">書籍名</label>
            </th>
            <td>
              <input id="book_name" name="book_name" type="text" value="<jsp:getProperty name="book" property="bookName" />" required />
            </td>
          </tr>
          <tr>
            <th>
              <label for="author">著者名</label>
            </th>
            <td>
              <input id="author" name="author" type="text" value="<jsp:getProperty name="book" property="author" />" required />
            </td>
          </tr>
          <tr>
            <th>
              <label for="amt">数量</label>
            </th>
            <td>
              <input id="amt" name="amount" type="number" value="<jsp:getProperty name="book" property="amount" />" required />
            </td>
          </tr>
          <tr>
            <th>
              <label for="loc">保管場所</label>
            </th>
            <td>
              <select id="loc" name="location">
                <option value="Tokyo" <%= "Tokyo".equals(book.getLocation()) ? "selected" : "" %>>
                  Tokyo
                </option>
                <option value="Osaka"  <%= "Osaka".equals(book.getLocation()) ? "selected" : "" %>>
                  Osaka
                </option>
                <option value="Nagoya" <%= "Nagoya".equals(book.getLocation()) ? "selected" : "" %>>
                  Nagoya
                </option>
                <option value="Fukuoka" <%= "Fukuoka".equals(book.getLocation()) ? "selected" : "" %>>
                  Fukuoka
                </option>
                <option value="Sapporo" <%= "Sapporo".equals(book.getLocation()) ? "selected" : "" %>>
                  Sapporo
                </option>
                <option value="Naha" <%= "Naha".equals(book.getLocation()) ? "selected" : "" %>>
                  Naha
                </option>
              </select>
            </td>
          </tr>
          <tr>
            <th>
              <label for="desc">商品説明</label>
            </th>
            <td>
              <textarea id="desc" name="description"><jsp:getProperty name="book" property="description" /></textarea>
            </td>
          </tr>
        </table>
        <p>
          <% if(book.getProductId() == 0) { %>
          <input type="submit" value="登録" />
          <% } else { %>
          <input type="submit" value="更新" />
          <input type="submit" value="削除" onclick="window.location.href='control?action_name=delete_confirm&prod_id=<jsp:getProperty name="book" property="productId"/>'; return false;" />
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
    </main>
    <aside id="sub">
      <jsp:include page="template/side.jsp" />
    </aside>
  </body>
</html>