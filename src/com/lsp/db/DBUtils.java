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
	//�������ݿ�
	public static Connection getConnection(){
		//�������ݿ�����
		try {
			Class.forName("com.mysql.jdbc.Driver");
		//��ȡ���ݿ����Ӷ���
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
	

	//�رն�����
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



