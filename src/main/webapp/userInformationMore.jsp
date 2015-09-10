<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: lei
  Date: 15-9-9
  Time: 下午10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <script type="text/javascript" src="/resource/js/jquery-2.1.1.js" ></script>
  <style type="text/css">
    #con{
      height:412px;
      width:538px;
      float:left;
      position:absolute;
      left:260px;
      top:143px;
      z-index: 1;
    }
    span{
      color:red;
    }
  </style>
</head>
<body>
<%@ include file="/newModel.jsp" %>

<div id="con" style="width:538px; text-aligin:center">
  <br/>
  <div  id="title">
    个人信息
    <hr />
  </div>


  <div style="font-size:24px; color:#FFFFFF; text-align:center;">
    <div style="position:relative; left:20px; margin-top:10px; margin-bottom:20px;width:1000px;height:90px;font-size:40px; float:left;color:#99CCCC; text-align:center; font-family:"Microsoft YaHei UI";">
    真实姓名:
    <span id = "realName" class="red">杨雪</span>

</div>


<div style=" text-align:center; position:relative; left:44px; margin-bottom:20px;width:1000px;height:90px;font-size:40px; float:left;color:#99CCCC; font-family:"Microsoft YaHei UI";">
用户名:
<span class="red" id="username">婕妤</span>
</div>


<div style="text-align:center; position:relative; left:45px; margin-bottom:20px;width:1000px;height:90px;font-size:40px; float:left;color:#99CCCC; font-family:"Microsoft YaHei UI";">
手机号:
<span class="red" id="phone">13259431891</span>
</div>

<div style=" text-align:center; position:relative; left:81px; margin-bottom:20px;width:1000px;height:90px;font-size:40px; float:left;color:#99CCCC; font-family:"Microsoft YaHei UI";">
QQ号:
<span class="red" id="qq">1052971811</span>
</div>

<div style=" text-align:center; position:relative; left:69px; margin-bottom:20px;width:1000px;height:90px;font-size:40px; float:left;color:#99CCCC; font-family:"Microsoft YaHei UI";">
Email:
<span class="red" id="email">1052971811@qq.com</span>

</div>
</div>

</body>
<script type="text/javascript">
  function createUserInformation(user){
    $('#username').text(user.name);
    $('#email').text(user.email);
    $('#qq').text(user.qq);
    $('#phone').text(user.phone);
  }
  $(document).ready(function(){
    $.ajax({
      url:"/korent/getInformation1.action",
      type:"get",
      data:window.location.search.replace("?", ""),
      success:function(html){
        user = JSON.parse(html);
        createUserInformation(user.user);
      }
    })
  })
</script>
</html>
