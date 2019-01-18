package com.lsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lsp.filter.EncodingFilter;

public class CheckServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doPost(request,response);
	
	}

	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		 //在项目启动第一次时创建，该项目只创建一次，唯一的
        ServletContext context = this.getServletContext(); 
        String url="backstage.jsp";
		
		//获取数据
     
		String name = new String(request.getParameter("username").getBytes("ISO-8859-1"),"utf-8");
		String pass = new String(request.getParameter("password").getBytes("ISO-8859-1"),"utf-8");
		String checkcode=new String(request.getParameter("checkcode").getBytes("ISO-8859-1"),"utf-8");
		String piccode=request.getSession().getAttribute("piccode").toString();
		
		if(name.equals("梁思萍" )&pass.equals("123")&checkcode.equals(piccode)){
	
			//获取用户列表,第一次获取时候为空   
			ArrayList<String> users=(ArrayList<String>)context.getAttribute("users"); 
	        //第一个用户登录时
	        if(users==null){
	            users = new ArrayList<String>();     
	            users.add(name);   
	            context.setAttribute("users", users);   //将第一个用户的名字保存到ServletContext对象中   
	        //非第一个用户登录   
	        }else{
	            for(String user : users){
	                //如果该用户已经登录,请求不让其再登录
	                if(name.equals(user)){
	                    url = "loginAgain.jsp";   
	                    break;   
	                }
	            }
	            //如果该用户没登录,就将该用户的名字保存到ServletContext对象中
	            users.add(name); 
	        }
			
	        request.getSession().setAttribute("user", name);   //保存一下该用户信息以备后用   
	        response.sendRedirect(url); 

		}else{
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
			out.println("<HTML>");
			out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
			out.println("  <BODY>");
			out.print("<p>用户名不存在或口令错误或验证码错误！<a href='login.jsp'>请点击这里，返回</a></p>");
			out.println("  </BODY>");
			out.println("</HTML>");
			out.flush();
			out.close();
		}
	
	}

}
