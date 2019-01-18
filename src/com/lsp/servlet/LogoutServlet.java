package com.lsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 //获取用户信息 
        String user = (String)request.getSession().getAttribute("user");  
        ArrayList<String> users = (ArrayList<String>)this.getServletContext().getAttribute("users"); 
        for(String u:users){
            //将这个用户从ServletContext对象中移除   
            if(user.equals(u)){
                 users.remove(u);    
                 break;   
            }
        }
        
        //将session设置成无效   
        request.getSession().invalidate();  
        response.sendRedirect("login.jsp");
	
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

}
