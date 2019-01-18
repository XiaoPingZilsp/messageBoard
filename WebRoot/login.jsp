<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
	function reloadImage(t){t.src="./ImageServlet?flag="+Math.random();}
</script>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>后台登录</title>
	<style type="text/css">
		.form{
			width:600px;
		    height: 200px;
		    border: 1px solid green;
		      /*设置div居中*/
		    margin:30px auto;
			background-color:#FDFAF6;
			margin-top:150px;
		    
		}
		td{
		text-align: right;
		}
	</style>
	
  </head>
  
  <body>
  <div class="form">
    <form action="CheckServlet" mothed = "post">
        <table align="center">
       	 <caption><h2>欢迎登录</h2></caption>
            <tr>
                <td>用户名：</td>
                <td><input type="text" id="username" name="username"></td>
            </tr>
            <tr>
                <td>口令：</td>
                <td><input type="password" id="password" name="password"></td>
            </tr>
            
            <tr>
                <td>验证码：</td>
                <td><input type="text" id="checkcode" name="checkcode"></td>
               <td> <img src="./ImageServlet" align="middle" alt="看不清，请点击这里！"+src onclick="reloadImage(this)"></td>
            </tr>
            
            <tr>
                <td colspan="2"><input type = "submit" value = "登录"/>
                                <input type = "reset" value = "重置"/>
                </td>
            </tr>
        </table>
    </form>
   </div>
  </body>
</html>


