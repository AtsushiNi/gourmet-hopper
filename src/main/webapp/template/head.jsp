<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<%
  String path = request.getParameter("page");
  String cssPath = "css/" + path + ".css";
%>

<head>
  <meta charset="UTF-8">

  <!-- CSS -->
  .brand {
	  font-weight: bold;
	  font-size: 20px; }
	 
	.site-header {
	  position: relative;
	  background-color: #def7ff; }
	 
	.site-header__wrapper {
	  padding-top: 1rem;
	  padding-bottom: 1rem; }
	  @media (min-width: 600px) {
	    .site-header__wrapper {
	      display: flex;
	      justify-content: space-between;
	      align-items: center;
	      padding-top: 0;
	      padding-bottom: 0; } }
	@media (min-width: 600px) {
	  .nav__wrapper {
	    display: flex; } }
	 
	@media (max-width: 599px) {
	  .nav__wrapper {
	    position: absolute;
	    top: 100%;
	    right: 0;
	    left: 0;
	    z-index: -1;
	    background-color: #d9f0f7;
	    visibility: hidden;
	    opacity: 0;
	    transform: translateY(-100%);
	    transition: transform 0.3s ease-out, opacity 0.3s ease-out; }
	    .nav__wrapper.active {
	      visibility: visible;
	      opacity: 1;
	      transform: translateY(0); } }
	 
	.nav__item a {
	  display: block;
	  padding: 1.5rem 1rem; }
	 
	.nav__toggle {
	  display: none; }
	  @media (max-width: 599px) {
	    .nav__toggle {
	      display: block;
	      position: absolute;
	      right: 1rem;
	      top: 1rem; } }
  
  <!-- bootstrap4 -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <link rel="stylesheet" href="../css/base.css">
  <link rel="stylesheet" href=<%=cssPath%>>
  <!-- TODO アプリの名前を決める -->
  <title>app name</title>
  <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
  
  
</head>