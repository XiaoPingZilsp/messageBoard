package com.lsp.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtils {

	private static Connection con;
	private static String id = "root";
	private static String pwd = "";
	private static String url = "jdbc:mysql://localhost:3306/message?useUnicode=true&characterEncoding=utf-8";
	//连接数据库
	public static Connection getConnection(){
		//加载数据库驱动
		try {
			Class.forName("com.mysql.jdbc.Driver");
		//获取数据库连接对象
			try {
				con = DriverManager.getConnection(url,id,pwd);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return con;
	}
	

	//关闭对象流
	public static void closeCon(){
		try {
			if (con!=null) {
				con.close();
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			con = null;
		}
	}
	
}



