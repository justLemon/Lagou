
<%@ page import="com.jobmanager.dao.UserDao"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<center>
		欢迎<br/>
		<%
			WebApplicationContext wac = WebApplicationContextUtils
					.getWebApplicationContext(this.getServletContext());
			UserDao userDao = (UserDao) wac.getBean("userDaoImpl");
		%>
		<%=userDao.findUserByName("admin")%><br />

	</center>
</body>
</html>
