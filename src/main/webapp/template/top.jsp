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
<div id="header-div" class="d-flex flex-column flex-md-row align-items-center px-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
  <!-- ロゴ -->
  <a href="control?action_name=show" >
    <img src="image/GourmetHopper.png" id="header-icon" />
  </a>

  <!--コミュニティ名のプルダウン-->
  <form action="control" method="post" id="form-community" class="mr-md-auto ml-5">
    <div class="form-group">
      <select class="form-control" id="community-select">
        <% for(int i = 0; i < communities.size(); i++) {%>          
          <option value= <%= communities.get(i).getCommunityId()%> ><%= communities.get(i).getCommunityName() %></option>
        <% } %>
      </select>
    </div>
  </form>
  <script>
  	document.getElementById("community-select").value = ${sessionScope.community.communityId}
  </script>
  
  <!-- メニュー -->
  <nav class="my-2 my-md-0 mr-md-3">
    <a class="p-2 text-dark header-links" href="control?action_name=home">Home</a>
    <a class="p-2 text-dark header-links" href="control?action_name=search">Search</a>
    <a class="p-2 text-dark header-links" href="control?action_name=user_list">Users</a>
    <a class="p-2 text-dark header-links" href="control?action_name=group_list">Groups</a>
  </nav>
  <div class="header-overlay"></div>

  <!-- ドロップダウン -->
  <div class="dropdown" id="dropdown">
<!--
    <img class="rounded-circle shadow" id="header-avatar" src="image/icons/${user.userName}.png" />
-->
    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      Menu
    </button>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
      <a class="dropdown-item" href="showProfile.jsp">Profile</a>
      <a class="dropdown-item" href="control?action_name=logout">Log Out</a>
    </div>
  </div>

</div>