<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ja">
  <!-- head -->
  <jsp:include page="template/head.jsp">
    <jsp:param name="page" value="showProfile" />
  </jsp:include>

  <body>
    <header id="header">
      <jsp:include page="template/top.jsp" />
    </header>

    <main id="main">
      <div class="container" style="width: 80%;">
        <div class="row mt-5">
          <div class="col-sm-3">
          	<img src= "image/icons/${user.userId}.png" class="rounded-circle shadow" id="avatar" height="200px">
          </div>
          <div class="col-sm">
            <div style="margin-top: 100px;">
              <div id="user-name" style="font-size: 30px;">
                ${user.userName}
              </div>
              <div id="user-email">
                ${user.email}
              </div>
            </div>
          </div>
          <div class="col-sm">
            <h6 class="h6">所属コミュニティ</h6>
            <ul class="list-group">
              <c:forEach var="community" items="${communities}">
                <li class="list-group-item">${community.communityName}</li>
              </c:forEach>
            </ul>
            <div class="form-group mt-4">
              <label for="like-food">好きな食べ物</label>
              <input type="text" class="form-control" id="like-food" value="${user.likeFood}">
            </div>
            <div class="form-group">
              <label for="dislike-food">苦手な食べ物</label>
              <input type="text" class="form-control" id="dislike-food" value="${user.dislikeFood}">
            </div>
            <button class="btn btn-secondary rounded-circle mt-4 ml-auto" style="display: block;">
              <i class="fa-solid fa-pen-to-square"></i>
            </button>
          </div>
        </div>
        
      </div>
    </main>
    
    <!-- footer -->
    <%@ include file="template/footer.jsp" %>

  </body>
</html>