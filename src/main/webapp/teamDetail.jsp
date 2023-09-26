<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="row mt-5">
          <div class="col-sm">
            <h4 class="h4 ml-4">${requestScope.team.name}</h4>
          </div>
          <div class="col-sm">
            <table class="table">
              <thead>
                <tr>
                　　<th></th>
                  <th>名前</th>
                  <th>好きなもの</th>
                  <th>苦手なもの</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="user" items="${users}">
                  <tr>
                    <td><input type="image" src= "image/icons/${user.userId}.png" class="rounded-circle" id="avatar" height="40px"></td>
                    <td>${user.userName}</td>
                    <td>${user.likeFood}</td>
                    <td>${user.dislikeFood}</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
        <div class="row">
          <a class="btn btn-dark ml-auto" href="control?action_name=shops_with_team&teamId=${requestScope.team.id}">お店を選ぶ</a>
        </div>
      </div>
    </main>
    
    <!-- footer -->
    <%@ include file="template/footer.jsp" %>

  </body>
</html>
