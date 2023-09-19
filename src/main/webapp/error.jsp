<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <!-- head -->
  <jsp:include page="template/head.jsp">
    <jsp:param name="page" value="error" />
  </jsp:include>

  <body>
    <header id="header">
      <jsp:include page="template/top.jsp" />
    </header>
    <main id="main">
      <h1>エラー</h1>
      <table>
        <tr>
          <td>
            <h2 class="error">
              <%= request.getAttribute("errorMsg") %>
            </h2>
          </td>
        </tr>
      </table>
    </main>
    <aside id="sub">
      <jsp:include page="template/side.jsp" />
    </aside>
  </body>
</html>
