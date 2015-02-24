<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.mysql.jdbc.*"%>
<%@page import="com.yjr.db.*"%>
<%@page import="java.sql.ResultSet" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

	Connection  conn = ConnectDatabase.getConn();
	PreparedStatement pstm = null;
	ResultSet res = null;
	String sql = "select * from bishe.user_info";
	pstm = (PreparedStatement) conn.prepareStatement(sql);
	res = pstm.executeQuery();
	String user = "";
	String password = "";
	while(res.next()){
		  user = res.getString("user");
		  password = res.getString("password");
		System.out.println(user);
		System.out.println(password);
	}
	if(pstm!=null){pstm.close();}
	if(res!=null){res.close();}
	if(conn!=null){conn.close();}

%>

<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
  </head>
  
  <body>
    This is my JSP page. <br>
  <h1><%=user %></h1>
  <h2><%=password %></h2>
  <%=basePath%>
  </body>
</html>
