package com.yjr.db;

import java.sql.DriverManager;

import com.mysql.jdbc.Connection;

public class ConnectDatabase {
	public static Connection getConn() throws Exception{
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");     
	        System.out.println("Success loading Mysql Driver!");
	        conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bishe","root","root");
		} catch (Exception e) {
			e.printStackTrace();
		//s	System.out.println("JDBC��ʽ����MySQL��ݿ�ʧ��");
			conn = null;
		}
		return conn;
	
	}

}
