
<%--
  Created by IntelliJ IDEA.
  User: lei
  Date: 15-9-6
  Time: 上午10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
  <title>房屋信息</title>
  <link href="bootstrap.css" rel="text/css" />
  <link href="/resource/css/message1.css" rel="stylesheet" type="text/css" />
  <script src="/resource/js/jquery-2.1.1.js" type="text/javascript"> </script>
  <link href="/resource/css/jNotify.jquery.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="/resource/js/jNotify.jquery.js" ></script>
  <script type="text/javascript" src="/resource/js/operateTip.js" > </script>
</head>

<body>
<%@ include file="newModel.jsp" %>

<div id="mess">
  <div  id="title">
    租品浏览
    <hr />
  </div>
  <!--  <div id="show">-->
  <div id="case1">
    <div id="img1">
      <a href="房屋信息.html" style="text-decoration:none"><img  border="0" src="/resource/image/3.jpg" width="300" height="200" /></a><br/>
    </div>
    <div id="text1">
      &nbsp;&nbsp;&nbsp;价格描述：
      <span id="price1" class="red">0000</span>&nbsp;&nbsp;<span id="classify1" class="red">房屋</span><br/>
      &nbsp;&nbsp;&nbsp;日期：
      <span id="date1" class="red">yyyy-mm-dd</span><br/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="submit" type="button"  class="fix" style="width:100px; height:30px; color:#FFFFFF; "  onclick=""  value="预订"/>
      <span id="rid1"  hidden></span>
    </div>
  </div>
  <div id="case2">
    <div id="img2">
      <a href="房屋信息.html" style="text-decoration:none"><img  border="0" src="/resource/image/3.jpg" width="300" height="200" /></a><br/>
    </div>
    <div id="text2">
      &nbsp;&nbsp;&nbsp;价格描述：
      <span id="price2" class="red">0000</span>&nbsp;&nbsp;<span id="classify2" class="red">房屋</span><br/>
      &nbsp;&nbsp;&nbsp;日期：
      <span id="date2" class="red">yyyy-mm-dd</span><br/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="submit" type="button"  class="fix" style="width:100px; height:30px; color:#FFFFFF; "  onclick=""  value="预订"/>
      <span id="rid2"  hidden></span>
    </div>
  </div>
  <div id="case3">
    <div id="img3">
      <a href="房屋信息.html" style="text-decoration:none"><img  border="0" src="/resource/image/3.jpg" width="300" height="200" /></a><br/>
      <div id="text3">
        &nbsp;&nbsp;&nbsp;价格描述：
        <span id="price3" class="red">0000</span>&nbsp;&nbsp;<span id="classify3" class="red">房屋</span><br/>
        &nbsp;&nbsp;&nbsp;日期：
        <span id="date3" class="red">yyyy-mm-dd</span><br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="submit" type="button"  class="fix" style="width:100px; height:30px;color:#FFFFFF; "  onclick="" value="预订"/>
        <span id="rid3"  hidden ></span>
      </div>
    </div>
  </div>

  <div  id="title1">

  </div>

  <div id="case4">
    <div id="img4">
      <a href="房屋信息.html" style="text-decoration:none"><img  border="0" src="resource/image/3.jpg" width="300" height="200" /></a><br/>
    </div>
    <div id="text4">
      &nbsp;&nbsp;&nbsp;价格描述：
      <span id="price4" class="red">0000</span>&nbsp;&nbsp;<span id="classify4" class="red">房屋</span><br/>
      &nbsp;&nbsp;&nbsp;日期：
      <span id="date4" id="date4" class="red">yyyy-mm-dd</span><br/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="submit" type="button"  class="fix" style="width:100px; height:30px;color:#FFFFFF; "  onclick="" value="预订"/>
      <span id="rid4" hidden ></span>
    </div>
  </div>
  <div id="case5">
    <div id="img5">
      <a href="房屋信息.html" style="text-decoration:none"><img  border="0" src="/resource/image/3.jpg" width="300" height="200" /></a><br/>
    </div>
    <div id="text5">
      &nbsp;&nbsp;&nbsp;价格描述：
      <span id="price5" class="red">0000</span>&nbsp;&nbsp;<span id="classify5" class="red">房屋</span><br/>
      &nbsp;&nbsp;&nbsp;日期：
      <span id="date5" class="red">yyyy-mm-dd</span><br/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="submit" type="button"  class="fix" style="width:100px; height:30px; color:#FFFFFF; " onclick="" value="预订"/>
      <span id="rid5"  hidden></span>
    </div>
  </div>
  <div id="case6">
    <div id="img6">
      <a href="房屋信息.html" style="text-decoration:none"><img  border="0" src="/resource/image/3.jpg" width="300" height="200" /></a><br/>
    </div>
    <div id="text6">
      &nbsp;&nbsp;&nbsp;价格描述：
      <span id="price6" class="red">0000</span>&nbsp;&nbsp;<span id="classify6" class="red">房屋</span><br/>
      &nbsp;&nbsp;&nbsp;日期：
      <span id="date6" class="red">yyyy-mm-dd</span><br/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="submit" type="button"  class="fix" style="width:100px; height:30px; color:#FFFFFF; " onclick=""  value="预订"/>
      <span id="rid6"  hidden></span>
    </div>
  </div>
  <!--</div>-->
  <div id ="spanPage" style="height:30px; margin-top:920px; text-align:center; color:#FFFFFF; font-size:24px">
    <a><span id="spanFirst">第一页</span></a>
    <a><span id="spanPre">上一页</span></a>
    <!--<span>1</span>
    <span>2</span>
    <span>3</span>
    <span>4</span>-->
    <span id="add"> </span>
    <span>第<input type="text" style="width:15px" value="2"/>页<input type="button" value="跳转" style="font-size:18px;"/></span>
    <a><span id="spanNext">下一页</span></a>
    <a><span id="spanLast">最后一页</span></a>
    第
    <span id="spanPageNum"></span>
    页/共
    <span id="spanTotalPage"></span>
    页
  </div>

</div>

</body>
<script type="text/javascript" >
  /*生成页脚*/
  function createPage(pageModel) {
    var model = "";
    for (var i = 1; i <= pageModel.pageCount; i++) {
      model += "<a href=\"/rent.jsp?pageNo=" + i + "\&pageSize=6\" ><span>" + i + "&nbsp;&nbsp;</span></a>";
    }
    $('#spanFirst').parent().attr("href", "/rent.jsp?pageNo=1&pageSize=6");
    $('#spanLast').parent().attr("href", "/rent.jsp?pageNo=" + pageModel.pageCount + "&pageSize=6");
    $('#spanNext').parent().attr("href", "/rent.jsp?pageNo=" + (pageModel.pageNo + 1 ) +"&pageSize=6");
    $('#spanPre').parent().attr("href", "/rent.jsp?pageNo=" + (pageModel.pageNo - 1 ) +"&pageSize=6");
    $('#add').append(model);
    $('#spanPageNum').text(pageModel.pageNo);
    $('#spanTotalPage').text(pageModel.pageCount);
    if(pageModel.pageNo == 1){
      $('#spanPre').parent().hide();
    }
    if(pageModel.pageNo == pageModel.pageCount){
      $('#spanNext').parent().hide();
    }
    if(pageModel.pageCount == 1) {
      $('#spanPage').hide();
    }
  }
  /*生成租品信息*/
  function createRent(rent_array){
    for(var i = 1; i <= rent_array.length; i++){
      $('#img' + i).children('a').children('img').attr("src", rent_array[i-1].picturePathList[0]);
      $('#img'+i).children('a').attr("href", "/rentInformation.jsp?rid=" + rent_array[i -1 ].id);
      $('#date' +i).text(rent_array[i-1].updateDate);
      $('#price' +i).text(rent_array[i -1].price);
      $('#classify' +i).text(rent_array[i -1].classify);
      $('#rid' +i).text(rent_array[i-1].id);
      if(rent_array[i - 1].status == "IsOrder"){
        $('#rid' +i).prev().val("已被预订");
        $('#rid' +i).prev().attr("disabled", "disabled");
      } else if(rent_array[i - 1].status == "CanOrder"){
        $('#rid +i').prev().val("预订");
      }
    } if(rent_array.length <6){
      for(i;i <= 6;i++){
        $('#case' +i).hide();
      }
    }
  }
  $(document).ready(function(){
    /*用户预定按钮的点击*/
    $(':button[value="预订"]').click(function(event){
      event.preventDefault();
      var button  = $(this);
      $.ajax({
        url:"/korent/orderRent.action",
        type:"get",
        data:"rid="+ encodeURIComponent($(this).next().text()),
        success:function(html){
          button.attr("disabled", "disabled");
          button.val('已被预订');
          operateSuccessTip();
        },
        error:function(){
          alert('网络连接超时,请检查网络');
        }
      });
    });
    /*获取租品信息*/
    $.ajax({
      url:"/rent/getAllRentGoods.action",
      type:"get",
      data:window.location.search.replace("?", ""),
      success:function(html){
        var obj = JSON.parse(html);
        createPage(obj.pageModel);
        createRent(obj.rent);
        //   var test =  [{"id":16,"description":"这是一栋别墅","classify":"房屋","address":{"province":"山东","city":"淄博","country":"高青","district":"青城镇孙家村"},"price":"100元/天","updateDate":"九月 4, 2015","picturePathList":[]}];
        //createRent(test);
      },
      error:function(){
        alert('网络连接超时,请检查网络');
      }
    });
  });
</script>
</html>
