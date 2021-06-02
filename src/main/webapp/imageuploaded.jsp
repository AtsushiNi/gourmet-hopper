<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="image" scope="request" type="java.lang.String" />
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
     <h1>アップロードした画像を表示します</h1>
       <img src="data:image/png;base64,<%= image %>" />
    </main>   
    <aside id="sub">
      <jsp:include page="template/side.jsp" />
    </aside>
  </body>
</html>