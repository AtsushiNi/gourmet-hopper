<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean
  id="book"
  scope="request"
  class="org.javatraining.entity.Book"
/>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>書籍管理システム</title>
    <link rel="stylesheet" href="css/style.css" />
  </head>
  <body>
    <header id="header">
      <jsp:include page="template/top.jsp" />
    </header>
    <main id="main">
      <h1>削除確認</h1>
      <form action="control">
        <input type="hidden" name="prod_id" value="<jsp:getProperty name="book" property="productId" />" />
        <table>
          <tr>
            <th>書籍名</th>
            <td>
              <jsp:getProperty name="book" property="bookName" />
            </td>
          </tr>
          <tr>
            <th>著者名</th>
            <td>
              <jsp:getProperty name="book" property="author" />
            </td>
          </tr>
          <tr>
            <th>書籍数量</th>
            <td>
              <jsp:getProperty name="book" property="amount" />
            </td>
          </tr>
          <tr>
            <th>保管場所</th>
            <td>
              <jsp:getProperty name="book" property="location" />
            </td>
          </tr>
          <tr>
            <th>商品説明</th>
            <td>
              <jsp:getProperty name="book" property="description"/>
            </td>
          </tr>
        </table>
        <p>
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
  </body>
</html>
