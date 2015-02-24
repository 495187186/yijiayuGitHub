<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.mysql.jdbc.*"%>
<%@page import="com.yjr.db.*"%>
<%@page import="java.sql.ResultSet" %>
<%

	String user = "";
	String password = "";
	request.setCharacterEncoding("utf-8");
	if(request.getParameter("user")!=null)
	{
		user = request.getParameter("user").trim();
		
	}
	if(request.getParameter("password")!=null)
	{
		password = request.getParameter("password").trim();
		
	}
	Connection  conn = ConnectDatabase.getConn();
	PreparedStatement pstm = null;
	String mess = "";
	ResultSet res = null;
	String sql = "select * from user_info where user = '"+user+"'";
	pstm = (PreparedStatement) conn.prepareStatement(sql);
	res = pstm.executeQuery();
	if(res.next())
	{
		mess="此用户名已存在";
	}else
	{
	String sql1 = "insert into user_info values('"+user+"','"+password+"')";
	System.out.println(sql1);
	pstm = (PreparedStatement) conn.prepareStatement(sql1);
	int i = pstm.executeUpdate();
 	
	if(i>0){
		
		mess="成功";
	}else{
	
		mess="失败";
	}
	}
	if(pstm!=null){pstm.close();}
	
	if(conn!=null){conn.close();}

%>
  <html>
  <head></head>
   <body><%=mess %></body></html>