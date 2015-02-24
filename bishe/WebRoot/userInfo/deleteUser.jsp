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
	
	Connection  conn = ConnectDatabase.getConn();
	PreparedStatement pstm = null;
	String mess2 = "";
	int i = 0;
	String sql = "delete from user_info where user = '"+user+"'";
	pstm = (PreparedStatement) conn.prepareStatement(sql);
	i = pstm.executeUpdate();
	if(i>0)
	{
		response.sendRedirect("list.jsp?mess2=1");
	}else
	{
	
		response.sendRedirect("list.jsp?mess2=2");
	}
	
	if(pstm!=null){pstm.close();}
	
	if(conn!=null){conn.close();}

%>
  