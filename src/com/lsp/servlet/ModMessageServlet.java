package com.lsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lsp.dao.ResponseDaoImp;
import com.lsp.javabean.Response;

public class ModMessageServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//��ȡ����
				request.setCharacterEncoding("utf-8");
				String name=request.getParameter("name");
				String content=request.getParameter("content");
				String time=request.getParameter("time");
				int re_id=Integer.parseInt(request.getParameter("re_id"));
				
				//��װ����
				Response responses=new Response();
				responses.setName(name);
				responses.setMessage(content);
				responses.setTime(time);
				responses.setId(re_id);

				//�����ϴ����ݿ�
				ResponseDaoImp responseDaolmp=new ResponseDaoImp();
				responseDaolmp.updateAnswer(responses);
			
				response.sendRedirect("myMessage.jsp");
		
	}

}
