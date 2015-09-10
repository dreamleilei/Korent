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
  <%-- <script type="text/javascript" src="/resource/js/send.js"></script>--%>
  <link href="/resource/css/send.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="/resource/js/jquery-2.1.1.js" ></script>
  <script type="text/javascript" src="/resource/js/jquery.ui.widget.js" ></script>
  <script type="text/javascript" src="/resource/js/jquery.iframe-transport.js"></script>
  <script type="text/javascript" src="/resource/js/jquery.fileupload.js"></script>
  <script type="text/javascript" src="/resource/js/jquery.fileupload-ui.js" ></script>
  <script type="text/javascript" src="/resource/js/jquery.fileupload-process.js"></script>
  <script type="text/javascript" src="/resource/js/jquery.fileupload-validate.js"></script>
  <link href="/resource/css/jNotify.jquery.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="/resource/js/jNotify.jquery.js" ></script>
  <script type="text/javascript" src="/resource/js/operateTip.js" > </script>
  <script type="text/javascript" src="/resource/js/area.js"></script>
  <script type="text/javascript" src="/resource/js/location.js"></script>
  <link href="/resource/css/common.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="/resource/js/send.js"></script>
  <script type="text/javascript" src="/resource/js/jquery.cityselect.js" ></script>
  <script type="text/javascript" src="/resource/js/city.min.js" ></script>



</head>

<body onload="init()">
<%--<%@include file="/newModel.jsp" %>--%>
<%@include file="/model.jsp" %>
<form id="form" action="#" method="get" name="creator" enctype="multipart/form-data" class="ziti">
  <div id="Layer1" style="position:absolute; left:261px; top:165px; width:1014px; height:71px; z-index:1 color:#0000FF; float:left; text-align:center">
    免费发布信息
    <hr /><span style="font-size:24px"><br/><br/><br/>
     <div id="city" style="font-size:24px">
       地址：
       <select name= "province" class="prov" style="width:100px"></select>省(直辖市)
       <select name = "city" class="city" style="width:100px"></select>市(区)
       <select name = "country" class="dist" style="width:100px"> </select>
     </div></span>


    <input type="hidden" name="location_id" />
  </div>


  <div id="Layer2" style="position:absolute; left:539px; top:352px; width:729px; height:76px; z-index:1; font-family:"Microsoft YaHei UI Light", "Microsoft YaHei UI" ;">
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

  <div id="Layer3" style="position:absolute; left:381px; top:406px; width:647px; height:200px; z-index:2;text-align:center;">
    &nbsp;&nbsp;&nbsp;&nbsp;租品详细信息描述:

    <input type="text" name="description" style=" height:50px; width:400px; "/><br/><br/>
  </div>
  <div id="Layer4" style="position:absolute; left:309px; top:479px; width:861px; height:100px; z-index:3 ; text-align:center; color:#FFFFFF; font-size:24px; font-weight:700;">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp具体地址:

    <input type="text" name="district" style=" height:50px; width:400px; "/><br/><br/>
  </div>


  <div id="Layer5" style="position:absolute; left:652px; top:904px; width:184px; height:45px; z-index:4">
    <input id="submit" type="submit" value="发布" onClick="" class="queren" style="width:195px; height:34px;" />
    <span hidden id="send_success" class="message"></span></div>
  <div id="Layer6" style="position:absolute; left:405px; top:822px; width:262px; height:16px; z-index:5">
    <input name="photo" id="photo1" type="file" hidden="hidden"  multiple/>
    <input name="submit" id ="photo1Button" type="button"  class="queren1" onclick="" value="上传图片"/>
  </div>
  <div id="Layer7" style="position:absolute; left:407px; top:576px; width:139px; height:103px; z-index:11">
    <a href="" name="image"><img id="img1"src="" height="103px" width="139px" name="photo1" style="position:absolute; top: 98px;" /></a>
  </div>
  <div id="Layer8" style="position:absolute; left:685px; top:822px; width:163px; height:29px; z-index:7">
    <input name="photo" id="photo2" type="file" hidden="hidden"  multiple/>
    <input name="submit" id ="photo2Button" type="button"  class="queren1" onclick="" value="上传图片"/>
  </div>

  <div id="Layer9" style="position:absolute; left:667px; top:575px; width:139px; height:103px; z-index:10" >

    <a href="" name="image"> <img id="img2" src="" height="103px" width="139px" name="photo2" style="position:absolute; left: -2px; top: 100px;" /></a><br/>
  </div>
  <div id="Layer10" style="position:absolute; left:946px; top:821px; width:175px; height:30px; z-index:9">
    <input name="photo" id="photo3" type="file" hidden="hidden"  multiple/>
    <input name="submit" id ="photo3Button" type="button"   class="queren1" onclick="" value="上传图片"/>
  </div>
  <div id="Layer11" style="position:absolute; left:919px; top:573px; width:139px; height:103px; z-index:9">
    <a href="" name="image" ><img id="img3" src="" height="103px" width="139px" name="photo3" style="position:absolute; left: 2px; top: 102px;" /></a>
    <br/>
  </div>

  <div id="Layer12" style="position:absolute; left:505px; top:548px; width:756px; height:67px; z-index:12; color:#FFFFFF; font-size:24px; font-weight:700;">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价格描述:

    <input type="text" name="price" style=" height:50px; width:300px; "/><br/><br/>
  </div>
</form>



<s:debug />
</body>
<script type="text/javascript">
  $(document).ready(function() {
    $('#city').citySelect();
    $('#submit').click(function (event) {
      event.preventDefault();
      var temp= "&path="+encodeURIComponent($('#img1').attr("src"))+"&path=" + encodeURIComponent($('#img2').attr("src")) +"&path=" +encodeURIComponent($('#img3').attr("src"));
      $.ajax({
        url: "/korent/sendGoods.action",
        type: "POST",
        data:$('#form').serialize()+temp,
        success:function(html){
          $('#send_success').html('<br /> <span class="message" >您已成功发布租品</span>').show(3000).hide(0);
          operateSuccessTip();
        }

      })
    });
    $('#photo1Button').click(function (event) {
      $('#photo1').click().fileupload({
        autoUpload: true,
        url: "/korent/upload.action",
        acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
        maxNumberOfFiles: 1,
        maxFileSize: 5000000,

        error: function (data, e) {
          alert('网络连接超时');
        },

        success: function (data, e) {
          var url = data.savePath;
          $('#img1').attr("src", url);

        }

      });
      $('#photo2Button').click(function (event) {
        $('#photo2').click().fileupload({
          autoUpload: true,
          url: "/korent/upload.action",
          acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
          maxNumberOfFiles: 1,
          maxFileSize: 5000000,

          error: function (data, e) {
            alert('网络连接超时');
          },

          success: function (data, e) {
            var url = data.savePath;
            $('#img2').attr("src", url);

          }

        });
      });
      $('#photo3Button').click(function (event) {
        $('#photo3').click().fileupload({
          autoUpload: true,
          url: "/korent/upload.action",
          acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
          maxNumberOfFiles: 1,
          maxFileSize: 5000000,

          error: function (data, e) {
            alert('网络连接超时');
          },

          success: function (data, e) {
            var url = data.savePath;
            $('#img3').attr("src", url);

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

