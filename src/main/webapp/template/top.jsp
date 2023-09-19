<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean
  id="user"
  scope="session"
  class="org.javatraining.entity.User"
/>
<div class="top_logo">
  <a href="control?action_name=show">
    <img src="image/logo.png" />
  </a>
  
  <!-- Header Start -->
  <header class="site-header">
    <div class="wrapper site-header__wrapper">
      <a href="#" class="brand">Brand</a>
      <nav class="nav">
        <button class="nav__toggle" aria-expanded="false" type="button">
          menu
        </button>
        <ul class="nav__wrapper">
          <li class="nav__item"><a href="#">Home</a></li>
          <li class="nav__item"><a href="#">About</a></li>
          <li class="nav__item"><a href="#">Services</a></li>
          <li class="nav__item"><a href="#">Hire us</a></li>
          <li class="nav__item"><a href="#">Contact</a></li>
        </ul>
      </nav>
    </div>
  </header>
  <!-- Header End -->
	  
  <p>
    書籍管理システム<br>
    ログイン:<jsp:getProperty name="user" property="userName" />さん
  </p>
</div>
