<%--
  Created by IntelliJ IDEA.
  User: lei
  Date: 15-6-14
  Time: 下午5:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
  <style type="text/css">
    body{
      background-color:blue;
      background-repeat:no-repeat;
      background-size:100%;
      background-attachment:fixed;
    }
  </style>
</head>
<body onload = "redirect()">
<p>你已经成功注册账号<span style="color:red; font-size:24px;">5</span>秒钟后进入登录界面</p>
<p>若刷新失败,点击<a href="/userLogin.jsp">此处</a>进入登录界面</p>
<script language="javascript">
  var time = document.getElementsByTagName("span");
  time[0].innerText = 5;
  function go(){
    time[0].innerText -= 1;
    if(time[0].innerText == 0){
      location.assign("/userLogin.jsp")
    }

  }
  function redirect() {
    setInterval(go, 1000);
    // location.assign("/index.jsp");
  }
</script>
</body>
</html>