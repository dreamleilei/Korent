<%--
  Created by IntelliJ IDEA.
  User: lei
  Date: 15-9-8
  Time: 上午11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="/resource/css/admin.css" rel="stylesheet" type="text/css" />
<html>
<head>
    <title></title>
</head>
<body>
<div id="container">

  <div id="header">
    <div id="header0">
      <img src="/resource/image/logo5.png" height="100" width="200" />
    </div>
    <div id="username"><span><%=session.getAttribute("adminName")%></span>
      <span>退出</span>
    </div>
  </div>

  <div id="message">
    <div id="menu">
      <ul>
        <li><a href="/adminOperate.jsp" class="href2">管理用户</a></li><p></p>
        <li><a href="/adminRent.jsp" class="href2">管理租品</a></li>
      </ul>
    </div>

    <div id="goodsplay">
    </div>

  </div>
</div>

</body>
</html>
