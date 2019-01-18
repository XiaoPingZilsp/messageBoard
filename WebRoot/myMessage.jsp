<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page  import="java.sql.*" %>
<%@ page  import="java.util.*" %>
<%@page import="com.lsp.db.DBUtils"%>
<jsp:useBean class="com.lsp.servlet.splitPage" id="pages" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>我的留言</title>
<link rel="stylesheet" href="css/newMessage.css"/>
</head>

<body>
<h2>我的留言列表</h2>
    <hr/> 
    <table class="table" >
    	
    	<tr class="tr01">
        	<th>回复留言人</th>
            <th>回复内容</th>
            <th>时间</th>
            <th>操作</th>
        </tr>
        
         <%!	
	//每页显示的记录数
	int pageSize = 8;
	String sqlStr="";
	//当前页
	int showPage=1;
	%> 
     <%

	sqlStr="select tb_response.*,tb_writer.* from tb_response,tb_writer where tb_response.w_id=tb_writer.w_id order by re_id DESC";	  		

	//查询数据表，获得查询结果	
	String strPage=null;
	//获取跳转到的目的页面
	strPage=request.getParameter("showPage");
		if (strPage==null)
			{
				showPage=1;
			}else
				{
					try
					{
						showPage=Integer.parseInt(strPage);
					}catch(NumberFormatException e){
						showPage = 1;
						}
					if(showPage<1) {
						showPage=1;
					}
				}
				
			pages.initialize(sqlStr,pageSize,showPage);
			//获取要显示的数据集合
			Vector<String[]> vData=pages.getPage();
			//显示留言信息
			 for(int i=0;i<vData.size();i++)
				{
					//显示数据
					String[] sData=(String[])vData.get(i);	
						if(i%2==0){
         %> 
        
        
        <tr class="tr02">
        	<td><%=sData[6]%></td>
            <td><a href="modMessage.jsp?id=<%=sData[0]%>"><%=sData[3]%></a></td>
            <td><%=sData[4]%></td>
            <td><a href="modMessage.jsp?id=<%=sData[0]%>">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="delReMessage.jsp?re_id=<%=sData[0] %>&w_id=<%=sData[1] %>">删除</a></td>
        </tr>
        
        <%}else{ %>
        
        <tr class="tr03">
        	<td><%=sData[6]%></td>
            <td><a href="modMessage.jsp?id=<%=sData[0]%>"><%=sData[3]%></a></td>
            <td><%=sData[4]%></td>
            <td><a href="modMessage.jsp?id=<%=sData[0]%>">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="delReMessage.jsp?re_id=<%=sData[0] %>&w_id=<%=sData[1] %>">删除</a></td>
        </tr>
        
        
        <%
			}
		}
		%> 
        
    </table>
    
     <br>
    <form action="myMessage.jsp" method="get" target="_self" align="right">	
			共<font color=red><%=pages.getRowCount()%></font>条&nbsp;
			<%=pageSize%>条/页&nbsp;
			第<font color=red><%=showPage%></font>页/共<font color=red><%=pages.getPageCount()%></font>页 &nbsp;
			<a href="myMessage.jsp?showPage=1" target="_self">[首页]</a>&nbsp;			
			<%
				//判断"上一页"链接是否要显示
				if(showPage > 1)
				{				
			%>
				<a href="myMessage.jsp?showPage=<%=showPage-1%>" target="_self">[上一页]</a>&nbsp;
			<%
				}
				else
				{
			%>
					[上一页]&nbsp;
			<%
				}
				//判断"下一页"链接是否要显示
				if(showPage < pages.getPageCount())
				{				
			%>
					<a href="myMessage.jsp?showPage=<%=showPage+1%>" target="_self">[下一页]</a>&nbsp;
			<%
				}
				else
				{
			%>
					[下一页]&nbsp;
			<%
				}
			%> 

	 </form>
</body>
</html>


