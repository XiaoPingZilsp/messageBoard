package com.lsp.servlet;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * ���û�ͨ������������һ����վ��ʱ��������״η��ʣ���ô�������վ�ķ������˶��ᴴ��һ��session������һЩ��������û�����Ϣ��
 * 
 * �ڴ���session��ʱ����ʵ�ǻᴥ��һ��sessionCreated�¼��ģ�ͬ���ģ����û������˳��������û���½�˲��˳�����session�������ڽ�����ʱ��
 * 
 * �ͻᴥ��һ��sessionDestroyed�¼����������¼����ǿ���ͨ��HttpSessionListener�������������������԰�����׽��
 * 
 */

public class SessionListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent event) {
		// TODO Auto-generated method stub
		System.out.println("---Session������!---"); 
	}

	@Override
	@SuppressWarnings("unchecked")
	public void sessionDestroyed(HttpSessionEvent event) {
		// TODO Auto-generated method stub
		 HttpSession session = event.getSession();    
         String user = (String)session.getAttribute("user");    
         ArrayList<String> users = (ArrayList<String>)session.getServletContext().getAttribute("users");  
         for(String u:users){ 
             //������û���ServletContext�������Ƴ� 
             if(u.equals(user)){   
                 users.remove(u);      
                 break;   
             }   
         }   
         //��session���ó���Ч  
         session.invalidate();   
         System.out.println("һ��Session��������!"); 
	}

}
