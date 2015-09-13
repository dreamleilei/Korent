<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>已读信息</title>
  <link href="bootstrap.css" rel="text/css" />
  <script type="text/javascript" src="/resource/js/jquery-2.1.1.js"></script>
  <script type="text/javascript" src="/resource/js/jNotify.jquery.js" ></script>
  <script type="text/javascript" src="/resource/js/operateTip.js" > </script>
  <style type="text/css">
    <!--
    body{
      background-image:url(/resource/image/firstpage.jpg);
      background-repeat:no-repeat;
      background-size:100%;
      background-attachment:fixed;
    }
    div#container{width:1355px;}
    div#header{width:1355px; height:90px;}
    div#header0 {width:200px; height: 90px; float:left; font-size:30px;}


    div#message{width:1355px; height:550px}
    div#text1{
      position:absolute;
      left:200px;
      top:40px;
      width:800px;
      height:248px;
      font-size:48px;

      z-index:1;
    }
    div#text2{
      position:absolute;
      left:200px;
      top:380px;
      width:800px;
      height:248px;
      font-size:48px;

      z-index:1;
    }
    div#text3{
      position:absolute;
      left:200px;
      top:720px;
      width:800px;
      height:248px;
      font-size:48px;

      z-index:1;
    }
    div#text4{
      position:absolute;
      left:200px;
      top:1060px;
      width:800px;
      height:248px;
      font-size:48px;

      z-index:1;
    }
    div#text5{
      position:absolute;
      left:200px;
      top:1400px;
      width:800px;
      height:248px;
      font-size:48px;

      z-index:1;
    }
    div#text6{
      position:absolute;
      left:200px;
      top:1740px;
      width:800px;
      height:248px;
      font-size:48px;

      z-index:1;
    }
    div#goodsplay{
      width: 1190px;
      height: 3000px;
      float:left;
      margin:70px;
      margin-top:30px;
      margin-right:0px;
      background-color:#000000;
      opacity:0.5;
    }
    div#frame1,div#frame2,div#frame3,div#frame4,div#frame5,div#frame6{
      width:1000px;
      height:330px;
      margin-left:40px;


    }

    .red{
      color:#FFFFFF;
      font-size: 36px;
    }
    .fix{
      color:#000000;
      font-size: 12px;
      background-color:#3399FF;
    }
    div#chara{position:absolute; left:200px; top:250px; color:#FFFFFF; font-size:36px; font-weight:bold; width:927px; height:2800px;}



    -->
  </style>
</head>

<body>
<%@ include file="/newModel.jsp" %>
<%@ include file="/checkup.jsp"%>
<div id="container">


  <div id="message">


  </div>
</div>

<div id="chara">

  <div id="frame1" >
    <div id="img1" style="width:120px; height:140px; ">
      <img  border="0" src="/resource/image/adminHead.jpg" width="120" height="140" />
    </div>
    <div id="text1" >
      <span class="red" id="note1"></span>

    </div>
    <div   style="font-size:24px ">
      &nbsp;系统消息

    </div>
    <br/>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input hidden name="submit" type="button"  class="fix" style="width:100px; height:30px;color:#FFFFFF; " onclick="" value="删除"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input  hidden name="delete" type="button"  class="fix" style="width:100px; height:30px;color:#FFFFFF; " onclick="" value="移除"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="date1" style="font-size:20px; color:red; text-align: right">2015-01-01:22:33:22</span><span  id="nid1" hidden></span>


    <hr />
  </div>

  <div id="frame2" >
    <div id="img2" style="width:120px; height:140px; ">
      <img  border="0" src="/resource/image/adminHead.jpg" width="120" height="140" />
    </div>
    <div id="text2" >
      <span class="red" id="note2">不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了</span>

    </div>
    <div style="font-size:24px ">
      &nbsp;系统消息

    </div>
    <br/>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input hidden name="submit" type="button"  class="fix" style="width:100px; height:30px;color:#FFFFFF; " onclick="" value="删除"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input   hidden name="delete" type="button"  class="fix" style="width:100px; height:30px;color:#FFFFFF; " onclick="" value="移除"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="date2" style="font-size:20px; color:red">2015-01-01:22:33:22</span><span id="nid2"  hidden></span>


    <hr />
  </div>

  <div id="frame3" >
    <div id="img3" style="width:120px; height:140px; ">
      <img  border="0" src="/resource/image/adminHead.jpg" width="120" height="140" />
    </div>
    <div id="text3" >
      <span class="red" id="note3">不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了</span>


    </div>
    <div  style="font-size:24px ">
      &nbsp;系统消息

    </div>
    <br/>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input hidden name="submit" type="button"  class="fix" style="width:100px; height:30px;color:#FFFFFF; " onclick="" value="删除"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input  hidden name="delete" type="button"  class="fix" style="width:100px; height:30px;color:#FFFFFF; " onclick="" value="移除"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="date3" style="font-size:20px; color:red">2015-01-01:22:33:22</span><span  id="nid3" hidden></span>


    <hr />
  </div>

  <div id="frame4" >
    <div id="img4" style="width:120px; height:140px; ">
      <img  border="0" src="/resource/image/adminHead.jpg" width="120" height="140" />
    </div>
    <div id="text4" >
      <span class="red" id="note4">不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了</span>

    </div>
    <div  style="font-size:24px ">
      &nbsp;系统消息

    </div>
    <br/>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input hidden name="submit" type="button"  class="fix" style="width:100px; height:30px;color:#FFFFFF; " onclick="" value="删除"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input  hidden name="delete" type="button"  class="fix" style="width:100px; height:30px;color:#FFFFFF; " onclick="" value="移除"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="date4" style="font-size:20px; color:red">2015-01-01:22:33:22</span><span id="nid4"  hidden></span>


    <hr />
  </div>
  <div id="frame5" >
    <div id="img5" style="width:120px; height:140px; ">
      <img  border="0" src="/resource/image/adminHead.jpg" width="120" height="140" />
    </div>
    <div id="text5" >
      <span class="red" id="note5">不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了</span>
    </div>
    <div   style="font-size:24px ">
      &nbsp;系统消息

    </div>
    <br/>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input hidden name="submit" type="button"  class="fix" style="width:100px; height:30px;color:#FFFFFF; " onclick="" value="删除"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input  hidden name="delete" type="button"  class="fix" style="width:100px; height:30px;color:#FFFFFF; " onclick="" value="移除"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="date5" style="font-size:20px; color:red">2015-01-01:22:33:22</span><span id="nid5" hidden></span>


    <hr />
  </div>
  <div id="frame6" >
    <div id="img6" style="width:120px; height:140px; ">
      <img  border="0" src="/resource/image/adminHead.jpg" width="120" height="140" />
    </div>
    <div id="text6" >
      <span class="red" id="note6">不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了不想敲了</span>

    </div>
    <div  style="font-size:24px ">
      &nbsp;系统消息

    </div>
    <br/>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input hidden name="submit" type="button"  class="fix" style="width:100px; height:30px;color:#FFFFFF; " onclick="" value="删除"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input  hidden name="delete" type="button"  class="fix" style="width:100px; height:30px;color:#FFFFFF; " onclick="" value="移除"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="date6" style="font-size:20px; color:red">2015-01-01:22:33:22</span><span id="nid6" hidden></span>


    <hr />
  </div>

  <div id ="spanPage" style="height:30px; margin-top:200px; text-align:center; color:#ffffff; font-size:24px"><br /><br/>
    <a><span id="spanFirst">&nbsp;第一页</span></a>
    <a><span id="spanPre">上一页</span></a>
    <span id="add"> </span>
    <span>第<input type="text" style="width:30px"  value=""/>页<input type="button" class="fix" value="跳转" style="font-size:18px; width:60px"/></span>
    <a><span id="spanNext">下一页</span></a>
    <a><span id="spanLast">最后一页</span></a>
    第
    <span id="spanPageNum"></span>
    页/共
    <span id="spanTotalPage"></span>
    页
  </div>
</div>
<script type="text/javascript">

  /*生成消息通知*/
  function createNote(note_array){
    for(var i = 1; i <= note_array.length; i++){
      $('#note' + i).html(note_array[i -1].content);
      $('#date'+i).text(note_array[i-1].date);
      $('#nid' + i).text(note_array[i-1].id);
    } if(note_array.length <6){
      for(i;i <= 6;i++){
        $('#frame' +i).hide();
      }
    }
  }

  /*生成页脚*/
  function createPage(pageModel) {
    var model = "";
    for (var i = 1; i <= pageModel.pageCount; i++) {
      model += "<a href=\"/readMessage.jsp?pageNo=" + i + "\&pageSize=6\" ><span>" + i + "&nbsp;&nbsp;</span></a>";
    }

    $('#spanFirst').parent().attr("href", "/readMessage.jsp?pageNo=1&pageSize=6");
    $('#spanLast').parent().attr("href", "/readMessage.jsp?pageNo=" + pageModel.pageCount + "&pageSize=6");
    $('#spanNext').parent().attr("href", "/readMessage.jsp?pageNo=" + (pageModel.pageNo + 1 ) +"&pageSize=6");
    $('#spanPre').parent().attr("href", "/readMessage.jsp?pageNo=" + (pageModel.pageNo - 1 ) +"&pageSize=6");
    $('#add').append(model);
    $('#spanPageNum').text(pageModel.pageNo);
    $('#spanTotalPage').text(pageModel.pageCount);
    if(pageModel.pageNo == 1){
      $('#spanPre').parent().hide();
    }
    if(pageModel.pageNo == pageModel.pageCount){
      $('#spanNext').parent().hide();
    }
    /* if(pageModel.pageCount == 1) {
     $('#spanPage').hide();
     }*/
  }
  $(document).ready(function(){
    var uid = "<%=session.getAttribute("user")%>";
    $.ajax({
      url:"/note/getReadNote.action",
      type:"get",
      data:"uid=" + encodeURIComponent(uid),
      success:function(html){
        var obj = JSON.parse(html);
        createPage(obj.pageModel);
        createNote(obj.note);

      },
      error:function(){
        alert('网络连接失败,请检查网络');
      }
    });

    /*删除按钮的点击*/
    $(':button[value="删除"]').click(function(event){
      var button = $(this);
      event.preventDefault();
      $.ajax({
        url:"/note/readNote.action",
        type:"post",
        data:"nid=" + encodeURIComponent(button.next().next().next().text()),
        success:function(html){
         // button.val("已读");
        //  button.attr("disabled", "disabled");
          operateSuccessTip();
          button.parent().hide();
       //   button.next().parent().hide();

        },
        error:function(){
          alert('网络连接失败');
        }
      })

    });

    /*移除按钮的点击*/
    $(':button[value="移除"]').click(function(event){
      var button = $(this);
      event.preventDefault();
      $.ajax({
        url:"/note/deleteNote.action",
        type:"post",
        data:"nid=" + encodeURIComponent(button.next().next().text()),
        success:function(html){
          $(this).delay(2000);
          button.parent().hide();

        },
        error:function(){
          alert('网络连接失败');
        }
      })

    });

  });
</script>
</body>
</html>
