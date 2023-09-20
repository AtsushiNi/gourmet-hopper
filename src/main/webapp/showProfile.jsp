<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ja">
  <!-- head -->
  <jsp:include page="template/head.jsp">
    <jsp:param name="page" value="home" />
  </jsp:include>

  <body>
    <header id="header">
      <jsp:include page="template/top.jsp" />
    </header>

    <main id="main">
    <div class="container" style="width: 80%;">
      <div class="row">
        <div class="col-sm">
        	<input type="image" src= "image/icons/${user.userName}.png">
        </div>
        <div class="col-sm">
        	ID : ${user.userId}<br>
        	Name : ${user.userName}<br>
        	所属コミュニティ： <ul>
        					<c:forEach var="community" items="${communities}">
        						<li>${community.communityName}</li>
        					</c:forEach>
        				</ul><br>
        	レビュー履歴（後から）<br>
        	パスワードを編集（仮）
        </div>
      </div>
    </div>
    </main>
    
    <!-- footer -->
    <%@ include file="template/footer.jsp" %>

  </body>
</html>