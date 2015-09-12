<%--
  Created by IntelliJ IDEA.
  User: lei
  Date: 15-9-7
  Time: 上午10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>租品详情</title>
  <link href="/resource/css/style.css" rel="stylesheet" type="text/css"/>
  <script src="/resource/js/jquery-2.1.1.js"></script>

  <script src="/resource/js/jquey-bigic.js"></script>
<%--  <link href="/resource/css/rentInformation.css" type="text/css" rel="stylesheet" />--%>
  <link href="/resource/css/jNotify.jquery.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="/resource/js/jNotify.jquery.js" ></script>
  <script type="text/javascript" src="/resource/js/operateTip.js" > </script>


  <style type="text/css" >

    body{

      background-image: url(/resource/image/firstpage.jpg);
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
    div#username{width:1300px; text-align:right; color:#0033FF; font-size:18px; font-weight:bold; padding-top:5px}
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
    div#title{width:900px;height:100px; font-size:30px; float:left; text-align:center; color:#FFFFFF;}
    div#price{width:900px;height:90px;font-size:40px; float:left;color:#99CCCC; font-family:"Microsoft YaHei UI";margin-left:80px;}
    div#address{width:900px;height:90px;font-size:40px; float:left;color:#99CCCC; font-family:"Microsoft YaHei UI";}
    div#city{width:900px;height:90px;font-size:40px; float:left;color:#99CCCC; font-family:"Microsoft YaHei UI"; margin-top:50px; margin-left:100px;}
    div#detail{width:900px;height:90px;font-size:40px; float:left;color:#99CCCC; font-family:"Microsoft YaHei UI";margin-left:80px;}
    div#describe{width:900px;height:90px;font-size:40px; float:left;color:#99CCCC; font-family:"Microsoft YaHei UI";margin-left:80px;}
    div#button1{width:900px;height:100px;font-size:50px; float:left;color:#FFFFFF;margin-top:90px;margin-right:100px; margin-left:100px;}
    div#button1 button:disabled{color:grey}
    div#button2{width:900px;height:100px;font-size:50px; float:left;color:#FFFFFF;margin-top:90px; margin-left:900px;}
    div#img1{width:300px; height:200px; float:left;margin:60px; margin-top:0px; margin-left:22px; margin-bottom:0px;}
    div#img2{width:300px; height:200px; float:left;margin:60px; margin-top:0px; margin-left:22px; margin-bottom:0px;}
    div#img3{width:300px; height:200px; float:left;margin:60px; margin-top:0px; margin-left:22px; margin-bottom:0px;}
    div#text1{ color:#FFFFFF;font-size: 24px;}
    .fix{
      color:#000000;
      font-size: 24px;
      background-color:#3399FF;
    }
    .red{
      color:#FFFFFF;
      font-size: 36px;
      width:900px;
    }
    div#case1, div#case2, div#case3{
      width:300px;
      height:200px;
      float:left;
      margin-right:30px;
      border: none;
      margin-bottom:60px;
    }
    input.fix:link{
      color:#000000;
      font-size: 24px;
      background-color:#3399FF;
    }
    input.fix:visited{
      color:#000000;
      font-size: 24px;
      background-color:#3399FF;
    }
    input.fix:hover{
      color:#000000;
      font-size: 24px;
      background-color:#3300CC;
    }
    input.fix:active{
      color:#000000;
      font-size: 24px;
      background-color:#3300CC;
    }
    input.fix:disabled{
      color:#000000;
      font-size: 24px;
      background-color:#3399FF;

    }
    ul {margin:0;}
    /*li {
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
    }*/
    .href1{
      color:#FFFFFF;
      font-family:"黑体";
      text-decoration: none;
      font-weight:600;
    }

    a.href2:link{
      color:#FFFFFF;
      font-family:"Microsoft YaHei";
      font-size:24px;
      font-weight:500;
      text-decoration: none;
    }

    a.href2:visited{
      color:#FFFFFF;
      font-family:"Microsoft YaHei";
      font-size:24px;
      font-weight:500;
      text-decoration: none;
      position:relative;
      left:20px;
    }

    a.href2:hover{
      color:#FFFFFF;
      font-family:"Microsoft YaHei";
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
    div#mess{
      width: 1017px;
      height: 943px;
      float:left;
      margin:70px;
      margin-top:30px;
      margin-right:0px;
      position:absolute;
      left:191px;
      top: 145px;
      z-index: 1;
    }

  </style>
</head>

<body>
<%@ include file="/model.jsp" %>
<%@ include file="checkup.jsp"%>
<%--<%@ include file="/newModel.jsp" %>--%>
<div id="mess">
  <div  id="title">
    租品详情
    <hr />
    <span id="rid"  hidden></span>
  </div>
  <div id="case1">
    <div >
      <img id="img1" border="0"  class="test" src="resource/image/3.jpg" width="300" height="200" alt="" /><br/>
    </div>

  </div>
  <div id="case2">
    <div >
      <img  id="img2" border="0" class="test"  src="/resource/image/3.jpg" width="300" height="200" alt="" /><br/>
    </div>

  </div>
  <div id="case3">
    <div >
      <img id="img3" border="0" class="test" src="/resource/image/3.jpg" width="300" height="200" alt="" /><br/>

    </div>
  </div>

  <div  id="price">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价格描述：<span id="priceDescription" class="red">0000元/月</span>
  </div>
  <div  id="address">
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地址：<span class="red" id="province">陕西</span>省--<span class="red" id="city">西安</span>市--<span id="country" class="red">长安</span>(区/县)
  </div>
  <div  id="detail">
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;详细地址：<span class="red" id="district">西安邮电大学东区3号家属楼203室 </span>
  </div>

  <div  id="describe">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;租品描述：<span id="description" class="red"> 房子坐落在文化气息非常浓重的西邮校园里面，交通生活非常方便，家具齐全，可拎包入住。</span>
  </div>
  <div  id="button1" >
    <input name="submit" type="button" id="cut" class="fix" style="width:120px; height:60px; color:#FFFFFF; " onclick="" value="下架"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="submit" type="button" id="change" class="fix" style="width:120px; height:60px; color:#FFFFFF; " onclick="" value="修改信息"/>
    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;<input name="submit" type="button" id="up" class="fix" style="width:120px; height:60px; color:#FFFFFF; " onclick="" value="上架"/>
    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; <input name="submit" type="button" id="contact" class="fix" style="width:120px; height:60px; color:#FFFFFF; " onclick="" value="联系租客"/>
  </div>
</div>


</body>
<script type="text/javascript">
  function createPage (data) {
    $('#rid').text(data.id);
    $('#province').text(data.address.province);
    $('#city').text(data.address.city);
    $('#country').text(data.address.country);
    $('#priceDescription').text(data.price);
    $('#district').text(data.address.district);
    $('#img1').attr("src", data.picturePathList[0]);
    $('#img2').attr("src", data.picturePathList[1]);
    $('#img3').attr("src", data.picturePathList[2]);
    $('#description').text(data.description);
  }
  $(document).ready(function() {
    var orderUser;
    $('img').bigic();
    /*获取租品信息*/
    $.ajax({
      url:"/rent/getRentGoodsInfo.action",
      type:"get",
      data:window.location.search.replace("?", ""),

      success:function(html) {
        var obj = JSON.parse(html);
        createPage(obj);
      },

      error:function(){
        alert('网络连接超时,请检查网络');
      }
    });

    /*获取的预订者*/
    $.ajax({
      url:"/rent/getOrder.action",
      type:"get",
      data:encodeURI(window.location.search.replace("?", "")),
      success:function(html){
        orderUser = JSON.parse(html);
        if(orderUser.orderUser == null || orderUser.orderUser == ""){
          $('#up').attr("disabled", "disabled").css("background-color", "grey");
          $('#contact').attr("disabled", "disabled").css("background-color", "grey");
        } else{
          $('#up').attr("disabled", false);
          $('#contact').attr("disabled", false);

        }
      },
      error:function(){
        alert('网络连接超时')
      }
    });


    /*用户下架按钮的点击*/
    $('#cut').click(function () {
      var button = $(this);
      $.ajax({
        url: "/korent/cancelSendGoods.action",
        data: "rid=" + encodeURIComponent($('#rid').text()),
        type: "post",
        success: function () {
          button.attr("disabled", "disabled");
          button.val("已经下架");
          operateSuccessTip();
          $(this).delay(1000);
          window.location.href="/userSendGoods.jsp";

        },
        error: function () {
          alert('网络连接超时,请检查网络是否良好');
        }

      })
    });

    /*用户修改按钮的点击*/
    $('#change').click(function(event){
      event.preventDefault();
      window.location.href="/userChangeRent.jsp?" + encodeURI(window.location.search.replace("?", ""));
    });

    /*联系租客按钮的点击*/
    $('#contact').click(function(event){
      window.location.href="/userInformationMore.jsp?id=" + encodeURIComponent(orderUser.orderUser);
    });

    /*上架按钮的点击*/
    $('#up').click(function(event){
      $.ajax({
        url:"/korent/upGoods.action",
        type:"post",
        data:window.location.search.replace("?", ""),
        success:function(html){
          operateSuccessTip();
          $(this).delay(2000).queue(function(){window.location.href="/userSendGoods.jsp"})
        },
        error:function(){
          alert("网络连接失败");
        }

      })


    });
  });
</script>
</html>
