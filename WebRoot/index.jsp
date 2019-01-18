<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.lsp.javabean.Writer"%>
<%@ page import="com.lsp.dao.WriterDaoImp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>留言板</title>
<link rel="stylesheet" href="css/index.css"/>
</head>
<script type="text/javascript">
	//检验留言字符数
	window.onload=function(){
		document.getElementById("content").onblur=function(){
		
			if(document.getElementById("content").value.length < 10)
			
					alert("请输入不少于10个字符的留言！");
		}					
	}
</script>
<body>
<div class="content">
	<%
		Calendar date=Calendar.getInstance();
		int year=date.get(Calendar.YEAR);
		int month=date.get(Calendar.MONTH)+1;
		int day=date.get(Calendar.DATE);
	 %>
	<div class="time">时间：<%=year %>-<%=month %>-<%=day %></div>
	<div class="message">
    	<form  method="post" action="MessageServlet" >
			<table>
		
                <tr>
                    <td align="left">留言人：</td>
                    <td><input type="text" id="name" name="name" required></td>
                </tr>
			
                <tr>
                    <td align="left">联系邮箱：</td>
                    <td><input type="email" id="email" name="email" ></td>
                </tr>
			
                <tr>
                    <td align="left">留言主题：</td>
                    <td><input type="text" id="theme" name="theme" required></td>
                </tr>
			
                <tr>
                    <td align="left">留言内容：</td>
                    <td><textarea id="content" rows="17" cols="70" name="content" required></textarea></td>
                </tr>
			
                <tr>
                    <td><input type="hidden" id="time" name="time" value="<%=year %>-<%=month %>-<%=day %>"></td>
                    <td><input type="submit" value="提交" name="submit">
                        <input type="reset" value="重置" name="reset"></td>
                </tr>
                
              <tr>
              	<td><input type="hidden" id="answer" name="answer" value="否"></td>
              </tr>

			</table>			
		</form>
    </div>    <!--message end-->
    
    <div class="list">
    	<div class="up">
            
             <div  width="80px" ><h3>留言列表</h3></div>
              <form action="findMessage.jsp" method="get" target="_self">
               <div class="find" align="right" width="200px" style="margin-right:25px;"><a href="moreMessage.jsp">more</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="findtext" name="findtext" placeholder="输入与留言内容的字词">
               <input type="submit" value="搜索" name="submitfind"></div>  
              </form>
         <%
         	 WriterDaoImp writerImp = new WriterDaoImp();
	   		 List<Writer> list=writerImp.findMessage();
	   		 for (int i = 0; i < list.size(); i++) {
				Writer writer = list.get(i);
          %>    
             <div class="oneLine">
                <div class="left" ><a href="frontMessage.jsp?id=<%=writer.getId()%>"><%=writer.getTheme() %></a></div>
                <div class="right"><img src="image/new.png"></div>
             </div> <!--oneLine end-->
             
          <%
			}
		%>   

          </div><!--up end-->
          
          <div class="down">
          	<h4>友情链接：</h4>
          	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.gdpa.edu.cn/" target="_blank">广东石油化工学院</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="login.jsp" target="_blank">后台管理</a>
          </div>
    </div> <!--list end-->
      
</div>  <!--content end-->

</body>
</html>

