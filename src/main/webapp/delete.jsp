<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <jsp:useBean
    id="book"
    scope="request"
    class="org.javatraining.entity.Book"
  />
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
          <h1>削除確認</h1>
        </div>
        <form action="control" class="register_form">
          <input type="hidden" name="prod_id" value="<jsp:getProperty
            name="book"
            property="productId"
          />" />
          <table>
            <tr>
              <th><label for="book name">書籍名</label></th>
              <td>
                <span id="book_name">
                  <jsp:getProperty name="book" property="bookName" />
                </span>
              </td>
            </tr>
            <tr>
              <th><label for="author">著者名</label></th>
              <td>
                <span id="author">
                  <jsp:getProperty name="book" property="author" />
                </span>
              </td>
            </tr>
            <tr>
              <th><label for="amt">書籍数量</label></th>
              <td>
                <span id="amt">
                  <jsp:getProperty name="book" property="amount" />
                </span>
              </td>
            </tr>
            <tr>
              <th><label for="loc">保管場所</label></th>
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
            <input type="button"
            onclick="window.location.href='control?action_name=edit&prod_id=<jsp:getProperty name="book" property="productId"/>'; return false;" value="詳細に戻る" class="submit_button" />
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
