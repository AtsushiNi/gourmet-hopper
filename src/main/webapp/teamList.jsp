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
          <h4 class="h4">グループ選択</h4>
        </div>
        <div class="row">
          <div class="col ml-5">
            <c:forEach var="team" items="${teams}">
              <div class="row mt-4">
                <a class="btn btn-secondary" style="width: 300px;" href="control?action_name=team_detail&id=${team.id}">${team.name}</a>
              </div>
            </c:forEach>
          </div>
        </div>
      </div>
    </main>
    
    <!-- footer -->
    <%@ include file="template/footer.jsp" %>

  </body>
</html>
