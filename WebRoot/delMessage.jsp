<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.lsp.dao.ResponseDaoImp " %>
<%@page import="com.lsp.dao.WriterDaoImp " %>
<%@page import="com.lsp.javabean.Response" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>删除留言者留言</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	
	<script type="text/javascript"> 
	function returnbe(){
	<%
	
		
		int w_id=Integer.parseInt(request.getParameter("w_id")); 
		//删除数据
	
    	WriterDaoImp writerDao=new WriterDaoImp();
    	writerDao.delMessageById(w_id);
    	
		
		if(writerDao.checkDelMessage(w_id)){ %>
	alert("操作成功！请按“确定”，返回!");
    			   location.href="allMessage.jsp";
    			   <%}else{%>
    			alert("操作失败！请按“确定”，返回！");
    			   location.href="allMessage.jsp";
    			  <% }%>
    		 	
    		}
    		

    	</script>

  </head>
  
  <body onload="returnbe()">
   
  </body>
</html>
