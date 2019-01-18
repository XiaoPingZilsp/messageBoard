package com.lsp.db;


import java.sql.*;

public class Page { 
	String userName="root";
	String userPassword="";
	String url="jdbc:mysql://localhost:3306/message?useUnicode=true&characterEncoding=utf-8";
	Connection dbcon;   
	Statement stmt;
	ResultSet rs; 
   	public Page(){
   		// ֵ
   		stmt = null;
		rs = null;	
		
   		try{			
			
			Class.forName("org.gjt.mm.mysql.Driver");
			
			dbcon= DriverManager.getConnection(url,userName,userPassword);	
		}catch(SQLException ex){
			
			System.out.println(ex.toString());		
		}catch(ClassNotFoundException ex){
			
			System.out.println(ex.toString());	
		}
   	} 
   	
   	
   	
	public boolean exeSql(String strSql){
		try{
   			stmt=dbcon.createStatement();
			stmt.executeUpdate(strSql);
			return true;            
		}catch(Exception ex){
			
			System.out.println(ex.toString());
			return false;
		}			
	}
    public ResultSet exeSqlQuery(String strSql){		
		try{
   			stmt=dbcon.createStatement();
			rs =stmt.executeQuery(strSql);			            
		}catch(Exception ex){
			System.out.println(ex.toString());
			rs = null;
		}		
		return rs;
	}  
}
