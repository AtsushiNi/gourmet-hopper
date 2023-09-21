<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="reviews" scope="request"
	type="java.util.List<org.javatraining.entity.Review>" />
<jsp:useBean id="apiId" scope="request"
	type="java.util.List<org.javatraining.entity.Shop>" />

<!DOCTYPE html>

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
				<div class="col">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							id="item1-tab" data-toggle="tab" href="#item1" role="tab"
							aria-controls="item1" aria-selected="true">基本情報</a></li>
						<li class="nav-item"><a class="nav-link" id="item2-tab"
							data-toggle="tab" href="#item2" role="tab" aria-controls="item2"
							aria-selected="false">みんなのレビュー</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade show active" id="item1" role="tabpanel"
							aria-labelledby="item1-tab">
							<div data-spy="scroll" style="height: 400px; overflow: auto;">
								<h3>詳細情報</h3>
								<!--ここに店の情報入れる-->
								<table>
									<thead>
										<tr>
											<th>お店の詳細情報</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
										</tr>
									</tbody>
								</table>
								<!--ここまで店の情報-->
							</div>
						</div>
<<<<<<< HEAD
					</div>
					<div class="tab-pane fade" id="item2" role="tabpanel" aria-labelledby="item2-tab">
						<div data-spy="scroll" style="height: 400px; overflow: auto;">
							<!--ここにレビュー入れる-->
							<table>
							<thead>
								<tr>
								<th>タイトル</th>
								<th>コメント</th>
								</tr>
							</thead>
							<tbody>
								<% for(int i = 0; i < reviews.size(); i++) {%>
								<tr>
								<td>
								<%= reviews.get(i).getTitle() %>
								</td>
								<td>
								<%= reviews.get(i).getComment() %>
								</td>
								</tr>
								<% } %>
							</tbody>
							</table>
							<!--ここまでレビュー-->
=======
						<div class="tab-pane fade" id="item2" role="tabpanel"
							aria-labelledby="item2-tab">
							<div data-spy="scroll" style="height: 400px; overflow: auto;">
								<!--ここにレビュー入れる-->

								<table>
									<thead>
										<tr>
											<th>タイトル</th>
											<th>コメント</th>
										</tr>
									</thead>
									<tbody>
										<%
										for (int i = 0; i < reviews.size(); i++) {
										%>
										<tr>
											<td><%=reviews.get(i).getTitle()%></td>
											<td><%=reviews.get(i).getComment()%></td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
							</div>
>>>>>>> refs/remotes/origin/master
						</div>
					</div>
				</div>

				<div class="col">
					<div id="map" style="width: 400px; height: 400px;"></div>
				</div>

			</div>
		</div>
		<div style="text-align: right">
			<a href="control?action_name=review_new&id=1">新規レビューを投稿</a>
		</div>
	</main>
	<!--ここまでレビュー-->
	<!-- footer -->
	<%@ include file="template/footer.jsp"%>

	<script
		src="http://maps.google.com/maps/api/js?key=AIzaSyBYxzFJkG_P15cNs_NQzwCw9QktNHTIlvU&language=ja"></script>
	<script src="js/googlemap.js"></script>
</body>
</html>