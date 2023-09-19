<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="image" scope="request" type="java.lang.String" />
<!DOCTYPE html>
<html lang="ja">
  <!-- head -->
  <jsp:include page="template/head.jsp">
    <jsp:param name="page" value="image" />
  </jsp:include>

  <body>
    <header id="header">
      <jsp:include page="template/top.jsp" />
    </header>
    <main id="main">
      <h1>画像取得</h1>
      <p>以下のURLの画像を表示します</p>
      <p>https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png</p>
      <!--Base64変換したコードを元に画像表示-->
      <img src="data:image/png;base64,<%= image %>" />
    </main>
    <aside id="sub">
      <jsp:include page="template/side.jsp" />
    </aside>
    
    <!-- footer -->
    <%@ include file="template/footer.jsp" %>

  </body>
</html>
