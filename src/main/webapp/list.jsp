<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean
  id="books"
  scope="request"
  type="java.util.List<org.javatraining.entity.Book>"
/>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>書籍管理システム30</title>
    <link rel="stylesheet" href="css/style.css" />
  </head>
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
              <a href="control?action_name=edit&prod_id=<%=books.get(i).getProductId() %>">
                <%= books.get(i).getBookName() %>
              </a>
            </td>
            <td>
              <%= books.get(i).getAuthor() %>
            </td>
            <td>
              <%= books.get(i).getAmount() %>
            </td>
            <td>
              <%= books.get(i).getLocation() %>
            </td>
            <td>
              <a href="control?action_name=delete_confirm&prod_id=<%= books.get(i).getProductId() %>">
                削除
              </a>
            </td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </main>
    <aside id="sub">
      <jsp:include page="template/side.jsp" />
    </aside>
  </body>
</html>
