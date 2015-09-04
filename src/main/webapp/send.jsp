<%--
  Created by IntelliJ IDEA.
  User: lei
  Date: 15-9-2
  Time: 下午7:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
  <title>我要发布</title>
  <link href="bootstrap.css" rel="text/css" />
  <script type="text/javascript" src="./resource/js/send.js"></script>
  <link href="./resource/css/send.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="./resource/js/jquery-2.1.1.js" ></script>
  <script type="text/javascript" src="./resource/js/jquery.ui.widget.js" ></script>
  <script type="text/javascript" src="./resource/js/jquery.iframe-transport.js"></script>
  <script type="text/javascript" src="./resource/js/jquery.fileupload.js"></script>
  <script type="text/javascript" src="./resource/js/jquery.fileupload-ui.js" ></script>
  <script type="text/javascript" src="./resource/js/jquery.fileupload-process.js"></script>
  <script type="text/javascript" src="./resource/js/jquery.fileupload-validate.js"></script>


</head>

<body onload="init()">>
<s:form id="form" action="#" method="get" name="creator" enctype="multipart/form-data" class="ziti">
  <div id="Layer1" style="position:absolute; left:261px; top:165px; width:1014px; height:71px; z-index:1 color:#0000FF">
    免费发布信息
    <hr /><span style="font-size:24px">
      省份 <select name="province" onChange = "select()"></select>　城市 <select name="city" onChange = "select()"></select>

      区县 <input type="text" name="country" >　区县自行填写（直辖市不用填写）</span>
  </div>


<div id="Layer2" style="position:absolute; left:342px; top:341px; width:729px; height:76px; z-index:1;">
  租品分类:
  <select id="classify" style="height:30px;width:80px" name="classify" >
    <option>房屋</option>
    <option>汽车</option>
    <option>自行车</option>
    <option>婚庆用品</option>
    <option>丧葬用品</option>
    <option>书籍</option>
    <option>服装</option>
    <option>其他</option>
  </select>
</div>

<div id="Layer3" style="position:absolute; left:243px; top:405px; width:647px; height:200px; z-index:2">
  <div style="float:left ">租品详细信息描述:</div>
  <div style="float:left ">
    <input type="text" name="description" style=" height:50px; width:400px; "/><br/><br/>
  </div>
</div>
<div id="Layer4" style="position:absolute; left:149px; top:482px; width:818px; height:100px; z-index:3">
  <div style="float:left ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp具体地址:</div>
  <div style="float:left ">
    <input type="text" name="district" style=" height:50px; width:400px; "/><br/><br/>
  </div>
</div>


<div id="Layer5" style="position:absolute; left:650px; top:797px; width:184px; height:45px; z-index:4">
  <input id="submit" type="submit" value="发布" onClick="" class="queren" style="width:195px; height:34px;" />
</div>
<div id="Layer6" style="position:absolute; left:426px; top:699px; width:262px; height:16px; z-index:5">
  <input name="photo" id="photo1" type="file" hidden="hidden"  multiple/>
  <input name="submit" id ="photo1Button" type="button"  class="queren1" onclick="" value="上传图片"/>
   <%--<s:file name="photo1"   class="queren1" onclick="" label="上传图片"/>--%>
</div>
<div id="Layer7" style="position:absolute; left:407px; top:576px; width:139px; height:103px; z-index:11">
  <%--<input value="" disabled  type="image"  name="photo" style=" height:103px; width:139px; "/><br/>--%>
  <a href="" name="image"><img id="img1"src="" height="103px" width="139px" name="photo1" style="position:absolute; " /></a>
</div>
<div id="Layer8" style="position:absolute; left:691px; top:698px; width:163px; height:29px; z-index:7">
  <input name="photo" id="photo2" type="file" hidden="hidden"  multiple/>
  <input name="submit" id ="photo2Button" type="button"  class="queren1" onclick="" value="上传图片"/>
 <%--   <s:file name="photo2"   class="queren1" onclick="" label="上传图片"/>--%>
</div>

<div id="Layer9" style="position:absolute; left:667px; top:575px; width:139px; height:103px; z-index:10" >
  <%--<input value="" disabled type="image"  name="photo" style=" height:103px; width:139px; "/>--%>
    <a href="" name="image"> <img id="img2" src="" height="103px" width="139px" name="photo2" style="position:absolute; " /></a><br/>
</div>
<div id="Layer10" style="position:absolute; left:940px; top:693px; width:175px; height:30px; z-index:9">
  <input name="photo" id="photo3" type="file" hidden="hidden"  multiple/>
  <input name="submit" id ="photo3Button" type="button"   class="queren1" onclick="" value="上传图片"/>
</div>
<div id="Layer11" style="position:absolute; left:919px; top:573px; width:139px; height:103px; z-index:9">
  <%--<input  value="" disabled type="image"  name="photo" style=" height:103px; width:139px; "/>--%>
    <a href="" name="image" ><img id="img3" src="" height="103px" width="139px" name="photo3" style="position:absolute; " /></a>
    <br/>
</div>
</s:form>
<div id="container">

  <div id="header">
    <div id="header0">
      <img src="./resource/image/logo4.png" height="100" width="200" /></div>

    <div id="header1">

      <a href="" class="href1">首页</a>
    </div>

    <div id="header2">
      <a href="个人中心.html" class="href1">个人中心</a>
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

</div>
</body>
<script type="text/javascript">
  $(document).ready(function() {
    $('#submit').click(function (event) {
      event.preventDefault();
      var temp= "&path="+encodeURIComponent($('#img1').attr("src"))+"&path=" + encodeURIComponent($('#img2').attr("src")) +"&path=" +encodeURIComponent($('#img3').attr("src"));
      $.ajax({
        url: "/korent/sendGoods.action",
        type: "POST",
        data:$('#form').serialize()+temp,
        success:function(html){
          alert(html);
        }

      })
    });
    $('#photo1Button').click(function (event) {
      $('#photo1').click().fileupload({
        autoUpload: true,
        url: "/korent/upload.action",
        acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
        maxNumberOfFiles: 1,
        maxFileSize: 2000000,

        error: function (data, e) {
          alert('error');
        },

        success: function (data, e) {
          var url = data.savePath;
          alert(url);
          $('img').eq(0).attr("src", url);

        }

      });
      $('#photo2Button').click(function (event) {
        $('#photo2').click().fileupload({
          autoUpload: true,
          url: "/korent/upload.action",
          acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
          maxNumberOfFiles: 1,
          maxFileSize: 2000000,

          error: function (data, e) {
            alert('error');
          },

          success: function (data, e) {
            var url = data.savePath;
            alert(url);
            $('img').eq(1).attr("src", url);

          }

        });
      });
      $('#photo3Button').click(function (event) {
        $('#photo3').click().fileupload({
          autoUpload: true,
          url: "/korent/upload.action",
          acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
          maxNumberOfFiles: 1,
          maxFileSize: 2000000,

          error: function (data, e) {
            alert('error');
          },

          success: function (data, e) {
            var url = data.savePath;
            alert(url);
            $('img').eq(2).attr("src", url);

          }
        });
      });

      $('a[name="image"]').hover(function () {
        $(this).find('img[src !=""]').css({'width': 502, 'height': 302});

      }, function () {
        $(this).find('img[src !=""]').css({'width': 139, 'height': 103});

      })
    });
  });
</script>
</html>

