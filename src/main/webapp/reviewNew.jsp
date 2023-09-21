<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ja">
  <!-- head -->
  <jsp:include page="template/head.jsp">
    <jsp:param name="page" value="delete" />
  </jsp:include>

  <body>
    <header id="header">
      <jsp:include page="template/top.jsp" />
    </header>
    <main id="main">
      <h1>レビューを新規作成</h1>
      <form action="control" method="post">
        <input type="hidden" name="action_name" value="review_create" />
        <p>
          <label for="title">タイトル</label>
          <input id="title" name="title" type="text" placeholder="タイトル" />
        </p>
        <p>
          <label for="comment">コメント</label>
          <input id="comment" name="comment" type="text" size=300 placeholder="コメント" />
        </p>
        <input type="hidden" name="userId" value=${user.userId } />
        <input type="hidden" name="shopName" value="あああ" />
        <input type="hidden" name="smallAreaCode" value=X000 />
        <input type="hidden" name="shopApiId" value=J111192710 />
        <p>
          <input type="submit" value="登録" />
        </p>
      </form>
    </main>
    
    <!-- footer -->
    <%@ include file="template/footer.jsp" %>
    
    <script src="http://maps.google.com/maps/api/js?key=AIzaSyBYxzFJkG_P15cNs_NQzwCw9QktNHTIlvU&language=ja"></script>
    <script src="js/googlemap.js"></script>
  </body>
</html>