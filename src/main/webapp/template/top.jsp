<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="user" scope="session" class="org.javatraining.entity.User" />
<div class="top_title">
  <div class="top_logo">
    <a href="control?action_name=show">
      <img src="resources/logo.jpg" />
    </a>
  </div>
  <h1>在庫管理システム</h1>
</div>
<div class="login_user_area">
  ログイン:
  <span class="login_user_name">
    <jsp:getProperty name="user" property="userName" /></span
  >さん
</div>
