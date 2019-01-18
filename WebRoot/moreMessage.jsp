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
<title>更多留言</title>
<link rel="stylesheet" href="css/newMessage.css"/>
</head>

<body>
<div style="width:1024px;height:550px;margin:0px auto;">
<h2>更多留言</h2><span><a href="index.jsp">返回留言墙</a></span>
    <hr/> 
   
    <table class="table" >
    	
    	<tr class="tr01">
        	<th>留言人</th>
            <th>留言主题</th>
            <th>时间</th>
        </tr>
        
         <%!	
	//每页显示的记录数
	int pageSize = 8;
	String sqlStr="";
	//当前页
	int showPage=1;
	%> 
     <%
       			
	sqlStr="select w_id,w_name,w_email,w_theme,w_message,w_time from tb_writer order by w_id DESC";
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
        	<td><%=sData[1]%></td>
            <td><a href="frontMessage.jsp?id=<%=sData[0]%>"><%=sData[3] %></a></td>
            <td><%=sData[5] %></td>
        </tr>
        <%}else{ %>
        <tr class="tr03">
        	<td><%=sData[1] %></td>
            <td><a href="frontMessage.jsp?id=<%=sData[0]%>"><%=sData[3] %></a></td>
            <td><%=sData[5] %></td>
        </tr>
        
         <%
			}
		}
		%> 
             
    </table>
    
    
    <form action="moreMessage.jsp" method="get" target="_self">	
			共<font color=red><%=pages.getRowCount()%></font>条&nbsp;
			<%=pageSize%>条/页&nbsp;
			第<font color=red><%=showPage%></font>页/共<font color=red><%=pages.getPageCount()%></font>页 &nbsp;
			<a href="moreMessage.jsp?showPage=1" target="_self">[首页]</a>&nbsp;			
			<%
				//判断"上一页"链接是否要显示
				if(showPage > 1)
				{				
			%>
				<a href="moreMessage.jsp?showPage=<%=showPage-1%>" target="_self">[上一页]</a>&nbsp;
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
					<a href="moreMessage.jsp?showPage=<%=showPage+1%>" target="_self">[下一页]</a>&nbsp;
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
    </div>
</body>
</html>

