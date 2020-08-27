<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<header id="header">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>書籍管理システム</title>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
</header>
<main id="main">
  <body class="login_body">
    <form action="control" method="post" class="login">
      <input type="hidden" name="action_name" value="login" />
      <h2>ログイン</h2>
      <p><input type="text" placeholder="User Name" name="user_name" /></p>
      <p>
        <input type="password" placeholder="Password" name="user_password" />
      </p>
      <p><input type="submit" value="Log in" class="submit_button" /></p>

      <%-- エラー・メッセージがある場合は表示 --%> <% if
      (request.getAttribute("errorMsg") != null) { %>
      <ul class="error">
        <li>
          <%= request.getAttribute("errorMsg") %>
        </li>
      </ul>
      <% } %>
    </form>
  </body>
  </main>
</html> 