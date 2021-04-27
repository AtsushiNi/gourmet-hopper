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
      <h1>削除確認</h1>
      <form action="control" class="register_form">
        <input type="hidden" name="prod_id" value="<jsp:getProperty name="book" property="productId" />" />
        <table>
          <tr>
            <th>
              <label for="book name">書籍名</label>
            </th>
            <td>
              <span id="book_name">
                <jsp:getProperty name="book" property="bookName" />
              </span>
            </td>
          </tr>
          <tr>
            <th>
              <label for="author">著者名</label>
            </th>
            <td>
              <span id="author">
                <jsp:getProperty name="book" property="author" />
              </span>
            </td>
          </tr>
          <tr>
            <th>
              <label for="amt">書籍数量</label>
            </th>
              <td>
                <span id="amt">
                  <jsp:getProperty name="book" property="amount" />
                </span>
              </td>
            </tr>
            <tr>
              <th>
                <label for="loc">保管場所</label>
              </th>
              <td>
                <span id="loc">
                  <jsp:getProperty name="book" property="location" />
                </span>
              </td>
            </tr>
            <tr>
              <th><label for="desc">商品説明</label></th>
              <td>
                <span id="desc">
                  <jsp:getProperty name="book" property="description"/>
                </span>
              </td>
            </tr>
          </table>
          <p class="button">
            <input type="hidden" name="action_name" value="delete" />
            <input type="submit" value="削除" class="submit button" />
            <input
              type="button"
              value="詳細に戻る"
              onclick="window.location.href='control?action_name=edit&prod_id=<jsp:getProperty name="book" property="productId"/>'; return false;"
            />
          </p>
        </form>
      </main>
      <aside id="sub">
        <jsp:include page="template/side.jsp" />
      </aside>
    </main>
  </body>
</html>
