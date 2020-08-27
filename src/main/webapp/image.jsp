<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="image" scope="request" class="org.javatraining.entity.Image"/>
<html>
<header id="header">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>書籍管理システム</title>
    <div id="top" class="top">
      <jsp:include page="template/top.jsp" />
    </div>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
</header>
<main id="main">
  <body class="login_body">
        <h2>画像取得</h2>
        <h3>取得した画像を表示します</h3>
<!--Base64変換したコードを元に画像表示-->
  <img src="data:image/png;base64,<%= image.getImageCode() %>" />

  </body>
  </main>
  <aside id="sub">
    <div>
      <div id="left">
        <jsp:include page="template/side.jsp" />
      </div>
</aside>
</html>

</html>
