<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
            <div class="shadow p-3 mb-5 bg-white rounded" style="margin-top: 30px;">
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
                
                <div class="accordion" id="select-areas">
                  <div style="font-size: 14px; margin-top: 20px; margin-bottom: 5px; text-align: end;">
                    <a href="control?action_name=search">デフォルト条件</a>
                  </div>
                  <div class="btn-group dropright my-3" id="drop-down" style="width: 100%; margin-bottom: 0 !important; margin-top: 0 !important;">
                    <button type="button" id="dropdown-button" class="btn btn-light dropdown-toggle" data-toggle="dropdown"
                      aria-haspopup="true" aria-expanded="false" style="background: #EAEAEA">
                      東京
                    </button>
                    <div class="dropdown-menu" style="width: 700px; font-size: 14px;">
                        <div class="container">
                            <div class="row">
                                <div class="col area-col ml-2" style="border-right: 1px solid silver;">
                                </div>
                                <div class="col area-col ml-2" style="border-right: 1px solid silver;">
                                </div>
                                <div class="col area-col ml-2">
                                </div>
                            </div>
                        </div>
                    </div>
                  </div>
                  <div class="btn-group dropright my-3" style="width: 100%;">
                    <c:if test="${areaName != null}">
                      <button type="button" id="area-dropdown-button" class="btn btn-light dropdown-toggle" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false" style="background: #EAEAEA">
                        ${areaName}
                      </button>
                    </c:if>
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
                      <div>
                        <span class="rate-wrap">
                          <span class="rate" style="--score: ${shop.ratingAve}"></span>
                            <c:if test="${shop.reviewCount > 0}">
                              <span class="rate-num">
                                <fmt:formatNumber value="${shop.ratingAve}" pattern="#.##" />
                              </span><i class="fa-solid fa-comment"></i>${shop.reviewCount}人
                            </c:if>
                        </span>
                      </div>
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
  
    <script>
    	let shopsJson = ${requestScope.shopsJson}
    </script>
    <script src="http://maps.google.com/maps/api/js?key=AIzaSyBYxzFJkG_P15cNs_NQzwCw9QktNHTIlvU&language=ja"></script>
    <script src="js/googlemap.js"></script>
    <script src="js/search.js"></script>
  </body>
</html>
