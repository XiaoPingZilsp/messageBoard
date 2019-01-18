<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.lsp.dao.ResponseDaoImp " %>
<%@page import="com.lsp.javabean.Response" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>回复留言</title>
<link rel="stylesheet" href="css/index.css"/>
</head>

<body>
<%
	int id=Integer.parseInt(request.getParameter("id"));
	 ResponseDaoImp responseDao = new ResponseDaoImp();

   	List<Response> list=responseDao.showFrontContent(id);
   	if(list.size()!=0){
   	for (int i = 0; i < list.size(); i++) {
				Response responses = list.get(i);
				
 %>

	<div class="time">回复时间：<%=responses.getTime() %></div>
	<div class="message" style="margin-left:200px;">
    	<form  method="post" action="RecallMessageServlet">
			<table>
		
                <tr>
                    <td align="left">回复人：</td>
                    <td><input type="text" id="name" name="name" value="笔芯" readOnly="true"></td>
                </tr>
			
                <tr>
                    <td align="left">留言内容：</td>
                    <td><textarea id="content" rows="17" cols="70" name="content" readOnly="true"><%=responses.getMessage()%></textarea></td>
                </tr>
                
                 <tr>
                	<td><input type="hidden" id="w_id" name="w_id" value="<%=id%>"></td>
                </tr>
			
                <tr>
                    <td></td>
                    <td>
                        <input type="button" value="返回首页" onClick="location.href='index.jsp'">
                        <input type="button" value="返回上一页" onClick="location.href='frontMessage.jsp?id=<%=id%>'"></td>
                </tr>
              
			</table>		
			<%} %>	
			
			 <%}else{%>
						<p>未收到回复,请点击此处<a href="frontMessage.jsp?id=<%=id%>">返回</a></p>
						<%} %>	
		</form>
    </div>    <!--message end-->
</body>
</html>

