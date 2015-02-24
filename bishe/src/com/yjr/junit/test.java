package com.yjr.junit;

import java.sql.ResultSet;

import org.junit.Test;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.yjr.db.ConnectDatabase;

public class test {

@Test
	public void testDB() throws Exception{
System.out.println("dssss");
	Connection conn = ConnectDatabase.getConn();
	PreparedStatement pstm = null;
	ResultSet res = null;
	String sql = "select * from bishe.user_info";
	pstm = (PreparedStatement) conn.prepareStatement(sql);
	res = pstm.executeQuery();
	while(res.next()){
		String user = res.getString("user");
		String password = res.getString("password");
		System.out.println(user);
		System.out.println(password);
	}
	if(pstm!=null){pstm.close();}
	if(res!=null){res.close();}
	if(conn!=null){conn.close();}
}


}