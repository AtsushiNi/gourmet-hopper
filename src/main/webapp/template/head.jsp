<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<%
  String path = request.getParameter("page");
  String cssPath = "css/" + path + ".css";
%>

<head>
  <meta charset="UTF-8">

  <!-- bootstrap4 -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel ="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <script src="https://kit.fontawesome.com/67a6ecf1f9.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/base.css">
  <link rel="stylesheet" href=<%=cssPath%>>
  <!-- TODO アプリの名前を決める -->
  <title>GroumetHopper</title>
  <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>  
  
</head>