<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean
  id="stations"
  scope="request"
  type="java.util.List<org.javatraining.entity.Station>"
/>
<html>
<header id="header">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>在庫管理システム</title>
    <div id="top" class="top">
      <jsp:include page="template/top.jsp" />
    </div>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
</header>
<main id="main">
      <div id="content">
        <div class="content_title">
          <h1>最寄駅検索</h1>
        </div>
        <table>
          <thead>
            <tr>
              <th class="list">駅名</th>
              <th class="list">路線名</th>
            </tr>
          </thead>
          <tbody>
            <% for(int i = 0; i < stations.size(); i++) {%> <% if (i % 2 ==
            0) { %>
            <tr class="odd">
              <% } else { %>
            </tr>
            <tr class="even">
              <% } %>
              <td><%= stations.get(i).getStationName() %></td>
              <td><%= stations.get(i).getLineName() %></td>
              </td>
            </tr>
            <% } %>
          </tbody>
        </table>

      </div>
  <a href="postal.jsp">戻る</a>
    </div>
</main>
<aside id="sub">
    <div>
      <div id="left">
        <jsp:include page="template/side.jsp" />
      </div>
</aside>
</html>
