<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      <h1>最寄駅検索</h1>
      <form action="control" method="post">
        <input type="hidden" name="action_name" value="apicall" />
        <p>
          <input type="text" placeholder="1040053" name="postal_code" />
        </p>
        <p>
          <input type="submit" value="最寄駅検索" />
        </p>
      </form>
    </main>
    <aside id="sub">
      <jsp:include page="template/side.jsp" />
    </aside>
  </body>
</html>