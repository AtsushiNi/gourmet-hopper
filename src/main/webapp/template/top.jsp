<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean
  id="user"
  scope="session"
  class="org.javatraining.entity.User"
/>

<!-- Header Start -->
<div>
	<a href="control?action_name=show">
		<img src="image/GourmetHopper.png" width="100px" height="50px"/>
	</a>
    <select name="communitiy">
    	<option value="community">---</option>
    </select>
    <div style="text-align: right">
    	<a href="#">Search</a>
    	<a href="#">Profile</a>
    	<a href="#">Group</a>
    	<a href="#">Profile</a>
    </div>
</div>

<!-- Header End -->

<div class="top_logo">
  <a href="control?action_name=show">
    <img src="image/logo.png" />
  </a>
	  
  <p>
    書籍管理システム<br>
    ログイン:<jsp:getProperty name="user" property="userName" />さん
  </p>
</div>
