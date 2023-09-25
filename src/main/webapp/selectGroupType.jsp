<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <a
              class="shadow m-5 rounded action-card mx-auto"
              href="control?action_name=team_list"
              style="background: white;"
            >
              既存グループで企画
            </a>
          </div>
          <div class="col-sm">
            <a
              class="shadow m-5 rounded action-card mx-auto"
              style="background: white;"
            >
              新規グループで企画
            </a>
          </div>
        </div>
      </div>
    </main>
    
    <!-- footer -->
    <%@ include file="template/footer.jsp" %>

  </body>
</html>
