<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.mysql.jdbc.*"%>
<%@page import="com.yjr.db.*"%>
<%@page import="java.sql.ResultSet" %>
<%
	request.setCharacterEncoding("utf-8");
	String user = "";
	String password = "";
	
	if(request.getParameter("user")!=null)
	{
		user = request.getParameter("user").trim();
		
	}
	
	

%>
  <html>
  <head></head>
  <body>
  <form class="am-form"  action="update.jsp" method="post">
   <div class="am-form-group">
   <label>用户名</label>
   <input type="text"  name="user" value="<%=user %>"/>
  <label>原密码</label>
      <input type="text"  name="password1" />
      <label>新密码</label>
      <input type="password"  name="password2" />
      <label>确认新密码</label>
      <input type="password"  name="password3" />
      <p><button type="submit" class="am-btn am-btn-default">提交</button></p>
    
    </div>
      </form></body></html>