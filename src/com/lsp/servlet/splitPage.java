package com.lsp.servlet;
import java.sql.*;
import java.util.*;

import com.lsp.db.Page;



public class splitPage extends Page {
	//初始化数据
	private Connection con=null;
	private Statement stmt=null;
	private ResultSet rs=null;
	private ResultSetMetaData rsmd=null;
	//SQL语句
	private String sqlStr;
	
	private int rowCount=0;
	//页数
	private int pageCount=0;
	//每页显示的记录数
	private int pageSize=0;	

	public void setCon(Connection con){
		this.con=con;
		if (this.con == null){
			System.out.println("Failure to get a connection!");
		}else{
			System.out.println("Success to get a connection!");
		}
	}

	
	public void initialize(String sqlStr,int pageSize,int ipage){		
		int irows = pageSize*(ipage-1);
		this.sqlStr=sqlStr;
		this.pageSize=pageSize;
		try	{ 
			rs=super.exeSqlQuery(this.sqlStr);
			if (rs!=null){
				rs.last();
				this.rowCount = rs.getRow();
				rs.first();
				this.pageCount = (this.rowCount - 1) / this.pageSize + 1; 
			} 
			this.sqlStr=sqlStr+" limit "+irows+","+pageSize;
			rs=super.exeSqlQuery(this.sqlStr);
			rsmd=rs.getMetaData(); 
			
		}catch(SQLException e){
			System.out.println(e.toString()); 
		} 
	}
	
	
	public Vector<String[]> getPage(){ 
		Vector<String[]> vData=new Vector<String[]>();
		try	{
			if (rs!=null){
				while(rs.next()){
					String[] sData=new String[12];
					for(int j=0;j<rsmd.getColumnCount();j++){
						sData[j]=rs.getString(j+1);
					}
					vData.addElement(sData);									
				}			
			} 
			rs.close(); 
		} 
		catch(SQLException e){
			System.out.println(e.toString());
		} 
		
		return vData; 
	} 
	
	
	public int getPageCount(){
		return this.pageCount;
	}
	
	
	public int getRowCount(){
		return this.rowCount;
	}
}