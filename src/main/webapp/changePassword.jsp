<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
  <title>修改密码</title>
  <script type="text/javascript " src="/resource/js/jquery-2.1.1.js" > </script>
 <link href="/resource/js/bootstrap.js"  type="text/javascript" rel="stylesheet"/>
  <link href="/resource/css/jNotify.jquery.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="/resource/js/jNotify.jquery.js" ></script>
  <script type="text/javascript" src="/resource/js/operateTip.js" > </script>
  <style type="text/css">
    .red{
      color:#FF0000
    }
    .queren{
      color:#000000;
      font-size: 24px;
      background-color:#0099FF
    }

    .error {
      color:red;
      padding-left:10px;
    }
    .message{
      color:red;
      padding-left:10px;
    }
    .correct{

      border-color : green;
    }
    .wrong{
      border-color:red;
    }
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
    div#message{width:1355px; height:550px}
    div#menu {height:500px;width:160px; padding-top:50px; float:left}
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
      margin-left:10%;
      left: 380px;
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
    .test{
      color:#FFFFFF;
      font-size: 24px;
      background-color:#00CCFF;
      width:100px;
      height:40px;
      font-weight:bold;
      border: medium outset #00FFFF;

      font-family: "黑体";
    }

    input.test:link{
      color:#FFFFFF;
      font-size: 24px;
      background-color:#00CCFF;
      width:100px;
      height:40px;
      font-weight:bold;
      border: medium outset #00FFFF;
      font-family: "黑体";
    }

    input.test:visited{
      color:#FFFFFF;
      font-size: 24px;
      background-color:#00CCFF;
      width:100px;
      height:40px;
      font-weight:bold;
      border: medium outset #00FFFF;
      font-family: "黑体";
    }

    input.test:hover{
      color:#FFFFFF;
      font-size: 24px;
      background-color:#0066FF;
      width:100px;
      height:40px;
      font-weight:bold;
      border: medium inset #0033FF;
      font-family: "黑体";
    }


    -->
  </style>
<body>
<%@ include   file="/newModel.jsp"%>
<%@ include file="checkup.jsp"%>
<div id="content">
  <br/>

  <form style="font-size:24px; "><br/><br/><br/>


    <div id="oldPasswordDiv" style="position:relative; left:45px; margin-bottom:20px; margin-right:20px; width:800px; color:white">
      &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;原密码:
      <input type="password" name="password" id="password" style="color:black"/>
      &nbsp; &nbsp; <input id="validate"name="submit" type="button"  class="test" onclick="" value="验证"/>
      <br/><span class="error" id="passwordMessage" hidden>请输入正确的密码</span>
    </div>


    <div id="passwordDiv" hidden style="position:relative; left:81px; margin-bottom:20px; margin-right:30px; color:white">
      新密码:
      <input type="password" name="passwordAgain" id="passwordAgain"  style="color:black"/>
      <span id = password_error class="error" hidden ><br/>密码格式不正确,长度为6-18位,且不含空格</span>

    </div>

    <div id="passwordAgainDiv" hidden style="position:relative; left:21px; margin-bottom:20px; margin-right:20px; color:white">
      &nbsp;&nbsp;再次输入密码:
      <input type="password" name="passwordModification" id="passwordModification"  style="color:black" />
       <span id="passwordAgain_error" hidden class="error">
            <br />&nbsp; &nbsp; &nbsp;两次密码不一致</span><br/><br/>
    </div>


    <div style="position:relative; left:150px; margin-top:80px">
      <input id = "save" name="submit" type="button" hidden class="save" onclick="" value="保存"/>
    </div>

  </form>
</div>
</body>
<script type="text/javascript">

  var passwordValidate = function() {
    var password = $('#passwordAgain').val();
    var passwordPattern = /^[^ ]{4,16}$/g;
    if(password.length < 6 || password.length >18){
      $('#password_error').show();
      $(this).addClass('wrong');
      $(this).removeClass('correct');

    } else {
      $('#password_error').hide();
      $(this).addClass('correct');
    }
    if(!passwordPattern.test(password)){
      $('#password_error').show();
      $(this).addClass('wrong');
      $(this).removeClass('correct');

    } else {
      $('#password_error').hide();
      $(this).addClass('correct');
      $(this).removeClass('wrong');
    }
  };

  var passwordAgainValidate = function() {
    var password  = $('#passwordAgain').val();
    var passwordAgain = $('#passwordModification').val();
    if(password != passwordAgain) {
      $('#passwordAgain_error').show();
      $(this).addClass('wrong');
      $(this).removeClass('correct');
      $('#save').hide();
    } else {
      $('#passwordAgain_error').hide();
      $(this).addClass('correct');
      $(this).removeClass('wrong');
      $('#save').show();
    }
  };

  $(document).ready(function(){

    $('#passwordAgain').keyup(passwordValidate);
    $('#passwordModification').keyup(passwordAgainValidate);

    $('#validate').click(function(event){
      event.preventDefault();
      $.ajax({
        url:"/korent/validatePassword.action",
        type:"get",
        data:"password=" + $('#password').val(),
        success:function(html){
          if(html == "yes"){
            $('#passwordDiv').show();
            $('#passwordAgainDiv').show();
            $('#oldPasswordDiv').hide();
          }else{
            $('#passwordMessage').show().delay(3000).hide(0);

          }
        },
        error:function(html){
          alert('网络连接失败');

        }
      })
    });
    $('#save').click(function(event){
      $.ajax({
        url:"/korent/changePasasword.action",
        type:"post",
        data:"passwordAgain=" + encodeURIComponent($('#passwordModification').val()),
        success:function(html){
          operateSuccessTip();
          $(this).delay(3000).queue(function(){window.location.href="/changePassword.jsp"});
        }
      })
    })

  });
</script>
</html>
