<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean
  id="books"
  scope="request"
  type="java.util.List<org.javatraining.entity.Book>"
/>
<!DOCTYPE html>
<html lang="ja">
  <!-- head --
  <jsp:include page="template/head.jsp">
    <jsp:param name="page" value="list" />
  </jsp:include>

  <body>
    <header id="header">
      <jsp:include page="template/top.jsp" />
    </header>
    <main id="main">
      <h1>書籍一覧</h1>
      <table>
        <thead>
          <tr>
            <th>書籍名</th>
            <th>著者名</th>
            <th>在庫数量</th>
            <th>保管場所</th>
            <th>削除</th>
          </tr>
        </thead>
        <tbody>
          <% for(int i = 0; i < books.size(); i++) {%>
          <tr>
            <td>
                <%= books.get(i).getBookName() %>
            </td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </main>
    <aside id="sub">
      <jsp:include page="template/side.jsp" />
    </aside>
    
    <!-- footer -->
    <%@ include file="template/footer.jsp" %>

  </body>
</html>
