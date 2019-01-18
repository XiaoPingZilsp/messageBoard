<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	     
		Calendar date=Calendar.getInstance();
		int year=date.get(Calendar.YEAR);
		int month=date.get(Calendar.MONTH)+1;
		int day=date.get(Calendar.DATE);
	 %>
	<div class="time">时间：<%=year %>-<%=month %>-<%=day %></div>
	<div class="message" style="margin-left:200px;">
    	<form  method="post" action="RecallMessageServlet">
			<table>
		
                <tr>
                    <td align="left">回复人：</td>
                    <td><input type="text" id="name" name="name" value="笔芯" readOnly="true"></td>
                </tr>
			
                <tr>
                    <td align="left">留言内容：</td>
                    <td><textarea id="content" rows="17" cols="70" name="content" ></textarea></td>
                </tr>
                
                 <tr>
                	<td><input type="hidden" id="w_id" name="w_id" value="<%=request.getParameter("id")%>"></td>
                </tr>
			
                <tr>
                    <td><input type="hidden" id="time" name="time" value="<%=year %>-<%=month %>-<%=day %>"></td>
                    <td><input type="submit" value="提交" name="submit">
                        <input type="reset" value="重置" name="reset">
                        <input type="button" value="返回新留言" onClick="location.href='newMessage.jsp'">
                        <input type="button" value="返回留言箱" onClick="location.href='allMessage.jsp'"></td>
                </tr>
               

			</table>			
		</form>
    </div>    <!--message end-->
</body>
</html>

