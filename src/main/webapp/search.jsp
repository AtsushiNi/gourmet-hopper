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
              
                <input
                  type="text"
                  name="shopName"
                  placeholder="検索キーワードを入力"
                  value=${(requestScope.shopName == null) ? "" : requestScope.shopName}
                >
                <input type="submit" value="検索"><br>
              
                <label for="tabaco">喫煙可</label>
                <input type="checkbox" id="tabaco" name="tag" value="tabaco"><br>
              
                <label for="free">飲み放題有り</label>
                <input type="checkbox" id="free" name="tag"value="free"><br>
                
                <label for="party">宴会席有り</label>
                <input type="checkbox" id="party" name="tag" value="party"><br>
                
                <label for="reservation">予約可</label>
                <input type="checkbox" id="reservation" name="tag" value="reservation"><br>

              </form>
            </div>
          </div>

          <div class="col">
            <div id="shop-list" data-spy="scroll" style="height: 400px; overflow: auto;">
              <% for(int i = 0; i < shops.size(); i++) {%>
                <div class="shadow-sm p-3 mb-2 bg-white rounded active-item" id=<%= shops.get(i).getApiId() %>>
                <a href="control?action_name=shop_detail&apiId=<%=shops.get(i).getApiId() %>"><%= shops.get(i).getName() %></a> 
                <img src="<%=shops.get(i).getPhoto()%>"alt="サムネイル">
                【予算】<%= shops.get(i).getBudgetAve() %>
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
  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    	let shopsJson = ${requestScope.shopsJson}
    </script>
    <script src="http://maps.google.com/maps/api/js?key=AIzaSyBYxzFJkG_P15cNs_NQzwCw9QktNHTIlvU&language=ja"></script>
    <script src="js/googlemap.js"></script>
  　<%--<a href="control?action_name=shop_detail&id=1">店舗の詳細を表示</a> --%>
  </body>
</html>
