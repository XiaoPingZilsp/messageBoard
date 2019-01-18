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
		
		 //����Ŀ������һ��ʱ����������Ŀֻ����һ�Σ�Ψһ��
        ServletContext context = this.getServletContext(); 
        String url="backstage.jsp";
		
		//��ȡ����
     
		String name = new String(request.getParameter("username").getBytes("ISO-8859-1"),"utf-8");
		String pass = new String(request.getParameter("password").getBytes("ISO-8859-1"),"utf-8");
		String checkcode=new String(request.getParameter("checkcode").getBytes("ISO-8859-1"),"utf-8");
		String piccode=request.getSession().getAttribute("piccode").toString();
		
		if(name.equals("��˼Ƽ" )&pass.equals("123")&checkcode.equals(piccode)){
	
			//��ȡ�û��б�,��һ�λ�ȡʱ��Ϊ��   
			ArrayList<String> users=(ArrayList<String>)context.getAttribute("users"); 
	        //��һ���û���¼ʱ
	        if(users==null){
	            users = new ArrayList<String>();     
	            users.add(name);   
	            context.setAttribute("users", users);   //����һ���û������ֱ��浽ServletContext������   
	        //�ǵ�һ���û���¼   
	        }else{
	            for(String user : users){
	                //������û��Ѿ���¼,���������ٵ�¼
	                if(name.equals(user)){
	                    url = "loginAgain.jsp";   
	                    break;   
	                }
	            }
	            //������û�û��¼,�ͽ����û������ֱ��浽ServletContext������
	            users.add(name); 
	        }
			
	        request.getSession().setAttribute("user", name);   //����һ�¸��û���Ϣ�Ա�����   
	        response.sendRedirect(url); 

		}else{
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
			out.println("<HTML>");
			out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
			out.println("  <BODY>");
			out.print("<p>�û��������ڻ����������֤�����<a href='login.jsp'>�����������</a></p>");
			out.println("  </BODY>");
			out.println("</HTML>");
			out.flush();
			out.close();
		}
	
	}

}
