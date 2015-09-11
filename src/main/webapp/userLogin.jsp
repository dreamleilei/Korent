<%--
  Created by IntelliJ IDEA.
  User: lei
  Date: 15-8-31
  Time: 下午7:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";



%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
  System.out.println(request.getRequestURI());
  System.out.println(request.getSession().getAttribute("url"));
%>
<html>
<head>
  <base href="<%=basePath%>">
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
  <title>用户登录</title>
  <link href="/resource/css/login.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="/resource/js/jquery-1.6.1.min.js" ></script>

</head>
<body>
<s:form method="post" action="login" namespace="/korent" >
  <div id="Layer1">
    <input id="username" name="username" type="text" value="" placeholder="用户名" maxlength="10" class="login_mima" />
  </div>
  <div id="Layer2">
    <input name="password" id = "password" type="password" value="" placeholder="密码" class="login_mima" />
  </div>
  <div id="checkCode">
  <input type="text" id="check" name="check"  class="login_mima" placeholder="验证码" maxlength="4"/>
  <img border=0 src="/util/createCheckCode.action" id="safecode"><a href="javascript:changeCode();">不清晰，换一张</a></td>
    <span id="show"></span></div>
  <div id="Layer3" align="center">
    <input type="submit" class="login_button" id="submit" value ="登录" style="width:195px; height:34px;" />
    <span id="submit_message" class="message"><br /> 请确保用户名和密码不为空</span>
  </div>
  <div id="unregister" style="position:absolute">
    <p>还未注册? &nbsp;<a href="/register.jsp" style="text-decoration:none">立即注册</a></p>
  </div>
  <div  align="center" id="Layer4">W E L C O M E</div>
  <div  align="center" id="Layer5"><a href="/userLogin.jsp" class="yonghu">用户登录</a></div>
  <div  align="center" id="Layer6"><a href="/adminLogin.jsp" class="guanliyuan">管理员登录</a></div>
  <a href="/index.jsp"><div id="Layer7"></div></a>
</s:form>
</body>
<script type="text/javascript">
  <!--
  function MM_reloadPage(init) {  //reloads the window if Nav4 resized
    if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
      document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
    else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
  }
  MM_reloadPage(true);
  //-->
  $(document).ready(function(event){
    $('.message').hide();
    $('#submit').prop('disabled', true).click(function(event){
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

<script type="text/javascript">
  var code1 = "";
  $(document).ready(
          function (){
            $("#check").keyup(
                    function(){
                      $.ajax({
                        type: "POST",
                        url: "/util/checkCheckCode.action",
                        data: "code="+$("#check").val(),

                        success: function(msg){
                          if(msg==1)
                          {
                            code1="ok";
                            $("#show").css({"color":"#666666"});
                            $("#show").html("<br/>验证码正确");
                            $('#submit').prop('disabled', false);

                          }

                          else if(msg==0)
                          {
                            code1="";
                            $("#show").css({"color":"#F00"});
                            $("#show").html("<br/>验证码错误");
                            $('#submit').prop('disabled', true);
                          }

                        },
                        error:function(msg){
                          $("#show").css({"color":"#F00"});
                          $("#show").html("<br/>网络连接超时,请检查网络");
                          $('#submit').prop('disabled', true);

                        }
                      });
                    }
            );


          }

  );


</script>
<script type="text/javascript">
  function fo()
  {
    $("#username").focus();
  }

  function changeCode()
  {
    $("#safecode").attr("src","/util/createCheckCode.action?x="+Math.random());
  }
  function log()
  {
    if(code1=="ok")
      document.getElementById("login").submit();
  }

</script>
</html>

