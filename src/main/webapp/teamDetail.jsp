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
        <div class="row">
          <h2>グループ詳細</h2>
        </div>
        <div class="row">
          <div class="col-sm">
            <h4>グループ名</h4>
            <div>${requestScope.team.name}</div>
          </div>
          <div class="col-sm">
            <c:forEach var="user" items="${users}">
              <div class="row">${user.userName}</div>
            </c:forEach>
          </div>
          <div class="col-sm">
            <!-- TODO: 履歴一覧 -->
          </div>
        </div>
      </div>
    </main>
    
    <!-- footer -->
    <%@ include file="template/footer.jsp" %>

  </body>
</html>
