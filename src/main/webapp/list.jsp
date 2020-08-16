<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean
  id="inventories"
  scope="request"
  type="java.util.List<org.javatraining.entity.Inventory>"
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
          <h1>商品一覧</h1>
        </div>
        <table>
          <thead>
            <tr>
              <th class="list">商品名</th>
              <th class="list">単価</th>
              <th class="list">在庫数量</th>
              <th class="list">保管場所</th>
              <th class="list">削除</th>
            </tr>
          </thead>
          <tbody>
            <% for(int i = 0; i < inventories.size(); i++) {%> <% if (i % 2 ==
            0) { %>
            <tr class="odd">
              <% } else { %>
            </tr>
            <tr class="even">
              <% } %>
              <td class="prod name">
                <a
                  href="control?action_name=edit&prod_id=<%=inventories.get(i).getProductId() %>"
                >
                  <%= inventories.get(i).getProductName() %>
                </a>
              </td>
              <td class="number"><%= inventories.get(i).getPrice() %></td>
              <td class="number"><%= inventories.get(i).getAmount() %></td>
              <td class="cent"><%= inventories.get(i).getLocation() %></td>
              <td class="cent">
                <a
                  href="control?action_name=delete_confirm&prod_id=<%= inventories.get(i).getProductId() %>"
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
