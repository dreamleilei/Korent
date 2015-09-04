<%--
  Created by IntelliJ IDEA.
  User: lei
  Date: 15-9-4
  Time: 下午4:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
  <title>管理用户</title>
  <link href="bootstrap.css" rel="text/css" />
  <link href="./resource/css/admin.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="./resource/js/jquery-2.1.1.js" >
  </script>
</head>

<body>
<div id="container">

  <div id="header">
    <div id="header0">
      <img src="resource/image/logo5.png" height="100" width="200" />
    </div>
    <div id="username"><span>沉淀着梦</span>
      <span>退出</span>
    </div>
  </div>



  <div id="message">
    <div id="menu">
      <ul>
        <li><a href="管理用户.html" class="href2">管理用户</a></li><p></p>
        <li><a href="管理租品.html" class="href2">管理租品</a></li>
      </ul>
    </div>

    <div id="goodsplay">
    </div>

  </div>
</div>

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
    <div style="height:30px; margin-top:10px; text-align:center;">
      <span id="spanFirst">第一页</span>
      <span id="spanPre">上一页</span>
      <span>1</span>
      <span>2</span>
      <span>3</span>
      <span>4</span>
      <span>第<input type="text" style="width:15px" value="2"/>页<input type="button" value="跳转" style="font-size:18px;"/></span>
      <span id="spanNext">下一页</span>
      <span id="spanLast">最后一页</span>
      第
      <span id="spanPageNum"></span>
      页/共
      <span id="spanTotalPage"></span>
      页
    </div>

  </div>



</div>


</body>
<script type="text/javascript">

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

  $(document).ready(function(){
    $.ajax({
      url:"/admin/getUser.action",
      type:"get",
      data:encodeURIComponent("pageNo=1&pageSize=10"),
    //  "{"pageModel":{"pageNo":1,"pageSize":10,"pageCount":1,"dataCount":7},"user":[{"name":"leilei1","email":"1679211339@qq.com"},{"name":"leilei2","phone":"18829291277","email":"234234","qq":"1679211330"},{"name":"leilei3","phone":"188292921341","email":"1679211339@qq.com","qq":"16792113399"},{"name":"leilei4","email":"1679211339@qq.com"},{"name":"leilei5","email":"1679211339@qq.com"},{"name":"leilei6","email":"1679211339@qq.com"},{"name":"sunlei","phone":"18829291276","email":"1679211339@qq.com","qq":"1679211339"}]}"
      success:function(html){

        var obj = JSON.parse(html);
        createTable(obj.user);

        $('input:button[value="删除"]').click(function(event){
          var id = $(this).parent().parent().children().eq(0).text();
          var thisRow = $(this).parent().parent();
          $.ajax({
            url:"/admin/deleteUser.action",
            type:"post",
            data:"uid="+encodeURIComponent(id),
            success:function(html){
              thisRow.remove();

            },
            error:function(){
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
