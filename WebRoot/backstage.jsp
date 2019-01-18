<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>留言板后台管理</title>
<link rel="stylesheet" href="css/backstage.css"/>
</head>

<script>
 	function tab(temp){
  		var tabs=["tab1","tab2","tab3","tab4"];
  		var tab=["tab01","tab02","tab03","tab04"];
		
  		for(var i=0;i<4;i++){
   			if(tabs[i]==temp){
    			document.getElementById(tabs[i]).style.display="block";
				document.getElementById(tab[i]).style.background="white";
  			}else{
    			document.getElementById(tabs[i]).style.display="none";
				document.getElementById(tab[i]).style.background="#F9B26A";
  			}
  		}
 	}
	
	
 </script>

<body>

<div class="content">
	<div class="catalogue">
        <div class="left">
            <ul class="list">
                <div id="tab01" style="background-color:#FFF"><li onclick="tab('tab1')">首页</div>
                <div id="tab02"><li onclick="tab('tab2')">新留言</div>
                <div id="tab03"><li onclick="tab('tab3')">我的留言</div>
                <div id="tab04"><li onclick="tab('tab4')">留言箱</div>
                 <div id="tab05"><li onclick="location.href='LogoutServlet'">退出</div>
                
            </ul>
        </div>
        
        <div class="center">
               <div class="tabshow" id="tab1"> <iframe src="firstContent.jsp" width="146%" height="595px" frameborder="0">
            您的浏览器不支持iframe，请升级 </iframe></div>  
                
                <div class="tabhide" id="tab2"><iframe src="newMessage.jsp?temp=0" width="146%" height="595px" frameborder="0">
            您的浏览器不支持iframe，请升级 </iframe></div>  
                
                <div class="tabhide" id="tab3"><iframe src="myMessage.jsp" width="146%" height="595px" frameborder="0">
            您的浏览器不支持iframe，请升级 </iframe></div>  
                
                <div class="tabhide" id="tab4"><iframe src="allMessage.jsp" width="146%" height="595px" frameborder="0">
            您的浏览器不支持iframe，请升级 </iframe></div>  
                
        </div>  <!--center end-->
        
    </div>  <!--catalogue end-->
</div><!--content end-->
</body>
</html>

