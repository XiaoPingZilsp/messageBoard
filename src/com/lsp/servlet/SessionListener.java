package com.lsp.servlet;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * 当用户通过网络来访问一个网站的时候，如果是首次访问，那么在这个网站的服务器端都会创建一个session来保存一些属于这个用户的信息。
 * 
 * 在创建session的时候其实是会触发一个sessionCreated事件的，同样的，当用户正常退出或者是用户登陆了不退出并当session生命周期结束的时候，
 * 
 * 就会触发一个sessionDestroyed事件。这两个事件我们可以通过HttpSessionListener监听器来监听到并可以把它捕捉。
 * 
 */

public class SessionListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent event) {
		// TODO Auto-generated method stub
		System.out.println("---Session被创建!---"); 
	}

	@Override
	@SuppressWarnings("unchecked")
	public void sessionDestroyed(HttpSessionEvent event) {
		// TODO Auto-generated method stub
		 HttpSession session = event.getSession();    
         String user = (String)session.getAttribute("user");    
         ArrayList<String> users = (ArrayList<String>)session.getServletContext().getAttribute("users");  
         for(String u:users){ 
             //将这个用户从ServletContext对象中移除 
             if(u.equals(user)){   
                 users.remove(u);      
                 break;   
             }   
         }   
         //将session设置成无效  
         session.invalidate();   
         System.out.println("一个Session被销毁了!"); 
	}

}
