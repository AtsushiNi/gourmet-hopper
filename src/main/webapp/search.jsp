<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
          <div class="col-3">
            <div class="shadow p-3 mb-5 bg-white rounded">
              <form action="control" method="post">
                <input type="hidden" name="action_name" value="search" />

                <div class="input-group">
                  <div style="display: flex;">
                    <input
                      type="text"
                      name="shopName"
                      class="form-control"
                      style="border-top-right-radius: 0px; border-bottom-right-radius: 0px;"
                      placeholder="検索キーワードを入力"
                      value=${(requestScope.shopName == null) ? "" : requestScope.shopName}
                    >
                    <button type="button" class="btn btn-secondary" style="border-top-left-radius: 0px; border-bottom-left-radius: 0px;"
                    ><i class="fa fa-search"></i></button>
                  </div>
                </div>
                
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
            <div id="shop-list" data-spy="scroll" style="height: 450px; overflow: auto; margin-top: 30px;">
              <c:forEach var="shop" items="${shops}">
                <div class="shadow-sm p-3 mb-2 bg-white rounded active-item shops" id="${shop.apiId}" style="font-size: 14px;">
                  <div class="row">
                    <div class="col-4">
                      <img src="${shop.photo}" style="width: 150px;">
                    </div>
                    <div class="col-8">
                      <div style="font-size: 18px;">${shop.name}</div>
                      <div>${shop.catchMessage}</div>
                      <div>${shop.budgetAve}</div>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>

          <div class="col-3">
            <div id="map" style="width: 350px; height: 450px; margin-top: 30px;"></div>
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
    <script src="js/search.js"></script>
  </body>
</html>
