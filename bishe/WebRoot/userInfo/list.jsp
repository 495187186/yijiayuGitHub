<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.mysql.jdbc.*"%>
<%@page import="com.yjr.db.*"%>
<%@page import="java.sql.ResultSet" %>
<html>
<head>
	<title>用户名列表</title>
	<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
		function clickDelete(thisObj,user){
			 
			 var value = "";
			 value = $(thisObj).attr("class"); 
			// alert(value);
			// return ;
			 
			 
			  var url = "list.jsp?user="+user+"&operation=deleteUserInfo";
			  $(thisObj).attr("href",url); 
		}
	</script>
</head>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
String mess2 = "";

String operation = "";
String user1 = "";
if(request.getParameter("user")!=null)
{
	user1 = request.getParameter("user").trim();
if(request.getParameter("operation")!=null){
	operation = request.getParameter("operation").trim();
	
	if(operation.trim().equals("deleteUserInfo")){
		System.out.println("operation is deleteUserInfo..");
		Connection  conn = ConnectDatabase.getConn();
	PreparedStatement pstm = null;

	int i = 0;
	String sql = "delete from user_info where user = '"+user1+"'";
	pstm = (PreparedStatement) conn.prepareStatement(sql);
	i = pstm.executeUpdate();
	if(i>0)
	{
		mess2="删除成功";
	}else
	{
		mess2="删除失败";
		
	}
	
	if(pstm!=null){pstm.close();}
	
	if(conn!=null){conn.close();}
		
	}else if(operation.trim().equals("updateUserInfo"))
	{
		System.out.println("operation is updateUserInfo..");
		
	}else{
			System.out.println("wrong");
		}
}else{
	System.out.println("operation is null");
}
}else
{
	System.out.println("first");
}


%>

  <body> 
  <table width="100%"  border="1" cellspacing="0" cellpadding="0" bordercolor="#000000" bordercolordark="#FFFFFF" bgcolor="#FFFFFF" >
  	<tr>
  		<td>序号</td>
  		<td>用户名</td>
  		<td>密码</td>
  		<td>删除</td>
  		<td>修改</td>
  	</tr>
  
<%

	request.setCharacterEncoding("utf-8");
	
	
	
	Connection  conn = ConnectDatabase.getConn();
	PreparedStatement pstm = null;
	String mess = "";
	ResultSet res = null;
	String sql = "select user,password from user_info ";
	pstm = (PreparedStatement) conn.prepareStatement(sql);
	res = pstm.executeQuery();
	int i = 0;
	while(res.next())
	{
		 i++;
		 String user = res.getString("user");
		 String password = res.getString("password");
		 %>
		 	<tr>
		 		<td><%=i %></td>
		 		<td><%=user %></td>
		 		<td><%=password %></td>
		 		<td><a href="#" class="一家与" onclick="clickDelete(this,<%=user %>)">删除</a></td>
		 		<td><a href="list.jsp?user=<%=user %>&operation=updateUserInfo">修改</a></td>
		 	</tr>
		 <% 
		 
	}
	if(pstm!=null){pstm.close();}
	if(conn!=null){conn.close();}

%>


  </table>
  <%=mess2 %>
  </body></html>