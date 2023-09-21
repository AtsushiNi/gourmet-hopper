<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:useBean
  id="shops"
  scope="request"
  type="java.util.List<org.javatraining.entity.Shop>"
/>

<html lang="ja">
  <!-- head -->
  <jsp:include page="template/head.jsp">
  	<jsp:param name="page" value="search" />
  </jsp:include>
  
  <body>
    <header id="header">
      <jsp:include page="template/top.jsp" />
    </header>
    
    <main id="main">
      <div class="container">
        <div class="row">
          <div class="col">
            <div class="shadow p-3 mb-5 bg-white rounded">
              <form action="control" method="post">
                <input type="hidden" name="action_name" value="search" />
              
                <input type="text" name="shopName" placeholder="検索キーワードを入力">
                <input type="submit" value="検索"><br>
              
                <label for="tabaco">喫煙可</label>
                <input type="checkbox" id="tabaco" name="tag" value="tabaco"><br>
              
                <label for="banana">バナナ</label>
                <input type="checkbox" id="banana" name="fruit" value="banana"><br>
                
                <label for="orange">オレンジ</label>
                <input type="checkbox" id="orange" name="fruit" value="orange"><br>
                
                <label for="grape">ぶどう</label>
                <input type="checkbox" id="grape" name="fruit" value="grape"><br>
                
                <label for="strawberry">いちご</label>
                <input type="checkbox" id="strawberry" name="fruit" value="strawberry"><br>
              </form>
            </div>
          </div>

          <div class="col">
            <div data-spy="scroll" style="height: 400px; overflow: auto;">
              <% for(int i = 0; i < shops.size(); i++) {%>
                <div class="shadow-sm p-3 mb-2 bg-white rounded">
                  <%= shops.get(i).getName() %>
                </div>
              <% } %>
            </div>
          </div>

          <div class="col">
            <div id="map" style="width: 400px; height: 400px;"></div>
          </div>
        </div>
      </div>
    </main>
  
    <!-- footer -->
    <%@ include file="template/footer.jsp"%>
  
    <script src="http://maps.google.com/maps/api/js?key=AIzaSyBYxzFJkG_P15cNs_NQzwCw9QktNHTIlvU&language=ja"></script>
    <script src="js/googlemap.js"></script>
  　<%--<a href="control?action_name=shop_detail&id=1">店舗の詳細を表示</a> --%>
  </body>
</html>
