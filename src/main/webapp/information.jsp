<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>个人中心</title>
    <link href="/resource/css/newInformation.css" rel="stylesheet" />
    <link rel="stylesheet" href="/resource/css/jquery.Jcrop.css" type="text/css" />
    <script type="text/javascript" src="/resource/js/jquery-2.1.1.js" ></script>
    <script type="text/javascript" src="/resource/js/jquery.ui.widget.js" ></script>
    <script type="text/javascript" src="/resource/js/jquery.iframe-transport.js"></script>
    <script type="text/javascript" src="/resource/js/jquery.fileupload.js"></script>
    <script type="text/javascript" src="/resource/js/jquery.fileupload-ui.js" ></script>
    <script type="text/javascript" src="/resource/js/jquery.fileupload-process.js"></script>
    <script type="text/javascript" src="/resource/js/jquery.fileupload-validate.js"></script
    <link href="/resource/css/jNotify.jquery.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/resource/js/jNotify.jquery.js" ></script>
    <script type="text/javascript" src="/resource/js/operateTip.js" > </script>
    <script src="/resource/js/jquery.Jcrop.js" type="text/javascript"></script>

</head>

<body>
<%@ include file="/model.jsp" %>
<s:action name="getInformation" namespace="/korent" />

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
            <input id="man_radio" type="radio" name="sex" value="男" >男
            <input id="woman_radio" type="radio" name="sex" value="女" />女
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
        <div style="position:relative; left:150px; margin-top:80px">
            <%-- <input id = "submit" name="submit" type="button"  class="save" onclick="" value="保存"/>--%>
            <span class="message" ></span>
        </div>
        <!--<div id="headimg" style="position:relative; left:34px; margin-bottom:20px; height:150px; width:500px">
          <div style="float:left">我的头像:</div>
          <div style="float:left; margin-left:10px;"><img  id="myHead" src="/resource/image/1.jpg" name="photo" style="height:140px; width:190px; "/></div>
          <div style="float:left; margin-left:10px;"><img  id="preview" src="/resource/image/1.jpg" name="photo" style="height:100px; width:100px; "/></div>
        </div>

        <div id="headimgTest" style="position:relative; left:34px; margin-bottom:20px; height:150px; width:200px">

        </div>-->
        <div id="headimg" style="position:relative; left:34px; margin-bottom:20px  width:600px; height :200px">
            <div style="float:left">新头像:</div>
            <div style="float:left; margin-left:10px;"><img  id="myHead" src="" name="photo" style="height:140px; width:190px; "/></div>
            <div style="float:left; margin-left:30px; overflow:hidden; width:100px; height :100px" id="previewDiv" ><img   id="preview" src="" name="photo" style="height:100px; width:100px;" /></div>
        </div>

        <%--<div style="position:relative; left:110px; margin-top:-40px">
          <input name="submit" type="button"  class="uploading" onclick="" value="上传图片"/>
        </div>--%>

        <div style="position:relative; left:175px;">
            <input id="photoImage" type="file" name="photo" hidden  multiple />
            <input id="uploadPhoto" name="submit" type="button"  class="uploading" onclick="" value="上传图片"/>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

            <input id="yes" name="submit" type="button"  hidden class="uploading" onclick="" value="确定"/>
        </div>

        <div style="position:relative; left:150px; margin-top:80px">
            <input id = "submit" name="submit" type="button"  class="save" onclick="" value="保存"/>
            <span class="message" hidden> <br/>信息修改成功!</span>
        </div>
    </form>

    <form id ="headForm">
        <input type="hidden" name="image.x" id="x"/>
        <input type="hidden" name="image.y" id="y"/>
        <input type="hidden" name="image.width" id="width"/>
        <input type="hidden" name="image.height" id="height"/>
    </form>



</div>
<s:debug />
</body>
<script type="text/javascript" >
    // 对Date的扩展，将 Date 转化为指定格式的String
    // 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
    // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
    // 例子：
    // (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
    // (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
    Date.prototype.Format = function(fmt)
    { //author: meizz
        var o = {
            "M+" : this.getMonth()+1,                 //月份
            "d+" : this.getDate(),                    //日
            "h+" : this.getHours(),                   //小时
            "m+" : this.getMinutes(),                 //分
            "s+" : this.getSeconds(),                 //秒
            "q+" : Math.floor((this.getMonth()+3)/3), //季度
            "S"  : this.getMilliseconds()             //毫秒
        };
        if(/(y+)/.test(fmt))
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o)
            if(new RegExp("("+ k +")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        return fmt;
    };

    var myJCrop;
    var x;
    var y;
    var width;
    var height;
    var jcrop_api, boundx, boundy;


    function updatePreview(c) {
        $("#x").val(c.x);
        $("#y").val(c.y);
        $("#width").val(c.w);
        $("#height").val(c.h);
        if (parseInt(c.w) > 0) {
            //通过比例值控制图片的样式与显示
            $("#preview").css({
                width: Math.round(100 / c.w * boundx) + "px", //预览图片宽度为计算比例值与原图片宽度的乘积
                height: Math.round(100 / c.h * boundy) + "px", //预览图片高度为计算比例值与原图片高度的乘积
                marginLeft: "-" + Math.round(100 / c.w * c.x) + "px",
                marginTop: "-" + Math.round(200 / c.h * c.y) + "px"
            });
        }
    }



    $(document).ready(function() {
        $('.message').hide();
        var information = <s:property value="#request.userInfo" escape="false" escapeHtml="false"/>;
        $('input[name="username"]').val(information.name);
        $('input[name="email"]').val(information.email);
        $('input[name="phone"]').val(information.phone);
        $('input[name="qq"]').val(information.qq);

        <%
       /* String s = <s:property value="#request.otherInfo" escape="false" escapeHtml="false"/>;*/
        String s = (String)request.getAttribute("otherInfo");
        if(s == null){
        s = "\"ssss\"";
        }
        %>
        var otherInformation = <%=s%>;
        $('input[name="realName"]').val(otherInformation.realName);
        $('input[name="idNumber"]').val(otherInformation.idNumber);
        $('input[name="address"]').val(otherInformation.address);

        if(otherInformation.sex == "男"){
            $('#man_radio').attr("checked", true)
        } if(otherInformation.sex == "女"){
            $('#woman_radio').attr("checked", true);
        }
        var date = new Date(otherInformation.birth);
        $('input[name="birth"]').val(date.Format("yyyy-MM-dd"));

        $('#submit').click(function(event){
            event.preventDefault();
            $.ajax({
                url:"/korent/changeInformation.action",
                type:"post",
                data:$('#form').serialize()+"&username="+encodeURIComponent(information.name),
                success:function(html){
                    $('.message').show().delay(3000).hide(0);
                    operateSuccessTip();
                },
                error:function(){
                    alert('修改失败,请检查网络!')
                }

            })
        });

        /*上传图片按钮的点击*/
        $('#uploadPhoto').click(function(event){
            var uploadButton = $(this);
            event.preventDefault();
            $('#photoImage').click().fileupload({
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
                    $('#myHead').attr("src", url);
                    $('#preview').attr("src", url);
                    uploadButton.hide();
                    $('#yes').show();
                    myJCrop = $.Jcrop('#myHead',{
                        onChange: updatePreview,
                        onSelect: updatePreview,
                        aspectRatio: 1
                    }, function () {
                        // Use the API to get the real image size
                        var bounds = this.getBounds();
                        boundx = bounds[0];
                        boundy = bounds[1];
                        // Store the API in the jcrop_api variable
                        jcrop_api = this;
                    });

                }

            });
        });

        /*裁剪图片确定按钮的点击*/
        $('#yes').click(function(event) {
            var yesButton = $(this);
            event.preventDefault();
            $.ajax({
                url:"/korent/uploadHead.action",
                type:"post",
                data:$('#headForm').serialize()+"&myPhotoPath="+encodeURIComponent($('#preview').attr("src")),
                success:function(html){

                    yesButton.hide();
                    $('#uploadPhoto').show();
                    myJCrop.destroy();
                },
                error:function(){
                    alert('修改失败,请检查网络!')
                }

            })

        });
    });

</script>

</html>
