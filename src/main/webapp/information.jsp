<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>个人中心</title>
  <link href="bootstrap.css" rel="text/css" />
  <link href="/resource/css/information.css" rel="stylesheet" />
  <script type="text/javascript" src="/resource/js/jquery-1.6.1.min.js"> </script>
</head>

<body>
<s:action name="getInformation" namespace="/korent" />
<%@ include file="/model.jsp" %>
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
        <input id = "submit" name="submit" type="button"  class="save" onclick="" value="保存"/>
        <span class="message" ></span>
      </div>
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
    System.out.println(s);
    if(s == null){
    s = "\"ssss\"";
    }
    %>
    var otherInformation =  <%=s%>;
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
          $('.message').html('<br/> 信息保存成功!').show().delay(3000).hide(0);
        },
        error:function(){
          alert('修改失败,请检查网络!')
        }

      })
    })
  });

</script>
</html>
