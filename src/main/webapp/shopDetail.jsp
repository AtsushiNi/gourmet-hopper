<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean
  id="reviews"
  scope="request"
  type="java.util.List<org.javatraining.entity.Review>"
/>

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
      <h1>レビュー一覧</h1>
      <table>
        <thead>
          <tr>
            <th>タイトル</th>
            <th>コメント</th>
          </tr>
        </thead>
        <tbody>
          <% for(int i = 0; i < reviews.size(); i++) {%>
          <tr>
            <td>
              <%= reviews.get(i).getTitle() %>
            </td>
            <td>
              <%= reviews.get(i).getComment() %>
            </td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </main>
    
    <!-- footer -->
    <%@ include file="template/footer.jsp" %>
    
    <script src="http://maps.google.com/maps/api/js?key=AIzaSyBYxzFJkG_P15cNs_NQzwCw9QktNHTIlvU&language=ja"></script>
    <script src="js/googlemap.js"></script>
  </body>
</html>