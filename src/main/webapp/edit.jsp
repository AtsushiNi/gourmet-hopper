<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="inventory" scope="request" class="org.javatraining.entity.Inventory" />
<html>
    <head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在庫管理システム</title>
<link type="text/css" rel="stylesheet" href="resources/style.css">
<link type="text/css" rel="stylesheet" href="resources/cssLayout.css">
</head>
<body> 
<div id="top" class="top"> 
<jsp:include page="template/top.jsp" />
</div>
<div> 
<div id="left"> 
<jsp:include page="template/side.jsp" /> 
</div><div id="content"> 
<div class="content_title"> 
<h1>商品詳細</h1>
</div> 
<form action="control" method="get" class="register_form">
<input name="prod_id" type="hidden" value="<jsp:getProperty name="inventory" property="productId" />" />
<table>
    <tr> 
<th><label for="prod name">商品名</label></th>
<td>
<input id="prod_name" name="prod_name" type="text" value="<jsp:getProperty name="inventory" property="productName" />" class="name_input" required />
</td>
</tr>
<tr> 
<th><label for="prc">単価</label></th>
<td> 
<input id="prc" name="price" type="number" value="<jsp:getProperty name="inventory" property="price" />" class="number_input" required />
</td>
</tr>
<tr> 
<th><label for="amt">数量</label></th>
<td> 
<input id="amt" name="amount" type="number" value="<jsp:getProperty name="inventory" property="amount" />" class="number_input" required /> 
</td>
</tr>
<tr> 
    <th><label for="loc">保管場所</label></th> <td> 
    <select id="loc" name="location" size="1"> 
    <option value="東京" <%= "東京".equals(inventory.getLocation()) ? "selected" : "" %>>東京</option> 
    <option value="大阪" <%= "大阪".equals(inventory.getLocation()) ? "selected" : "" %>>大阪</option> 
    <option value="名古屋" <%= "名古屋".equals(inventory.getLocation()) ? "selected" : "" %>>名古屋</option>
    <option value="福岡" <%= "福岡".equals(inventory.getLocation()) ? "selected" : "" %>>福岡</option> 
    <option value="札幌" <%= "札幌".equals(inventory.getLocation()) ? "selected" : "" %>>札幌</option> 
    <option value="那覇" <%= "那覇".equals(inventory.getLocation()) ? "selected" : "" %>>那覇</option>

</select>
</td>
</tr>
<tr> 
    <th><label for="desc">商品説明</label>
    </th>
    <td> 
    <textarea id="desc" name="description"><jsp:getProperty name="inventory" property="description"/></textarea>
</td>
</tr>
</table>
<p class="button"> 
    <% if(inventory.getProductId() == 0) { %> 
    <input type="submit" value="登録" class="submit_button" />
    <% } else { %> 
    <input type="submit" value="更新" class="submit_button" /> 
    <input type="submit" value="削除"
    onclick="window.location.href='control?action_name=delete_confirm&prod_id=<jsp:getProperty name="inventory" property="productId"/>'; return false;" class="submit_button" />
    <% } %> 
    <input type="hidden" name="action_name" value="registration" />
</p>
</form>
<!-- エラー・メッセージがある場合は表示 -->
<% if (request.getAttribute("errorMsg") != null) { %> 
    <ul class="error"> 
    <li> 
    <%= request.getAttribute("errorMsg") %>
</li>
</ul>
<% } %>
</div>
</div>
</body>
</html>