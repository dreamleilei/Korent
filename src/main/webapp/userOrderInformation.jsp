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
  <title>预订租品详情</title>
  <link href="/resource/css/style.css" rel="stylesheet" type="text/css"/>
  <script src="/resource/js/jquery-2.1.1.js"></script>

  <script src="/resource/js/jquey-bigic.js"></script>
  <link href="/resource/css/rentInformation.css" type="text/css" rel="stylesheet" />
  <link href="/resource/css/jNotify.jquery.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="/resource/js/jNotify.jquery.js" ></script>
  <script type="text/javascript" src="/resource/js/operateTip.js" > </script>


  <style type="text/css" >

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


    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="submit" type="button"  id="order" class="fix" style="width:120px; height:60px; color:#FFFFFF; " onclick="" value="取消预订"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="contact" type="button" id="contact" class="fix" style="width:120px; height:60px; color:#FFFFFF; " onclick="" value="联系租主"/>
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
    $('img').bigic();
    var owner;
    $.ajax({
      url:"/rent/getOwnerFollower.action",
      type:"get",
      data:window.location.search.replace("?", ""),

      success:function(html) {
        var obj = JSON.parse(html);
        owner = obj.owner.id;
        },

      error:function(){
        alert('网络连接超时,请检查网络');
      }
    });

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

    /*用户取消预订按钮的点击*/
    $('#order').click(function (event) {
      event.preventDefault();
      var button = $(this);
      if(button.val() == "取消预订"){
      $.ajax({
        url: "/korent/cancelOrder.action",
        type: "get",
        data: "rid=" + encodeURIComponent($('#rid').text()),
        success: function (html) {
          button.val("预订");
          operateSuccessTip();
        },
        error: function () {
          alert('网络连接超时,请检查网络');
        }
      });
      } else if(button.val() == "预订") {
        $.ajax({
          url: "/korent/orderRent.action",
          type: "get",
          data: "rid=" + encodeURIComponent($('#rid').text()),
          success: function (html) {
            /*   button.attr("disabled", "disabled");*/
            button.val('取消预订');
            operateSuccessTip();
          },
          error: function () {
            alert('网络连接超时,请检查网络');
          }
        });
      }
    });

    $('#contact').click(function(event){
      event.preventDefault();
      window.location.href="/userInformationMore.jsp?id=" +encodeURIComponent(owner);
    });

  });
</script>
</html>
