<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.lsp.dao.ResponseDaoImp " %>
<%@page import="com.lsp.dao.WriterDaoImp " %>
<%@page import="com.lsp.javabean.Response" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>删除回复留言</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	
	<script type="text/javascript"> 
	function returnbe(){
	<%
	
		int re_id=Integer.parseInt(request.getParameter("re_id")); 
		int w_id=Integer.parseInt(request.getParameter("w_id")); 
		//删除数据
		ResponseDaoImp responseDao=new ResponseDaoImp();
		responseDao.delMessageById(re_id);
	//修改为未回复状态
    	WriterDaoImp writerDao=new WriterDaoImp();
    	writerDao.updateNoAnswer(w_id);
    	
		
		if(responseDao.checkDelMessage(re_id)){ %>
	alert("操作成功！请按“确定”，返回!");
    			   location.href="myMessage.jsp";
    			   <%}else{%>
    			alert("操作失败！请按“确定”，返回！");
    			   location.href="myMessage.jsp";
    			  <% }%>
    		 	
    		}
    		

    	</script>

  </head>
  
  <body onload="returnbe()">
   
  </body>
</html>
