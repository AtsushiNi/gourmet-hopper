<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <!-- head -->
  <jsp:include page="template/head.jsp">
    <jsp:param name="page" value="login" />
  </jsp:include>

  <body>
    <header id="header"></header>
    <main id="main">
      <h1>ログイン</h1>
      <form action="control" method="post">
        <input type="hidden" name="action_name" value="login" />
        <p>
          <label for="user_name">ユーザ名</label>
          <input type="text" id="user_name" name="user_name" />
        </p>
        <p>
          <label for="user_password">パスワード</label>
          <input type="password" id="user_password" name="user_password" />
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
