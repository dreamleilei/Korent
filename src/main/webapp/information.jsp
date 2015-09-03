<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>个人中心</title>   alert(html);
          alert('yes');
  <link href="bootstrap.css" rel="text/css" />
  <link href="./resource/css/information.css" rel="stylesheet" />
  <script type="text/javascript" src="./resource/js/jquery-1.6.1.min.js"> </script>
</head>

<body>
<s:action name="getInformation" namespace="/korent" />

<div id="container">

  <div id="header">
    <div id="header0">
      <img src="./resource/image/logo4.png" height="100" width="200" /></div>

    <div id="header1">

      <a href="" class="href1">首页</a>
    </div>

    <div id="header2">
      <a href="" class="href1">个人中心</a>
    </div>

    <div id="header3">
      <a href="" class="href1">消息</a>
    </div>
  </div>

  <div id="username">沉淀着梦</div>

  <div id="message">
    <div id="menu">
      <ul>
        <li><a href="我的预订.html" class="href2">我的预订</a></li>
        <p></p>
        <li><a href="" class="href2">我的订单</a></li><p></p>
        <li><a href="" class="href2">我的发布</a></li><p></p>
        <li><a href="" class="href2">我的收藏</a></li><p></p>
        <li><a href="我要发布.html" class="href2">我要发布</a></li>
      </ul>
    </div>
    <div id="goodsplay">
    </div>
  </div>

  <div id="content">
    <br/>

    <form id="form" style="font-size:24px; color:#FFFFFF ">
      <div style="position:relative; left:20px; margin-top:10px; margin-bottom:20px;">
        *真实姓名:
        <input type="text" name="realName" id="realName"/>
      </div>

      <div style="position:relative; left:44px; margin-bottom:20px;">
        *用户名:
        <input type="text" name="username" disabled="disabled"/>
      </div>

      <div style="position:relative; left:150px; margin-bottom:20px;">
        <input type="radio" name="sex" value="男" >男
        <input type="radio" name="sex" value="女" />女
      </div>

      <div style="position:relative; left:21px; margin-bottom:20px;">
        *出生日期:
        <input type="date" name="birth" id="birth"  />
      </div>

      <div style="position:relative; left:45px; margin-bottom:20px;">
        *手机号:
        <input type="tel" name="phone"  id="phone" />
      </div>

      <div style="position:relative; left:81px; margin-bottom:20px;">
        QQ号:
        <input type="text" name="qq"  id="qq" />
      </div>

      <div style="position:relative; left:69px; margin-bottom:20px;">
        Email:
        <input type="email" name="email" id="Email"  />
      </div>

      <div style="position:relative; left:21px; margin-bottom:20px;">
        *证件号码:
        <input type="text" name="idNumber" id="idNumber"  />
      </div>

      <div style="position:relative; left:57px; margin-bottom:20px;">
        居住地:
        <input type="text" name="address" id="address"  />
      </div>
      <input type="submit" id="submit" />
    </form>

  </div>
  </div>
<%--<s:action name="getInformation" namespace="korent" var="userInfo"/>
<s:property value="#request.userInfo" />
--%>

<s:debug />
</body>
<script type="text/javascript" >
  $(document).ready(function() {
    var information = <s:property value="#request.userInfo" escape="false" escapeHtml="false"/>;
    $('input[name="username"]').val(information.name);
    $('input[name="email"]').val(information.email);
    $('input[name="phone"]').val(information.phone);
    $('input[name="qq"]').val(information.qq);

    var otherInformation = <s:property value="#request.otherInfo" escape="false" escapeHtml="false"/>;
    $('input[name="realName"]').val(otherInformation.realName);
    $('input[name="idNumber"]').val(otherInformation.idNumber);
    $('input[name="address"]').val(otherInformation.address);
    $('input[name="sex" ][value=otherInformation.sex]').attr("checked", true);
    $('input[name="birth"]').val(otherInformation.birth);

    $('#submit').click(function(event){
      event.preventDefault();
      $.ajax({
        url:"/korent/changeInformation.action",
        type:"post",
        data:$('#form').serialize(),
        success:function(html){
          alert('信息修改成功');
        }


      })
    })
  });

</script>
</html>
