<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="image" scope="request" type="java.lang.String" />
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
      <h1>画像取得</h1>
      <p>取得した画像を表示します</p>
      <!--Base64変換したコードを元に画像表示-->
      <img src="data:image/png;base64,<%= image %>" />
    </main>
    <aside id="sub">
      <jsp:include page="template/side.jsp" />
    </aside>
  </body>
</html>
