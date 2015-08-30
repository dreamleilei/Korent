<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="Content-Language" content="zh-cn" />
	<link rel="stylesheet" href="/resource/css/regist.css" type="text/css" />
</head>

<body>
<div id="header">
<h1>注册通行证</h1>
</div>
<div id="line"></div>

<div id="content">
<br/>
<form action="/korent/register.action"  method="post"><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户名: 
<input type="text" name="username" /><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手机号: 
<input type="tel" name="phone"  id="phone" onKeyUp="checkphone()"/><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码: 
<input type="password" name="password" /><br/><br/>
<span class="prompt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp6-18位，区分大小写,字母、数字、特殊符号中的两种或两种以上</span></p>
再次输入密码: 
<input type="password" name="passwordAgain" /><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QQ号: 
<input type="text" name="qq"  id="qq"  onKeyUp="checkqq()"/><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email: 
<input type="email" name="email" id="Email" onKeyUp="checkEmail()" /><br/><br/>
<input type="checkbox" name="protocol" />
我已阅读并接受《用户服务协议》<br />
<br/>
<input type="submit" value="确认" onClick="" style="width:100px; height:30px; " class="queren"/>
</form>
</div>
<div id="menu">
<dr/><dr/>
<h4>注册成为“酷租网”的用户后，您可以：</h4>
<ul>
  <li><span class="red">浏览</span>网站显示的租品信息</li>
  <br/>
  <li><span class="red">发布</span>您心爱租品的具体信息，以方便其他用户预订</li>
  <br/>
  <li>成功预订后您可以联系到租主进行商议</li>
  <br/>
  <li><span class="red">查询</span>您想要租赁的物品</li>
  <br/>
  <li><span class="red">管理</span>您的个人信息</li>
  <br/>
  <li><span class="red">收藏</span>您心仪的租品</li>
</ul>
</div>
<body onload="show()">
    <center>
<div id="footer" style="color:#000000">酷租网  Korent</div>
 </center>
</body>



</body>
<script type="text/javascript">
	function show() {
		footer.style.visibility = (footer.style.visibility == "hidden") ? "visible" : "hidden";
		setTimeout("show()", 400);
	}
	function checkEmail(){
		var ENumber = document.getElementById('Email').value;
		var show = document.getElementById('Email');
		var pattern =  /^\w+[@]\w+[.]\w+$/g;
		if(pattern.test(ENumber)){
			show.style.borderColor = 'green';
			show.style.borderStyle = 'solid';
			show.style.borderWidth = 1;
		}
		else{
			show.style.borderColor = 'red';
			show.style.borderStyle = 'solid';
			show.style.borderWidth = 1;
		}
	}

	function checkqq(){
		var ENumber = document.getElementById('qq').value;
		var show = document.getElementById('qq');
		var pattern =  /^[0-9]+$/g;
		if(pattern.test(ENumber)){
			show.style.borderColor = 'green';
			show.style.borderStyle = 'solid';
			show.style.borderWidth = 1;
		}
		else{
			show.style.borderColor = 'red';
			show.style.borderStyle = 'solid';
			show.style.borderWidth = 1;
		}
	}

	function checkphone(){
		var ENumber = document.getElementById('phone').value;
		var show = document.getElementById('phone');
		var pattern =  /^1[0-9]{10}$/g;
		if(pattern.test(ENumber)){
			show.style.borderColor = 'green';
			show.style.borderStyle = 'solid';
			show.style.borderWidth = 1;
		}
		else{
			show.style.borderColor = 'red';
			show.style.borderStyle = 'solid';
			show.style.borderWidth = 1;
		}
	}
</script>
</html>
