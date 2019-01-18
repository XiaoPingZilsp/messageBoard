<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
  <head>
    <title>友情提示</title>
    <script type="text/javascript">
    function warn(){
       alert("您已经登录在线，不能重复登录！");
    }
    </script>
  </head>
  
   <body onload="warn();">   
       您已经登陆在线,不能重复登陆! <br>   
      <a href="login.jsp">返回登录页面</a>   
   </body>
</html>