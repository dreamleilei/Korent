<%--
  Created by IntelliJ IDEA.
  User: lei
  Date: 15-9-4
  Time: 下午4:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
 <%-- <meta http-equiv="Content测试用户1-Type" content="text/html; charset=UTF-8" />--%>
  <title>管理用户</title>
  <link href="bootstrap.css" rel="text/css" />
  <link href="/resource/css/admin.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="/resource/js/jquery-2.1.1.js" >
  </script>
     <link href="/resource/css/jNotify.jquery.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="/resource/js/jNotify.jquery.js" ></script>
     <script type="text/javascript" src="/resource/js/operateTip.js" > </script>
</head>

<body>
<%@ include file="/adminModel.jsp" %>
<div id="chara">
  <div id="usermessage">用户信息<hr /></div>
  <div style="margin-top:60px;">
    <style type="text/css">
      .tablebox{border:solid 1px #ddd;}
      .tablebox td{text-align:center;border:solid 1px #ddd;padding:5px;}
    </style>

    <div style="width:860px; height:461px">
      <table class="tablebox" width="860" cellspacing="0" style="float:left;">
        <tbody id="table2">
        <tr id="">
          <td width="110" style="text-align:center">用户编号</td>
          <td width="160">用户名</td>
          <td width="250">邮箱</td>
          <td width="250">电话</td>
          <td width="90">操作</td>
        </tr>
        </tbody>
      </table>
    </div>
    <div id= "spanPage" style="height:30px; margin-top:10px; text-align:center;">
      <a><span id="spanFirst">第一页</span></a>
      <a ><span id="spanPre">上一页</span></a>
      <span id="add"> </span>
      <span>第&nbsp;<input type="text" style="width:30px"/>&nbsp;页<input type="button" value="跳转" id ="searchButton" style="font-size:18px; color:blue"/></span>
      <a><span id="spanNext">下一页</span></a>
      <a><span id="spanLast">最后一页</span></a>
      第
      <span id="spanPageNum"></span>
      页/共
      <span id="spanTotalPage"></span>
      页
    </div>

  </div>



</div>

<%--<s:debug />--%>
</body>
<script type="text/javascript" charset="UTF-8">

  function createPage(pageModel) {
    var model = "";
    for (var i = 1; i <= pageModel.pageCount; i++) {
      model += "<a href=\"/adminOperate.jsp?pageNo=" + i + "\&pageSize=10\" ><span>" + i + "&nbsp;&nbsp;</span></a>";
    }

    $('#spanFirst').parent().attr("href", "/adminOperate.jsp?pageNo=1&page?Size=10");
    $('#spanLast').parent().attr("href", "/adminOperate.jsp?pageNo=" + pageModel.pageCount + "&page?Size=10");
    $('#spanNext').parent().attr("href", "/adminOperate.jsp?pageNo=" + (pageModel.pageNo + 1 ) +"&page?Size=10");
    $('#spanPre').parent().attr("href", "/adminOperate.jsp?pageNo=" + (pageModel.pageNo - 1 ) +"&page?Size=10");
    $('#add').append(model);
    $('#spanPageNum').text(pageModel.pageNo);
    $('#spanTotalPage').text(pageModel.pageCount);
    if(pageModel.pageNo == 1){
      $('#spanPre').parent().hide();
    }
    if(pageModel.pageNo == pageModel.pageCount){
      $('#spanNext').parent().hide();
    }
    if(pageModel.pageCount == 1){
      $('#spanPage').hide();
    }
  }

  function createTable( table_array){
    var row ="";
    for(var key in table_array){
       row += "<tr>" +
              "<td>" + (table_array[key].id == undefined ? "": table_array[key].id) + "</td>" +
              "<td>" + (table_array[key].name == undefined ? "": table_array[key].name)+"</td>" +
              "<td>" + (table_array[key].email == undefined ? "": table_array[key].email) + "</td>" +
              "<td>" + (table_array[key].phone == undefined ? "": table_array[key].phone)+ "</td>"+
              "<td><input type\=\"button\" value\=\"\删除\" class=\"delete\"/></td>"
       +"</tr>";
    }
    $('#table2').append(row);
  }

  //{"pageNo":1,"pageSize":10,"pageCount":1,"dataCount":7}

  $(document).ready(function(){

    $('#searchButton').click(function(){
    });

   $.ajax({
      url:"/admin/getUser.action",
      type:"get",
      data:window.location.search.replace("?", ""),

       success:function(html){
        var obj = JSON.parse(html);
        createTable(obj.user);
        createPage(obj.pageModel);

        $('input:button[value="删除"]').click(function(event){
            var button = $(this);
          var id = $(this).parent().parent().children().eq(0).text();
          var thisRow = $(this).parent().parent();
          $.ajax({
            url:"/admin/deleteUser.action",
            type:"post",
            data:"uid="+encodeURIComponent(id),
            success:function(html){
              thisRow.remove();
                operateSuccessTip(button);

            },
            error:function(){
                operateErrorTip();
              alert('网络错误,请您重试');

            }

          })
        });

      },
      error:function(){
        alert('网络连接超时,请检查网络');
      }
    });

  });
</script>
</html>
