<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:useBean id="reviews" scope="request"
	type="java.util.List<org.javatraining.entity.Review>" />
<jsp:useBean id="shopDetail" scope="request"
	type="org.javatraining.entity.Shop" />
<jsp:useBean id="users" scope="request"
	type="java.util.List<org.javatraining.entity.User>" />


<html lang="ja">
<!-- head -->
<jsp:include page="template/head.jsp">
	<jsp:param name="page" value="shopDetail" />
</jsp:include>

<body>
	<header id="header">
		<jsp:include page="template/top.jsp" />
	</header>

	<main id="main">
		<div class="container">
			<div class="row">
				<div class="col-8">
					<ul class="nav nav-tabs" role="tablist" style="border: none;">
						<li class="nav-item">
                            <a class="nav-link active"
    							id="item1-tab" data-toggle="tab" href="#item1" role="tab"
    							aria-controls="item1" aria-selected="true" style="color: inherit;">
                                基本情報
                            </a>
                        </li>
						<li class="nav-item">
                            <a class="nav-link" id="item2-tab"
							     data-toggle="tab" href="#item2" role="tab" aria-controls="item2"
							     aria-selected="false" style="color: inherit;">
                                  みんなのレビュー
                            </a>
                        </li>
					</ul>
					<!--左タブ-->
					<div class="tab-content" style="border: 1px solid #dee2e6; border-radius: 0 10px;">
						<div class="tab-pane fade show active" id="item1" role="tabpanel"
							aria-labelledby="item1-tab">
							<div class="container mt-3" style="height: 400px;">
                                <div class="row">
                                  <div class="col-4">
                                    <img src="<%=shopDetail.getPhoto()%>" >                                  
                                  </div>
                                  <div class="col-8 ml-2" style="font-size: 14px; max-width: 470px;">
                                    <div class="my-3" style="font-size: 18px;">
                                      <%=shopDetail.getName()%>
                                    </div>
                                    <div>
                                      <%=shopDetail.getCatchMessage()%>
                                    </div>
                                    
                                    <div class="mt-3">
                                      <span class="badge badge-secondary"><%=shopDetail.getCard() %></span>
                                      <span class="badge badge-secondary"><%=shopDetail.getNonSmoking() %></span>
                                    </div>
                                    <div>
                                      <i class="fa-solid fa-train"></i>
                                      <%=shopDetail.getAccess()%>
                                    </div>
                                    <div>
                                      <i class="fa-solid fa-location-dot"></i>
                                      <%=shopDetail.getAddress()%>
                                    </div>
                                    
                                    <div class="mt-3">
                                      <a class="btn btn-secondary" style="font-size: 14px;" href="<%=shopDetail.getUrl()%>" target="_blank">お店のHP</a>
                                    </div>
                                  </div>
                                </div>
							</div>
						</div>
						<!--右タブ-->
						<div class="tab-pane fade" id="item2" role="tabpanel"
							aria-labelledby="item2-tab">
							<div data-spy="scroll" style="height: 400px; overflow: auto;">
								<!--ここにレビュー入れる-->
									<%
										for(int i = 0; i < reviews.size(); i++){ 
									%>
                                      <div class="shadow-sm p-3 mb-2 bg-white rounded" style="margin: 5px; margin-bottom: 20px !important;">
                                        <div style="display: flex; line-height: 40px; justify-content: space-between;">
                                          <%=reviews.get(i).getTitle()%>
                                          <div style="font-size: 14px;">
                                            <img src= "image/icons/<%=reviews.get(i).getUserId()%>.png" class="rounded-circle" height="40px">
                                            <%= users.get(i).getUserName() %>
                                          </div>
                                        </div>
                                        <hr>
                                        <div style="display: flex;">
                                          <span class="rate-wrap">
                                            <span class="rate" style="--score: <%= reviews.get(i).getRating() %>"></span>
                                            <span class="rate-num">
                                              <%= reviews.get(i).getRating() %>
                                            </span>
                                          </span>
                                          <span class="budget" style="line-height: 30px; margin-left: 30px; font-size: 14px;">
                                            <%=reviews.get(i).getBudget() %> / 1人
                                          </span>
                                        </div>

                                        <div class="row">
                                          <div class="col">
      										<h6 class="h6">お店の雰囲気</h6>
      										<%if(reviews.get(i).isForParty()){%>
                                                  <span class="badge badge-pill badge-secondary">宴会向け</span>
      										<%}%>
      										<%if(reviews.get(i).isForReception()){ %>
                                                  <span class="badge badge-pill badge-secondary">接待向け</span>
      										<%} %>
      										<%if(reviews.get(i).isForDate()){ %>
                                                  <span class="badge badge-pill badge-secondary">デート向け</span>
      										<%} %>
                                          </div>
  										
                                          <div class="col">
      										<h6 class="h6">お店の詳細</h6>
      										<%if(reviews.get(i).isTabaco()){ %>
                                                  <span class="badge badge-pill badge-secondary">喫煙可</span>
      										<%}%>
      										<%if(reviews.get(i).isFree()){ %>
                                                  <span class="badge badge-pill badge-secondary">食べ放題あり</span>
      										<%} %>
      										<%if(reviews.get(i).isPartySpace()){ %>
                                                  <span class="badge badge-pill badge-secondary">宴会場あり</span>
      										<%} %>
      										<%if(reviews.get(i).isReservation()){ %>
                                                  <span class="badge badge-pill badge-secondary">予約可</span>
      										<%} %>
                                          </div>
                                        </div>
										<hr>

                                        <div>
                                          <%=reviews.get(i).getComment() %>
                                        </div>
								      </div>
									<%} %>

								<!--ここまでレビュー-->
							</div>
						</div>
					</div>
                </div>
                
				<div class="col-4">
					<div id="map" class="ml-auto" style="width: 400px; height: 400px;"></div>
				</div>

			</div>
            <div class="row">
  				<a class="btn btn-secondary ml-auto" href="control?action_name=review_new&apiId=${requestScope.shopDetail.apiId }&shopName=${requestScope.shopDetail.name}">新規レビューを投稿</a>
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
</body>
</html>