<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <!-- head -->
  <jsp:include page="template/head.jsp">
    <jsp:param name="page" value="login" />
  </jsp:include>

  <body class="text-center">
    <form class="form-signin" action="control" method="post">
      <img class="mb-4" src="image/GourmetHopper.png" height="150" />
      <input type="hidden" name="action_name" value="login" />

      <label for="inputName" class="sr-only">User name</label>
      <input type="text" id="inputName" name="name" class="form-control" placeholder="User name" value="武井 凱" required autofocus>

      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" value="takei" required>

      <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      <p class="mt-5 mb-3 text-muted">&copy; 2023</p>

      <%-- エラー・メッセージがある場合は表示 --%>
      <% if (request.getAttribute("errorMsg") != null) { %>
      <ul class="error">
        <li>
          <%= request.getAttribute("errorMsg") %>
        </li>
      </ul>
      <% } %>
    </form>
    
    <!-- footer -->
    <%@ include file="template/footer.jsp" %>

  </body>
</html>
