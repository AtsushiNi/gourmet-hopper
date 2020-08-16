<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<header id="header">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>在庫管理システム</title>
    <div id="top" class="top">
      <jsp:include page="template/top.jsp" />
    </div>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
</header>
<main id="main">
    <form action="control" method="post" class="postal">
      <input type="hidden" name="action_name" value="apicall" />
      <h1>最寄駅検索</h1>
      <p><input type="text" placeholder="1040053" name="postal_code" /></p>
      <p><input type="submit" value="最寄駅検索" class="submit_button" /></p>

      <%-- エラー・メッセージがある場合は表示 --%> <% if
      (request.getAttribute("errorMsg") != null) { %>
      <ul class="error">
        <li>
          <%= request.getAttribute("errorMsg") %>
        </li>
      </ul>
      <% } %>
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
