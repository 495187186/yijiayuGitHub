<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.mysql.jdbc.*"%>
<%@page import="com.yjr.db.*"%>
<%@page import="java.sql.ResultSet" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
String mess = "";
String reason = "";
if(request.getParameter("mess")!=null&&request.getParameter("reason")!=null)
{
	mess=request.getParameter("mess");
	reason=request.getParameter("reason");
	
}
	
%>

<html>
  <head>
    <base href="<%=basePath%>">
    <title>login</title>
    <link href="assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/amazeui.min.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>

<form class="am-form"  action="login.jsp" method="post">
  <fieldset>
    <legend>登陆界面</legend>

    <div class="am-form-group">
      <label>用户名</label>
      <input type="text"  name="user"/>
    </div>

    <div class="am-form-group">
      <label>密码</label>
      <input type="password"  name="password" />
    </div>
 
    <p><button type="submit" class="am-btn am-btn-default">提交</button></p>
    <p><a href = "userInfo/insert.jsp">注册</a></p>
  </fieldset>
</form>
<font color="#FF0000"><%=mess %>
<%=reason %></font>

   
  </body>
</html>
