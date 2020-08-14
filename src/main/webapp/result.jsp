<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<header id="header">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>在庫管理システム</title>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
  </head>
<main id="main">
    <div id="top" class="top"><jsp:include page="template/top.jsp" /></div>
      <div id="content">
        <div class="content_title">
          <h1>処理完了</h1>
        </div>
        <table>
          <tr>
            <td class="result"><h2>処理が正常に完了しました。</h2></td>
          </tr>
        </table>
      </div>
    </div>
</main>
<aside id="sub">
    <div>
      <div id="left">
        <jsp:include page="template/side.jsp" />
      </div>
</aside>
</html>
