<%--
  Created by IntelliJ IDEA.
  User: lei
  Date: 15-9-9
  Time: 下午10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
  <title>个人中心</title>
  <link  href="/resource/css/bootstrap.css" type="text/css" rel="stylesheet"/>
  <link href="/resource/js/bootstrap.js"  type="text/javascript" rel="stylesheet"/>
  <style type="text/css">
    <!--
    body{
      background-image:url(/resource/image/firstpage.jpg);
      background-repeat:no-repeat;
      background-size:100%;
      background-attachment:fixed;
    }
    div#container{width:1355px;}
    div#header{width:1355px; height:90px;}
    div#header0 {width:200px; height: 90px; float:left; font-size:30px;}
    div#header1 {background-color:#0066FF; width:150px; height: 65px; float:left; font-size:30px; padding-left:625px; padding-top:25px; text-align:center}
    div#header2 {background-color:#00CCFF; width:150px; height: 65px; float:left; font-size:30px; padding-left:20px; padding-right:20px;padding-top:25px; text-align:center}
    div#header3 {background-color:#00FFFF; width:150px; height: 65px; float:left; font-size:30px; padding-left:20px; padding-right:20px;padding-top:25px; text-align:center}
    div#username{width:1300px; text-align:right; color:#0033FF; font-size:18px; font-weight:bold; padding-top:5px; background-attachment:fixed}
    div#message{width:1355px; height:330px}
    div#menu {height:500px;width:160px; padding-top:50px; float:left}
    div#title{width:1000px;height:100px; font-size: 36px; float:left; text-align:center; color:#FFFFFF;}

    div#goodsplay{
      width: 1050px;
      height: 1000px;
      float:left;
      margin:70px;
      margin-top:30px;
      margin-right:0px;
      background-color:#000000;
      opacity:0.5;
    }

    div#headimg{width:538px; height:140px; position:relative; left:20px; }
    .red{
      color:#FFFFFF;
      font-size: 36px;
    }


    .uploading{
      color:#FFFFFF;
      font-size: 24px;
      font-weight:bold;
      background-color:#0066FF;
      width:150px;
      height:40px;
      text-decoration: none;
      border-top-style: outset;
      border-right-style: outset;
      border-bottom-style: outset;
      border-left-style: outset;
      border-top-color: #0099FF;
      border-right-color: #0099FF;
      border-bottom-color: #0000CC;
      border-left-color: #0099FF;
      font-family:"黑体";
    }

    input.uploading:link{
      color:#FFFFFF;
      font-size: 28px;
      font-weight:bold;
      background-color:#0066FF;
      width:150px;
      height:40px;
      text-decoration: none;
      border-top-style: outset;
      border-right-style: outset;
      border-bottom-style: outset;
      border-left-style: outset;
      border-top-color: #0099FF;
      border-right-color: #0099FF;
      border-bottom-color: #0000CC;
      border-left-color: #0099FF;
      font-family: "黑体";
    }

    input.uploading:visited{
      color:#FFFFFF;
      font-size: 24px;
      font-weight:bold;
      background-color:#0066FF;
      width:150px;
      height:40px;
      text-decoration: none;
      border-top-style: outset;
      border-right-style: outset;
      border-bottom-style: outset;
      border-left-style: outset;
      border-top-color: #0099FF;
      border-right-color: #0099FF;
      border-bottom-color: #0000CC;
      border-left-color: #0099FF;
      font-family: "黑体";
    }

    input.uploading:hover{
      color:#FFFFFF;
      font-size: 24px;
      font-weight:bold;
      background-color:#0000CC;
      width:150px;
      height:40px;
      text-decoration: none;
      border-top-style: outset;
      border-right-style: outset;
      border-bottom-style: outset;
      border-left-style: outset;
      border-top-color: #000099;
      border-right-color: #000099;
      border-bottom-color: #000099;
      border-left-color: #000099;
      font-family: "黑体";
    }

    input.uploading:active{
      color:#FFFFFF;
      font-size: 24px;
      font-weight:bold;
      background-color:#0000CC;
      width:150px;
      height:40px;
      text-decoration: none;
      border-top-style: inset;
      border-right-style: inset;
      border-bottom-style: inset;
      border-left-style: inset;
      border-top-color: #000099;
      border-right-color: #000099;
      border-bottom-color: #000099;
      border-left-color: #000099;
      font-family: "黑体";
    }

    .save{
      color:#FFFFFF;
      font-size: 24px;
      background-color:#00CCFF;
      width:200px;
      height:40px;
      font-weight:bold;
      border: medium outset #00FFFF;
      font-family: "黑体";
    }

    input.save:link{
      color:#FFFFFF;
      font-size: 24px;
      background-color:#00CCFF;
      width:200px;
      height:40px;
      font-weight:bold;
      border: medium outset #00FFFF;
      font-family: "黑体";
    }

    input.save:visited{
      color:#FFFFFF;
      font-size: 24px;
      background-color:#00CCFF;
      width:200px;
      height:40px;
      font-weight:bold;
      border: medium outset #00FFFF;
      font-family: "黑体";
    }

    input.save:hover{
      color:#FFFFFF;
      font-size: 24px;
      background-color:#0066FF;
      width:200px;
      height:40px;
      font-weight:bold;
      border: medium inset #0033FF;
      font-family: "黑体";
    }

    input.save:active{
      color:#FFFFFF;
      font-size: 24px;
      background-color:#0066FF;
      width:200px;
      height:40px;
      font-weight:bold;
      border: medium inset #0033FF;
      font-family: "黑体";
    }


    #content {
      #FFFFFF;
      height:412px;
      width:538px;
      float:left;
      position:absolute;

      left: 250px;
      top: 143px;
      z-index: 1;
    }
    div#Layer3{
      color:#FFFFFF;
      font-size:24px;
      font-weight:700;
    }

    ul {margin:0;}
    .celan {
      text-align:center;
      list-style:none;
      border-top-style: groove;
      border-right-style: groove;
      border-bottom-style: groove;
      border-left-style: groove;
      border-top-color: #CCCCCC;
      border-right-color: #CCCCCC;
      border-bottom-color: #CCCCCC;
      border-left-color: #CCCCCC;
    }
    .href1{
      color:#FFFFFF;
      font-family:"黑体";
      text-decoration: none;
      font-weight:600;
    }

    a.href2:link{
      color:#FFFFFF;
      font-family:"Microsoft YaHei UI";
      font-size:24px;
      font-weight:500;
      text-decoration: none;
    }

    a.href2:visited{
      color:#FFFFFF;
      font-family:"Microsoft YaHei UI";
      font-size:24px;
      font-weight:500;
      text-decoration: none;
      position:relative;
      left:20px;
    }

    a.href2:hover{
      color:#FFFFFF;
      font-family:"Microsoft YaHei UI";
      font-size:24px;
      font-weight:500;
      text-decoration: none;
      position:relative;
      left:20px;
    }

    a.href2:active{
      color:#FFFFFF;
      font-family:"Microsoft YaHei UI";
      font-size:24px;
      font-weight:500;
      text-decoration: none;
      position:relative;
      left:20px;
    }

    #Layer1 {
      position:absolute;
      left:1200px;
      top:14px;
      width:175px;
      height:60px;
      z-index:1;
    }

    form {
      margin: 0;
    }
    #search_box {
      width: 500px;
      height: 60px;
      border: 2px solid #0066CC;
    }
    #search_box #s {
      float: left;
      padding: 0;
      margin-top:5px;
      margin-left:5px;
      width: 425px;
      height:45px;
      background: none;
      font-size:24px;
      color:#CCCCCC;
      font-family:"黑体";
      border-top: 0 none;
      border-right: 0 none;
      border-bottom: 0 none;
      border-left: 0 none;
    }
    #search_box #go {
      float: right;
      margin: 3px 4px 0 0;
    }

    .size{width:50px; height:50px;}
    #Layer2 {
      position:absolute;
      left:511px;
      top:26px;
      width:258px;
      height:50px;
      z-index:1;
    }

    -->
  </style>
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
      <img src="resource/image/logo4.png" height="100" width="200" />
    </div>
  </div>

  <div id="message">
    <div id="menu">
      <ul>
        <li class="celan"><a href="我的预订.html" class="href2">我的预订</a></li><p></p>
        <li class="celan"><a href="" class="href2">我的订单</a></li><p></p>
        <li class="celan"><a href="" class="href2">我的发布</a></li><p></p>
        <li class="celan"><a href="" class="href2">我的收藏</a></li><p></p>
        <li class="celan"><a href="我要发布.html" class="href2">我要发布</a></li>
      </ul>
    </div><html>
<head>
    <title></title>
</head>
<body>

</body>
</html>

</div>
</div>
<div id="Layer1">
  <div class = "component-left" style="float:left">
    <img src="../Korent Webpage/resource/image/admin_background.jpg" alt="..." class="img-circle" style=" width:60px; height:60px;">
  </div>
  <!-- Split button -->
  <div class="btn-group" style="float:left; width:40px; height:60px; padding-top:25px; margin-left:5px;">

    <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style=" background-color:#0099CC; border-color:#00CC99;">
      <span class="caret"></span>
      <span class="sr-only">Toggle Dropdown</span>
    </button>
    <ul class="dropdown-menu" style="position:relative; top:0px; left:-125px;">
      <li><a href="#">首页</a></li>
      <li><a href="#">个人中心</a></li>
      <li><a href="#">消息</a></li>
      <li role="separator" class="divider"></li>
      <li><a href="#">退出</a></li>
    </ul>
  </div>
  <script src="../bootstrap-3.3.5-dist/js/jquery.min.js"></script>
  <script src="../bootstrap-3.3.5-dist/js/transition.js"></script>
  <script src="../bootstrap-3.3.5-dist/js/dropdown.js"></script>
  <script src="../bootstrap-3.3.5-dist/js/collapse.js"></script></div>

<div id="Layer2">
  <div id="search_box">
    <form method="post" action="#">
      <input type="text" id="s" value="金堆城小区" class="swap_value" />
      <input type="image" class="size" id="go" title="Search" src="resource/image/search.jpg" alt="Search" align="middle" width="27" height="24" />
    </form>
  </div> </div>
</body>
</html>
