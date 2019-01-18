package com.lsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lsp.dao.WriterDaoImp;
import com.lsp.javabean.Writer;

public class MessageServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doPost(request,response);	
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				//获取数据
					request.setCharacterEncoding("utf-8");
					String name=request.getParameter("name");
					String email=request.getParameter("email");
					String theme=request.getParameter("theme");
					String content=request.getParameter("content");
					String time=request.getParameter("time");
					String answer=request.getParameter("answer");
					
				
				//封装数据
					Writer writer=new Writer();
					writer.setName(name);
					writer.setEmail(email);
					writer.setTheme(theme);
					writer.setMessage(content);
					writer.setTime(time);
					writer.setRecall(answer);
					
				//数据上传数据库
					WriterDaoImp writerDaolmp=new WriterDaoImp();
					writerDaolmp.addMessage(writer);
				
					response.sendRedirect("index.jsp");
	}

}
