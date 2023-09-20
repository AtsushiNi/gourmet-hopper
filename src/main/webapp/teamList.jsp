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
        <table class="table">
        <thead>
          <tr>
            <th>name</th>
          </tr>
        </thead>
        <c:forEach var="group" items="${groups}">
          <tr>
            <td>${group.name}</td>
          </tr>
        </c:forEach>
        </table>
      </div>
    </main>
    
    <!-- footer -->
    <%@ include file="template/footer.jsp" %>

  </body>
</html>
