<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <jsp:useBean
    id="inventory"
    scope="request"
    class="org.javatraining.entity.Inventory"
  />
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
          <h1>削除確認</h1>
        </div>
        <form action="control" class="register_form">
          <input type="hidden" name="prod_id" value="<jsp:getProperty
            name="inventory"
            property="productId"
          />" />
          <table>
            <tr>
              <th><label for="prod name">商品名</label></th>
              <td>
                <span id="prod_name">
                  <jsp:getProperty name="inventory" property="productName" />
                </span>
              </td>
            </tr>
            <tr>
              <th><label for="prc">単価</label></th>
              <td>
                <span id="prc">
                  <jsp:getProperty name="inventory" property="price" />
                </span>
              </td>
            </tr>
            <tr>
              <th><label for="amt">在庫数量</label></th>
              <td>
                <span id="amt">
                  <jsp:getProperty name="inventory" property="amount" />
                </span>
              </td>
            </tr>
            <tr>
              <th><label for="loc">保管場所</label></th>
              <td>
                <span id="loc">
                  <jsp:getProperty name="inventory" property="location" />
                </span>
              </td>
            </tr>
            <tr>
              <th><label for="desc">商品説明</label></th>
              <td>
                <span id="desc">
                  <jsp:getProperty name="inventory" property="description"/>
                </span>
              </td>
            </tr>
          </table>
          <p class="button">
            <input type="hidden" name="action_name" value="delete" />
            <input type="submit" value="削除" class="submit button" />
            <input type="button"
            onclick="window.location.href='control?action_name=edit&prod_id=<jsp:getProperty name="inventory" property="productId"/>'; return false;" value="詳細に戻る" class="submit_button" />
          </p>
        </form>
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
