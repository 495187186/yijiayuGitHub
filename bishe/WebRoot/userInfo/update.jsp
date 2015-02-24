<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.mysql.jdbc.*"%>
<%@page import="com.yjr.db.*"%>
<%@page import="java.sql.ResultSet" %>
<%

		request.setCharacterEncoding("utf-8");
		Connection  conn = ConnectDatabase.getConn();
		String user = "";
		String password1 = "";
		String password2 = "";
		String password3 = "";
		String mess = "";
		if(request.getParameter("user")!=null)
		{
			user = request.getParameter("user").trim();
		}

		if(request.getParameter("password1")!=null)
		{
			password1 = request.getParameter("password1").trim();
	 	}
  
		if(request.getParameter("password2")!=null)
		{
			password2 = request.getParameter("password2").trim();
		}
		
		if(request.getParameter("password3")!=null)
		{
			password3 = request.getParameter("password3").trim();
		}
	
		if(password3.trim().equals(password2.trim())){
			if(!password3.trim().equals("")){
				
				PreparedStatement pstm = null;
				
				ResultSet res = null;
				String sql = "select * from user_info where password = '"+password1+"' and user = '"+user+"'";
				System.out.print(sql);
				pstm = (PreparedStatement) conn.prepareStatement(sql);
			    res = pstm.executeQuery();
				boolean st = false;
				if(res.next()){
					st = true;	
				}
				 
				if(st){
					
					String sqlupdate = "update bishe.user_info set password='"+password2+"' where user = '"+user+"'";				
					PreparedStatement pstmUpdate =  (PreparedStatement) conn.prepareStatement(sqlupdate);
					int i  = pstmUpdate.executeUpdate();
					if(i==1){
						mess = "修改密码success";
					}else{
						mess = "修改密码失败";
					}
					
				}else{
					mess = "原来密码不正确failed";
				}
			}else{
				mess = "新密码不能为空";
			}
		}else{
			mess = "两次密码输入不相等";
		}
		if(conn!=null){conn.close();}
	/*   
	if(request.getParameter("password1")!=null)
	{
		password1 = request.getParameter("password1").trim();
	 }
	if(request.getParameter("password2")!=null)
	{
		password2 = request.getParameter("password2").trim();
	
	if(request.getParameter("password3")!=null)
	{
		password3 = request.getParameter("password3").trim();
	}
	
	  
	Connection  conn = ConnectDatabase.getConn();
	PreparedStatement pstm = null;
	
	ResultSet res = null;
	String sql = "select * from user_info where password = '"+password1+"' and user = '"+user+"'";
	System.out.print(sql);
	pstm = (PreparedStatement) conn.prepareStatement(sql);
	
	res = pstm.executeQuery();
	while(res.next()){
	if(password2.)
	{
		mess="异常";
	}else{
	
	}
	{
		mess="成功";
	}else
	{
	
		mess="失败";
	}
		if(pstm!=null){pstm.close();}
	
	if(conn!=null){conn.close();}
		
	}
	*/
%>
 <%=mess %>