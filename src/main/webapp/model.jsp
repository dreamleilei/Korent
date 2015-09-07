<%--
  Created by IntelliJ IDEA.
  User: lei
  Date: 15-9-5
  Time: 上午9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html; " />
  <title>我的预订</title>

  <link href="/resource/css/model.css" type="text/css" rel="stylesheet" />
</head>

<body>
<div id="container">

  <div id="header">
    <div id="header0">
      <img src="/resource/image/logo4.png" height="100" width="200" />
    </div>

    <div id="header1">
      <a href="" class="href1">首页</a>
    </div>

    <div id="header2">
      <a href="/information.jsp" class="href1">个人中心</a>
    </div>

    <div id="header3">
      <a href="" class="href1">消息</a>
    </div>
  </div>

  <div id="myUsername"><span><%=session.getAttribute("name")%></span>
    <a href="/korent/logout.action"><span>退出</span></a>
  </div>

  <div id="message">
    <div id="menu">
      <ul>
        <li><a href="我的预订.html" class="href2">我的预订</a></li>
        <p></p>
        <li><a href="#" class="href2">我的订单</a></li><p></p>
        <li><a href="#" class="href2">我的发布</a></li><p></p>
        <li><a href="#" class="href2">我的收藏</a></li><p></p>
        <li><a href="/send.jsp" class="href2">我要发布</a></li>
      </ul>
    </div>

    <div id="goodsplay">
    </div>

  </div>
</div>

<div id="chara">
</div>

</body>
</html>