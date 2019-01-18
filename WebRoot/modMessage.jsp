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
<title>修改留言</title>
<link rel="stylesheet" href="css/index.css"/>
</head>

<body>
	<%
		int id=Integer.parseInt(request.getParameter("id"));
	     
		Calendar date=Calendar.getInstance();
		int year=date.get(Calendar.YEAR);
		int month=date.get(Calendar.MONTH)+1;
		int day=date.get(Calendar.DATE);
	 %>
	<div class="time">时间：<%=year %>-<%=month %>-<%=day %></div>
	<div class="message" style="margin-left:200px;">
	
	<%
	ResponseDaoImp responseDao = new ResponseDaoImp();

   	List<Response> list=responseDao.showContent(id)  ;
   	for (int i = 0; i < list.size(); i++) {
				Response responses = list.get(i);
	 %>
	
    	<form  method="post" action="ModMessageServlet">
			<table>
		
                <tr>
                    <td align="left">回复留言人：</td>
                    <td><input type="text" id="name" name="name" value="<%=responses.getName() %>" readOnly="true"></td>
                </tr>

                <tr>
                    <td align="left">留言内容：</td>
                    <td><textarea id="content" rows="17" cols="70" name="content" ><%=responses.getMessage() %></textarea></td>
                </tr>
			
                <tr>
                     
                	<td><input type="hidden" id="re_id" name="re_id" value="<%=request.getParameter("id")%>"></td>
                
                    <td><input type="submit" value="提交" name="submit">
                        <input type="reset" value="重置" name="reset">
                        <input type="button" value="返回" onClick="location.href='myMessage.jsp'"></td>
                </tr>
                <tr><td><input type="hidden" id="time" name="time" value="<%=year %>-<%=month %>-<%=day %>"></td></tr>

			</table>
			
		</form>
		<%} %>	
    </div>    <!--message end-->
</body>
</html>

