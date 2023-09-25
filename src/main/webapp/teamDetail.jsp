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
            <h4 class="h4">グループ名</h4>
            <div class="ml-4 mt-5">${requestScope.team.name}</div>
          </div>
          <div class="col-sm">
            <table class="table">
              <thead>
                <tr>
                  <th>名前</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="user" items="${users}">
                  <tr>
                    <td>${user.userName}</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
        <div class="row">
          <a class="btn btn-dark ml-auto" href="control?action_name=search">お店を選ぶ</a>
        </div>
      </div>
    </main>
    
    <!-- footer -->
    <%@ include file="template/footer.jsp" %>

  </body>
</html>
