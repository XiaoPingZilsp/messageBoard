package com.lsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lsp.dao.ResponseDaoImp;
import com.lsp.dao.WriterDaoImp;
import com.lsp.javabean.Response;

public class RecallMessageServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//获取数据
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
		String content=request.getParameter("content");
		String time=request.getParameter("time");
		int w_id=Integer.parseInt(request.getParameter("w_id"));
		
		//封装数据
		Response responses=new Response();
		responses.setName(name);
		responses.setMessage(content);
		responses.setTime(time);
		responses.setW_id(w_id);
		//数据上传数据库
		ResponseDaoImp responseDaolmp=new ResponseDaoImp();
		responseDaolmp.answerMessage(responses);
		
		response.sendRedirect("newMessage.jsp");
	}

}
