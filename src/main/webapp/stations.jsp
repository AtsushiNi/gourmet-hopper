<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean
  id="stations"
  scope="request"
  type="java.util.List<org.javatraining.entity.Station>"
/>
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
      <h1>最寄駅検索</h1>
      <table>
        <thead>
          <tr>
            <th>駅名</th>
            <th>路線名</th>
          </tr>
        </thead>
        <tbody>
          <% for(int i = 0; i < stations.size(); i++) {%>
          <tr>
            <td><%= stations.get(i).getStationName() %></td>
            <td><%= stations.get(i).getLineName() %></td>
          </tr>
          <% } %>
        </tbody>
      </table>
      <a href="postal.jsp">戻る</a>
    </main>
    <aside id="sub">
      <jsp:include page="template/side.jsp" />
    </aside>
  </body>
</html>
