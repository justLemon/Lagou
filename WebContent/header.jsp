<%@ page language="java" import="java.util.*,com.jobmanager.model.User" pageEncoding="utf-8"%>
  <% 
    User user = (User)session.getAttribute("loginUser");
	  if (user == null) {
	  	response.sendRedirect("login.jsp");
	  	return;
	  }
  %>
	<div id="header">
    	<div class="wrapper">
    		<a href="index.jsp" class="logo">
    			<img src="style/images/logo.png" width="229" height="43" alt="拉勾招聘-专注互联网招聘" />
    		</a>
    		<ul class="reset" id="navheader">
    			<li><a href="index.jsp">首页</a></li>
        	<% if (user.getUserType().equals("0")){ %>
    	        <li ><a href="companylist.jsp" >公司</a></li>
    			<li ><a href="resume.jsp" rel="nofollow">我的简历</a></li>
    	<% } else { %>
    	        <li ><a href="myhome.jsp" >公司</a></li>
	    		<li ><a href="create.jsp" rel="nofollow">发布职位</a></li>
	    		<li><a rel="nofollow" href="canInterviewResumes.jsp">简历管理</a></li>
	    <% } %>
	    	</ul>
	    <% if (user == null) { %>
        	            <ul class="loginTop">
        	            
            	<li><a href="login.jsp" rel="nofollow">登录</a></li> 
            	<li>|</li>
            	<li><a href="register.jsp" rel="nofollow">注册</a></li>
            </ul>
            <% } else {%>
           <dl class="collapsible_menu">
            	<dt>
           			<span><%= user.getUserName() %>&nbsp;</span> 
            		<span class="red dn" id="noticeDot-0"></span>
            		<i></i>
            	</dt>
         <% if (user.getUserType().equals("0")){ %>
                <dd><a rel="nofollow" href="resume.jsp">我的简历</a></dd>
                <dd><a href="collections.jsp">我收藏的职位</a></dd>
                <dd class="logout"><a rel="nofollow" href="login.jsp">退出</a></dd>
         <% } else { %>
                <dd style="display: none;"><a href="create.jsp">我要招人</a></dd>
                <dd class="btm" style="display: none;"><a href="myhome.jsp">我的公司主页</a></dd>
                <dd><a href="accountBind.jsp">帐号设置</a></dd>
                <dd class="logout"><a rel="nofollow" href="login.jsp">退出</a></dd>
            </dl>
            <% } } %>
          
                                </div>
    </div>
