<%--
  Created by IntelliJ IDEA.
  User: lei
  Date: 15-9-8
  Time: 上午11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<link  href="/resource/css/bootstrap.css" type="text/css" rel="stylesheet"/>--%>
<%--<link href="/resource/js/bootstrap.js"  type="text/javascript" rel="stylesheet"/>

<script src="/resource/js/jquery-2.1.1.js"></script>
&lt;%&ndash;  <script src="/resource/js/bootstrap.js" type="text/javascript" ></script>&ndash;%&gt;
<script src="/resource/js/transition.js"></script>
<script src="/resource/js/dropdown.js"></script>--%>
<%--<script src="/resource/js/collapse.js"></script>--%>
<link href="/resource/css/admin.css" rel="stylesheet" type="text/css" />
<html>
<head>
    <title></title>
  <style type="text/css">

    #Layer1 {
      position:absolute;
      left:1200px;
      top:14px;
      width:175px;
      height:60px;
      z-index:1;
    }

  </style>
</head>
<body>
<div id="container">

  <div id="header">
    <div id="header0">
      <img src="/resource/image/adminHead.jpg" height="100" width="200" />
    </div>
      <%--<div id="Layer1">
        <div class = "component-left" style="float:left">
          <img src="/resource/image/adminHead.jpg" alt="..." class="img-circle" style=" width:60px; height:60px;">
        </div>--%>
    <div id="username"><span><%=session.getAttribute("adminName")%></span>
      <span><a href="/admin/logout.action">退出</a></span>
    </div>
  </div>

  <%--  <div id="Layer1">
      <div class = "component-left" style="float:left">
        <img src="/resource/image/adminHead.jpg" alt="..." class="img-circle" style=" width:60px; height:60px;">
      </div>
      <!-- Split button -->
      <div class="btn-group" style="float:left; width:40px; height:60px; padding-top:25px; margin-left:5px;">

        <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style=" background-color:#0099CC; border-color:#00CC99;">
          <span class="caret"></span>
          <span class="sr-only">Toggle Dropdown</span>
        </button>
        <ul class="dropdown-menu" style="position:relative; top:0px; left:-125px;height:170px">
          <li><a href="/adminOperate.jsp">管理用户</a></li>
          <li><a href="/adminRent.jsp">管理租品</a></li>
          <li><a href="/message.jsp"></a>消息</li>
          <li role="separator" class="divider"></li>
          <li><a href="/korent/logout.action">退出</a></li>
        </ul>
      </div>
    </div>--%>
  <div id="message">
    <div id="menu">
      <ul>
        <li><a href="/adminOperate.jsp?pageNo=1&pageSize=10" class="href2">管理用户</a></li><p></p>
        <li><a href="/adminRent.jsp?pageNo=1&pageSize=6" class="href2">管理租品</a></li>
      </ul>
    </div>

    <div id="goodsplay">
    </div>

  </div>
</div>

</body>
</html>
