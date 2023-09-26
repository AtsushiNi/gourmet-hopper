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
	<jsp:param name="page" value="shop_detail" />
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
								<h4><%=shopDetail.getName() %></h4>
									<%
										for(int i = 0; i < reviews.size(); i++){ 
									%>
										<b><%=reviews.get(i).getTitle()%></b><br>
										[評価]<%=reviews.get(i).getComment() %><br>
										[予算]<%=reviews.get(i).getBudget() %><br>
										[お店の雰囲気]<br>
										<%if(reviews.get(i).isForParty()){%>
											〇宴会向け
										<%}%>
										<%if(reviews.get(i).isForReception()){ %>
											〇接待向け
										<%} %>
										<%if(reviews.get(i).isForDate()){ %>
											〇デート向け
										<%} %><br><br>
										
										[お店の詳細]<br>
										<%if(reviews.get(i).isTabaco()){ %>
											喫煙可
										<%}%>
										<%if(reviews.get(i).isFree()){ %>
											食べ放題あり
										<%} %>
										<%if(reviews.get(i).isPartySpace()){ %>
											宴会場あり
										<%} %>
										<%if(reviews.get(i).isReservation()){ %>
											予約可
										<%} %>
										<input type="image" src= "image/icons/<%=reviews.get(i).getUserId()%>.png" class="rounded-circle" id="avatar" height="40px">
										<%=users.get(i).getUserName()%>さんのレビュー
										<hr>
										
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
  				<a class="btn btn-secondary ml-auto" href="control?action_name=review_new&apiId=${requestScope.shopDetail.apiId }">新規レビューを投稿</a>
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