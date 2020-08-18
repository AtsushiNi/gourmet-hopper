<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean
  id="books"
  scope="request"
  type="java.util.List<org.javatraining.entity.Book>"
/>
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
      <div id="content">
        <div class="content_title">
          <h1>書籍一覧</h1>
        </div>
        <table>
          <thead>
            <tr>
              <th class="list">書籍名</th>
              <th class="list">著者名</th>
              <th class="list">在庫数量</th>
              <th class="list">保管場所</th>
              <th class="list">削除</th>
            </tr>
          </thead>
          <tbody>
            <% for(int i = 0; i < books.size(); i++) {%> <% if (i % 2 ==
            0) { %>
            <tr class="odd">
              <% } else { %>
            </tr>
            <tr class="even">
              <% } %>
              <td class="book name">
                <a
                  href="control?action_name=edit&prod_id=<%=books.get(i).getProductId() %>"
                >
                  <%= books.get(i).getBookName() %>
                </a>
              </td>
              <td class="author"><%= books.get(i).getAuthor() %></td>
              <td class="number"><%= books.get(i).getAmount() %></td>
              <td class="cent"><%= books.get(i).getLocation() %></td>
              <td class="cent">
                <a
                  href="control?action_name=delete_confirm&prod_id=<%= books.get(i).getProductId() %>"
                >削除
                </a>
              </td>
            </tr>
            <% } %>
          </tbody>
        </table>
      </div>
    </div>
</main>
<aside id="sub">
    <div>
      <div id="left">
        <jsp:include page="template/side.jsp" />
      </div>
</aside>
</html>
