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
	ResultSet res = null;
	String sql = "SELECT * from user_info where `user`='"+user+"' and `password`='"+password+"'";
	System.out.println(sql);
	pstm = (PreparedStatement) conn.prepareStatement(sql);
	res = pstm.executeQuery();
 	String mess = "";
	if(res.next()){
		  user = res.getString("user");
		  password = res.getString("password");
		System.out.println(user);
		System.out.println(password);
		response.sendRedirect("userInfo/list.jsp");
	}else{
		mess = "index.jsp?mess=logn error&reason=黄聊";
		response.sendRedirect(mess);
	}
	if(pstm!=null){pstm.close();}
	if(res!=null){res.close();}
	if(conn!=null){conn.close();}

%>
  