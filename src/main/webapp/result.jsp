<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
  <!-- head -->
  <jsp:include page="template/head.jsp">
    <jsp:param name="page" value="result" />
  </jsp:include>

  <body>
    <header id="header">
      <jsp:include page="template/top.jsp" />
    </header>
    <main id="main">
      <h1>処理完了</h1>
      <table>
        <tr>
          <td>
            <h2>処理が正常に完了しました。</h2>
          </td>
        </tr>
      </table>
    </main>
    <aside id="sub">
      <jsp:include page="template/side.jsp" />
    </aside>
    
    <!-- footer -->
    <%@ include file="template/footer.jsp" %>

  </body>
</html>
