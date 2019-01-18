package com.lsp.filter;

import java.io.IOException;

import javax.servlet.*;
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;

import com.lsp.servlet.CheckServlet;

public class EncodingFilter implements Filter {
	protected String encoding=null;
	protected FilterConfig config;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		this.config=filterConfig;
		this.encoding=filterConfig.getInitParameter("Encoding");
		
	}

	

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		if(request.getCharacterEncoding()==null){
			String encode=getEncoding();
			if(encode!=null){
				request.setCharacterEncoding(encode);
				response.setCharacterEncoding(encode);				
				response.setContentType("text/html;charset=utf-8");	
			}
		}
		
		chain.doFilter(request, response);
	
	}
	
	protected String getEncoding(){
		return encoding;
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	

}
