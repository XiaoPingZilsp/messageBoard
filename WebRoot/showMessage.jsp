<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.lsp.dao.WriterDaoImp " %>
<%@page import="com.lsp.javabean.Writer" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>显示留言</title>
<link rel="stylesheet" href="css/index.css"/>
</head>

<body>
<%
	int id=Integer.parseInt(request.getParameter("id"));

	
	 WriterDaoImp writerDao = new WriterDaoImp();

   	List<Writer> list=writerDao.showContent(id)  ;
   	for (int i = 0; i < list.size(); i++) {
				Writer writer = list.get(i);
	
 %>
	<div class="time">留言时间：<%=writer.getTime() %></div>
	<div class="message" style="margin-left:200px;">
    	<form>
			<table>
		
                <tr>
                    <td align="left">留言人：</td>
                    <td><input type="text" id="name" name="name" value="<%=writer.getName() %>" readOnly="true"></td>
                </tr>
			
			
                <tr>
                    <td align="left">留言内容：</td>
                    <td><textarea id="content" rows="17" cols="70" name="content" readOnly="true"><%=writer.getMessage() %></textarea></td>
                </tr>
			
                <tr>
                    <td></td>
                    <td><input type="button" value="回复" onClick="location.href='recall.jsp?id=<%=id%>'">
                        <input type="button" value="返回新留言" onClick="location.href='newMessage.jsp'">
                        <input type="button" value="返回留言箱" onClick="location.href='allMessage.jsp'">
                   </td>
                </tr>

			</table>	
			
			<%} %>		
		</form>
    </div>    <!--message end-->
</body>
</html>

