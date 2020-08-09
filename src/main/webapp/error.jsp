<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>在庫管理システム</title>
    <link type="text/css" rel="stylesheet" href="resources/style.css" />
    <link type="text/css" rel="stylesheet" href="resources/cssLayout.css" />
  </head>
  <body>
    <div id="top" class="top"><jsp:include page="templete/top.jsp" /></div>
    <div>
      <div id="left">
        <jsp:include page="templete/side.jsp" />
      </div>
      <div id="content">
        <div class="content_title">
          <h1>エラー</h1>
        </div>
        <table>
          <tr>
            <td class="result">
              <h2 class="error">
                <%= request.getAttribute("errorMsg") %>
              </h2>
            </td>
          </tr>
        </table>
      </div>
    </div>
  </body>
</html>
