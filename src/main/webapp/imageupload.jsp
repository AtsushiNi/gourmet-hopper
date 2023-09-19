<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <!-- head -->
  <jsp:include page="template/head.jsp">
    <jsp:param name="page" value="imageupload" />
  </jsp:include>

  <body>
    <header id="header">
      <jsp:include page="template/top.jsp" />
    </header>
    <main id="main">
     <h1>画像アップロード</h1>
     <form action="control" method="post" enctype="multipart/form-data">
       <input type="hidden" name="action_name" value="imageupload" />
       <input type="file" name="file" />
       <button>Upload</button>
     </form>
    </main>
    <aside id="sub">
      <jsp:include page="template/side.jsp" />
    </aside>
  </body>
</html>