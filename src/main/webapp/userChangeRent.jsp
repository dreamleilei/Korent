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
  <link href="/resource/css/common.css" rel="stylesheet" type="text/css"/>
  <link href="/resource/css/rentInformation.css" type="text/css" rel="stylesheet" />
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
      <a href="" name="image"><img id="img1" border="0"  class="test" src="resource/image/3.jpg" width="300" height="200" alt="" /></a><br/><br/><br/>
      <input type="file" name="photo" id="photo1" hidden />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="button" type="button"  class="fix" id="imgButton1"  value="修改图片" style="width:100px; height:50px;" />
    </div>

  </div>
  <div id="case2">
    <div >
      <a href="" name="image"> <img  id="img2" border="0" class="test"  src="/resource/image/3.jpg" width="300" height="200" alt="" /></a><br/><br/><br/>
      <input type="file" name="photo" id="photo2" hidden />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="imgButton2"  class="fix" value="修改图片" style="width:100px; height:50px;" />
    </div>

  </div>
  <div id="case3">
    <div >
      <a href="" name="image"><img id="img3" border="0" class="test" src="/resource/image/3.jpg" width="300" height="200" alt="" /></a><br/><br/><br/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="imgButton3"  class="fix" value="修改图片" style="width:100px; height:50px;"/>
      <input type="file" name="photo" id="photo3" hidden />

    </div>
  </div>
  <form id= "form" name="form">
  <div id="city">
    地址
    <select name= "province" class="prov" style="width:100px"></select>省(直辖市)
    <select name = "city" class="city" style="width:100px"></select>市(区)
    <select name = "country" class="dist" style="width:100px"> </select>
  </div>
  <div  id="price">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价格描述：
    <textarea id="priceDescription" name="price" cols="40" rows="6" placeholder="" style=" height:40px; width:400px; " ></textarea><br/><br/>
  </div>

  <div  id="detail">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;详细地址：
    <textarea id="district" name="district" cols="40" rows="6" placeholder="" style=" height:50px; width:400px; " ></textarea><br/><br/>
  </div>

  <div  id="describe">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;租品描述：
    <textarea id="description" name="description" cols="40" rows="6" placeholder="" style=" height:100px; width:410px;"></textarea><br/><br/>
  </div>
  <div  id="button1" >
    <input name="submit" type="button" id="cut" class="fix" style="width:120px; height:60px; color:#FFFFFF; " onclick="" value="下架"/>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="change" type="button" id="changeRent" class="fix" style="width:120px; height:60px; color:#FFFFFF; " onclick="" value="修改" />
  </div>
  </form>
</div>

</body>
<script type="text/javascript">
  function createPage (data) {
    $('#rid').text(data.id);
   // $('#province').value(data.address.province);
 //   $('#city').value(data.address.city);
  //  $('#country').value(data.address.country);
    var prov = data.address.province;
    var city = data.address.city;
    var country = data.address.country;
    $('#province option[text=prov]').attr("selected", true);
    $('#city option[text=city]').attr("selected", true);
    $('#country option[text=country]').attr("selected", true);
   // $('#province').val(prov);
   // $('#city').val(city);
  //  $('#country').val(country);
    $('#priceDescription').html(data.price);
    $('#district').html(data.address.district);
    $('#img1').attr("src", data.picturePathList[0]);
    $('#img2').attr("src", data.picturePathList[1]);
    $('#img3').attr("src", data.picturePathList[2]);
   $('#description').html(data.description);
  }
  $(document).ready(function() {
    $('#city').citySelect();
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

    $('#imgButton1').click(function (event) {
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
    });
      $('#imgButton2').click(function (event) {
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
      $('#imgButton3').click(function (event) {
        $('#photo3').click().fileupload({
          autoUpload: true,
          url: "/korent/upload.action",
          acceptFileTypes: /(\价格描述.|\/)(gif|jpe?g|png)$/i,
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

    /*修改按钮的点击*/
    $('#changeRent').click(function (event) {
      event.preventDefault();
      var temp= "&path="+encodeURIComponent($('#img1').attr("src"))+"&path=" + encodeURIComponent($('#img2').attr("src")) +"&path=" + encodeURIComponent($('#img3').attr("src")) +"&rid=" + encodeURIComponent($('#rid').text());
      $.ajax({
        url: "/rent/changeRent.action",
        type: "POST",
        data:$('#form').serialize()+temp,
        success:function(html){
          operateSuccessTip();
          $(this).delay(2000).queue(function(){
            window.location.href="/userSendGoods.jsp";
          });

        }

      })
    });

    });
</script>
</html>
