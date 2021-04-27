<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="org.javatraining.entity.User" />
<div class="top_logo">
  <a href="control?action_name=show">
    <img src="image/logo.png" />
  </a>
  <p>
    書籍管理システム<br>
    ログイン:<span class="login_user_name"><jsp:getProperty name="user" property="userName" /></span>さん
  </p>
</div>
