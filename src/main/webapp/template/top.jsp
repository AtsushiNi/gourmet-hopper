<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean
  id="community"
  scope="request"
  type="java.util.List<org.javatraining.entity.Community>"
/>

<!-- Header Start -->
<div>
	<a href="control?action_name=show">
		<img src="image/GourmetHopper.png" width="100px" height="50px"/>
	</a>
	
	<!--コミュニティ名のプルダウン-->
	<select name="communitiy">
      <% for(int i = 0; i < community.size(); i++) {%>          
  	    <option value="community"><%= community.get(i).getCommunityName() %></option>      
      <% } %>
    </select>
    <!--fin コミュニティ名のプルダウン-->
    
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
