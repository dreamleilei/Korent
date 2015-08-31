<%--
  Created by IntelliJ IDEA.
  User: lei
  Date: 15-8-31
  Time: 下午7:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
  <title>用户登录</title>
  <link href="./resource/css/login.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="./resource/js/jquery-1.6.1.min.js" ></script>

</head>
<body>
<s:form method="post" action="login" namespace="/korent" >
  <div id="Layer1">
    <input id="username" name="username" type="text" value="" placeholder="用户名" maxlength="10" class="login_mima" />
  </div>
  <div id="Layer2">
    <input name="password" id = "password" type="password" value="" placeholder="密码" class="login_mima" />
  </div>
  <div id="Layer3" align="center">
    <input type="submit" class="login_button" id="submit" value ="登录" style="width:195px; height:34px;" />
    <span id="submit_message" class="message"><br /> 请确保用户名和密码不为空</span>

  </div>
  <div  align="center" id="Layer4">W E L C O M E</div>
  <div  align="center" id="Layer5"><a href="userLogin.html" class="yonghu">用户登录</a></div>
  <div  align="center" id="Layer6"><a href="adminLogin.html" class="guanliyuan">管理员登录</a></div>
</s:form>>
</body>
<script type="text/javascript">
  <!--
  /*function MM_reloadPage(init) {  //reloads the window if Nav4 resized
    if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
      document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
    else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
  }
  MM_reloadPage(true);*/
  //-->
  $(document).ready(function(event){
    $('.message').hide();
    $('#submit').click(function(event){
              var username = $('#username').val();
              var password = $('#password').val();
              if(username.length < 1 || password.length < 1){
                $('#submit_message').show().delay(2000).hide(0);
                event.preventDefault();
              }
            }
    )
  })
</script>
</html>

