<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset=UTF-8" />
    <title>書籍管理システム</title>
    <link rel="stylesheet" href="css/style.css" />
  </head>
  <body>
    <header id="header"></header>
    <main id="main">
      <h1>ログイン</h1>
      <form action="control" method="post">
        <input type="hidden" name="action_name" value="login" />
        <p>
          <input type="text" placeholder="User Name" name="user_name" />
        </p>
        <p>
          <input type="password" placeholder="Password" name="user_password" />
        </p>
        <p>
          <input type="submit" value="Log in" />
        </p>
        <%-- エラー・メッセージがある場合は表示 --%>
        <% if (request.getAttribute("errorMsg") != null) { %>
        <ul class="error">
          <li>
            <%= request.getAttribute("errorMsg") %>
          </li>
        </ul>
        <% } %>
      </form>
    </main>
  </body>
</html>
