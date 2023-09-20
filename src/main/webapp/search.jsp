<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ja">
  <!-- head -->
  <jsp:include page="template/head.jsp">
    <jsp:param name="page" value="search" />
  </jsp:include>

  <body>
    <header id="header">
      <jsp:include page="template/top.jsp" />
    </header>
    <main id="main">
    <form action="/control" method="post">
    
    <input type="text" name="shopname" placeholder="検索キーワードを入力してください">
    <input type="submit" value="検索">
    
    <input type="checkbox" id="apple" name="fruit" value="apple">
    <label for="apple">りんご</label><br>

    <input type="checkbox" id="banana" name="fruit" value="banana">
    <label for="banana">バナナ</label><br>

    <input type="checkbox" id="orange" name="fruit" value="orange">
    <label for="orange">オレンジ</label><br>
    
    <input type="checkbox" id="grape" name="fruit" value="grape">
    <label for="grape">ぶどう</label><br>
    
    <input type="checkbox" id="strawberry" name="fruit" value="strawberry">
    <label for="strawberry">いちご</label><br>
</form>
      <div id="map" style="width: 400px; height: 400px;"></div>
    </main>
    
    <!-- footer -->
    <%@ include file="template/footer.jsp" %>
    
    <script src="http://maps.google.com/maps/api/js?key=AIzaSyBYxzFJkG_P15cNs_NQzwCw9QktNHTIlvU&language=ja"></script>
    <script src="js/googlemap.js"></script>
  </body>
</html>
