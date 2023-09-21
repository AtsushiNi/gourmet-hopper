<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean
  id="communities"
  scope="session"
  type="java.util.List<org.javatraining.entity.Community>"
/>
<jsp:useBean
id="user"
scope="session"
class="org.javatraining.entity.User"
/>

<!-- Header Start -->
<div class="header">
	<a href="control?action_name=show">
		<img src="image/GourmetHopper.png" width="100px" height="50px"/>
	</a>
	
	<!--コミュニティ名のプルダウン-->
	<form action="control" method="post">
		<input type="hidden" name="action_name" value="topcommunity">
		<select id="communityNames" name="communityId">
	      <% for(int i = 0; i < communities.size(); i++) {%>          
	  	    <option value= <%= communities.get(i).getCommunityId()%> ><%= communities.get(i).getCommunityName() %></option>
	      <% } %>
	    </select>
	    <input type="submit" value="確定">
	 </form>

    <!--fin コミュニティ名のプルダウン-->
    
    <div style="text-align: right">
    	<a href="#">Search</a>
    	<a href="showProfile.jsp">Profile</a>
    	<a href="#">Group</a>
    	 <form action="showProfile.jsp" method="post">
         <!-- 画像をボタンとして使用 -->
         <input type="image" src= "image/icons/${user.userName}.png" alt="ボタンの画像" name="submitButton" width="50px" height="50px">
         </form>
    </div>
</div>

<!-- Header End -->

<div class="top_logo">
  <a href="control?action_name=show">
    <img src="image/logo.png" />
  </a>
	  
  <p>
    <jsp:getProperty name="user" property="userName" />さん
  </p>
</div>
