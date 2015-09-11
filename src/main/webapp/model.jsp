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
<%--  <script type="text/javascript" src="/resource/js/jquery-2.1.1.js"></script>--%>
</head>

<body>
<div id="container">

  <div id="header">
    <div id="header0">
      <a href="/index.jsp"><img src="/resource/image/logo4.png" height="100" width="200" /></a>
    </div>
    </div>


  <div id="message">
    <div id="menu">
      <ul>
        <li><a href="/userOrderGoods.jsp" class="href2">我的预订</a></li>
        <p></p>
        <li><a href="/userSendGoods.jsp" class="href2">我的发布</a></li><p></p>
        <li><a href="/rent.jsp" class="href2">我要预订</a></li><p></p>
        <li><a href="/userFollowGoods.jsp" class="href2">我的关注</a></li><p></p>
        <li><a href="/send.jsp" class="href2">我要发布</a></li><p></p>
        <li ><a id ="noReadMessage" href="/message.jsp" class="href2">未读消息</a></li><p></p>
        <li ><a href="/readMessage.jsp" class="href2">已读消息</a></li></li>

      </ul>
    </div>

    <div id="goodsplay">
    </div>

  </div>
</div>

<div id="chara">
</div>
<script type="text/javascript">
  /*获取10秒是是否有信息*/
  function getLetter (data){
    $.ajax({
      url:"/note/haveUnReadNote.action",
      type:"post",
      data:"uid=" + encodeURIComponent(data)  + "&time=10",
      success:function(html) {
        if (html == "yes") {
          $('#noReadMessage').css("color", "red");
        }
      } ,
      error:function(){
        alert('网络连接失败');
      }
    })
  }

  $(document).ready(function(){
    var temp = "<%=session.getAttribute("user")%>";
    if( temp == "null" || temp == "" || temp == undefined) {
    } else {
      $('#Layer1').show();
      var timer =  setInterval(function() {
        getLetter(temp);
      }, 5000);

      document.addEventListener("visibilitychange", function () {
        if (document.hidden) {
          clearInterval(timer);

        } else  {
          timer  =  setInterval(function() {
            getLetter(temp);
          }, 5000);

        }
      }, false);
    }
  });

</script>

</body>
</html>