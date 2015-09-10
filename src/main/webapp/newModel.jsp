<%--
  Created by IntelliJ IDEA.
  User: lei
  Date: 15-9-8
  Time: 上午12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
  <title>个人中心</title>
  <link  href="/resource/css/bootstrap.css" type="text/css" rel="stylesheet"/>
   <link href="/resource/js/bootstrap.js"  type="text/javascript" rel="stylesheet"/>

  <script src="/resource/js/jquery-2.1.1.js"></script>
<%--  <script src="/resource/js/bootstrap.js" type="text/javascript" ></script>--%>
  <script src="/resource/js/transition.js"></script>
  <script src="/resource/js/dropdown.js"></script>
  <script src="/resource/js/collapse.js"></script>
  <link href="/resource/css/newModel.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript">
    <!--
    function MM_reloadPage(init) {  //reloads the window if Nav4 resized
      if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
        document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
      else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
    }
    MM_reloadPage(true);
    //-->
  </script>
</head>

<body>

<div id="container">

  <div id="header">
    <div id="header0">
      <img src="/resource/image/logo4.png" height="100" width="200" />
    </div>
  </div>

  <div id="message">
    <div id="menu">
      <ul>
        <li class="celan"><a href="/userOrderGoods.jsp" class="href2">我的预订</a></li><p></p>
        <li class="celan"><a href="/userSendGoods.jsp" class="href2">我的发布</a></li><p></p>
        <li class="celan"><a href="/userFollowGoods.jsp" class="href2">我的关注</a></li><p></p>
        <li class="celan"><a href="/rent.jsp" class="href2">我要预订</a></li><p></p>
        <li class="celan"><a href="/send.jsp" class="href2">我要发布</a></li>
      </ul>
    </div>
    <div id="goodsplay">
    </div>
  </div>
</div>

<div id="Layer1">
  <div class = "component-left" style="float:left">
    <img src="<%=session.getAttribute("headImage")%>" alt="..." class="img-circle" style=" width:60px; height:60px;">
  </div>
  <!-- Split button -->
  <div class="btn-group" style="float:left; width:40px; height:60px; padding-top:25px; margin-left:5px;">

    <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style=" background-color:#0099CC; border-color:#00CC99;">
      <span class="caret"></span>
      <span class="sr-only">Toggle Dropdown</span>
    </button>
    <ul class="dropdown-menu" style="position:relative; top:0px; left:-125px;">
      <li><a href="/index.jsp">首页</a></li>
      <li><a href="/information.jsp">个人中心</a></li>
      <li><a href="/message.jsp">消息</a></li>
      <li><a href="/changePassword.jsp">修改密码</a></li>
      <li role="separator" class="divider"></li>
      <li><a href="#">退出</a></li>
    </ul>
  </div>
</div>
<div id="Layer2">
  <div id="search_box">
    <form method="post" action="#">
      <input type="text" id="s" value="" placeholder="酷租网" class="swap_value" />
      <input type="image" class="size" id="go" title="Search" src="/resource/image/search.jpg" alt="Search" align="middle" width="27" height="24" />
    </form>
  </div> </div>
</body>
<script type="text/javascript" >
  $(document).ready(function() {
    $('#go').click(function(event){
      event.preventDefault();
      window.location.href="/userSearchGoods.jsp?keyWord=" + encodeURI($('#s').val());

    })
  });
</script>
</html>
