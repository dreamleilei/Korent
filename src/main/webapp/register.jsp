
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head lang="en">
	<meta charset="UTF-8">
	<meta http-equiv="Content-Language" content="zh-cn" />
	<link rel="stylesheet" href="/resource/css/regist.css" type="text/css" />
	<script type="text/javascript" src="/resource/js/jquery-1.6.1.min.js" ></script>
	<title></title>
</head>
<body onload="show()">
<div id="header">
	<h1>注册通行证</h1>
</div>
<div id="line"></div>

<div id="content">
	<br/>
	<s:action name="getUserList" namespace="/korent" var="userList">
	</s:action>

	<s:form  action="register" namespace="/korent" method="post"><br/><br/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户名:
		<input type="text" name="username" id="username"/>
		<span class="error" id="username_format_error"><br />用户名不合法只允许汉字,数字,字母和下划线</span>
		<span class="error" id="username_length_error"><br />用户名长度不合法(4-16个字符)</span>
		<span class ="message" id="username_message" ><br/>该用户名已经存在,请选择其它用户名</span>
		<br/><br/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手机号:
		<input type="tel" name="phone"  id="phone" />
		<span id="phone_error" class="error"><br />请输入正确的手机号</span><br/><br/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;密码:
		<input type="password" name="password" id="password"/>
		<br/><br/>
		<span class="prompt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp6-18位，区分大小写,字母、数字、不包含空格</span>
		<span id = password_error class="error" ><br/>密码格式不正确,长度为6-18位,且不含空格</span></p>
		再次输入密码:
		<input type="password" name="passwordAgain" id="passwordAgain" />
        <span id="passwordAgain_error" class="error">
            <br />两次密码不一致</span><br/><br/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QQ号:
		<input type="text" name="qq"  id="qq"/>
		<span id ="qq_error" class="error"><br />请输入正确的qq号码</span><br/><br/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:
		<input type="email" name="email" id="email" />
		<span id="email_error" class="error"><br />请输入正确的邮箱格式</span><br/><br/>
		<input type="checkbox" name="protocol" id="protocol"/>
		我已阅读并接受《用户服务协议》
		<span id="message_show" class="message" ><br/>请按照相应的格式补全信息</span><br />
		<br/>
		<input id = "submit" type="submit" value="确认" onClick="" style="width:100px; height:30px; " class="queren"/>
		<span class="message" id="submit_message" >请确保用户名和密码都不为空</span>

	</s:form>
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

<center>
	<div id="footer" style="color:#000000">酷租网  Korent</div>
</center>
</body>
<script type="text/javascript" >

	function show() {
		footer.style.visibility = (footer.style.visibility == "hidden") ? "visible" : "hidden";
		setTimeout("show()", 400);
	}

	var  protocolValidate  = function() {
		/*  $('#submit').prop('disabled', true);*/
		{
			if ($('#protocol').is(':checked')) {
				$('#submit').prop('disabled', false);
			} else {
				$('#submit').prop('disabled', true);
			}
		}

	};
	var emailValidation =  function(){
		var email = $('#email').val();
		var emailPattern = new RegExp("\\b^[\'_a-z0-9-\\+]+(\\.[\'_a-z0-9-\\+]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*\\.([a-z]{2}|aero|arpa|asia|biz|com|coop|edu|gov|info|int|jobs|mil|mobi|museum|name|nato|net|org|pro|tel|travel|xxx)$\\b");
		if(!emailPattern.test(email)){
			$('#email_error').show();
			$(this).addClass('wrong');
			$(this).removeClass('correct');
		} else {
			$('#email_error').hide();
			$(this).addClass('correct');
			$(this).removeClass('wrong');
		}
	};

	var usernameValidation = function(){
		var username = $('#username').val();
		var userPattern =  /^([_\u4e00-\u9fa5a-zA-Z0-9]{4,16})$/g;
		var userList =<s:property value="#request.userList" escape="false" escapeHtml="false"/>;

		if(username.length < 4 || username.length >16){
			$('#username_length_error').show();
			$(this).addClass('wrong');
			$(this).removeClass('correct');

		} else {
			$('#username_length_error').hide();
			$(this).addClass('correct');
			$(this).removeClass('wrong');
		}
		if(!userPattern.test(username)){
			$('#username_format_error').show();
			$(this).addClass('wrong');
			$(this).removeClass('correct');

		} else {
			$('#username_format_error').hide();
			$(this).addClass('correct');
			$(this).removeClass('wrong');
		}

		if($.inArray(username, userList) == -1){
			$('#username_message').hide();
			$(this).addClass('correct');
			$(this).removeClass('wrong');
		} else{
			$('#username_message').show();
			$(this).addClass('wrong');
			$(this).removeClass('correct');

		}

	};

	var qqValidation = function(){
		var qq = $('#qq').val();
		var qqPattern =/^[1-9][0-9]{5,10}$/g;
		if(qq.length > 0) {
			if(!qqPattern.test(qq) ) {
				$('#qq_error').show();
				$(this).addClass('wrong');
				$(this).removeClass('correct');
			}
			else {
				$('#qq_error').hide();
				$(this).addClass('correct');
				$(this).removeClass('wrong');
			}
		}
	};

	var phoneValidation = function(){
		var phone = $('#phone').val();
		var phonePattern =  /^1[0-9]{10}$/g;
		if(phone.length >0) {
			if(!phonePattern.test(phone)){
				$('#phone_error').show();
				$(this).addClass('wrong');
				$(this).removeClass('correct');
			} else {
				$('#phone_error').hide();
				$(this).addClass('correct');
				$(this).removeClass('wrong');
			}
		}
	};

	var errorShow = function(){
		$('.error').each(function() {
			if (!$(this).is(':hidden')) {
				$('#submit').prop('disabled', true);
				$('#protocol').attr("checked", false);
				$('#message_show').show().delay(1500).hide(0);


			}
		})
	};

	var passwordValidate = function() {
		var password = $('#password').val();
		var passwordPattern = /^[^ ]{4,16}$/g;
		if(password.length < 6 || password.length >18){
			$('#password_error').show();
			$(this).addClass('wrong');
			$(this).removeClass('correct');

		} else {
			$('#password_error').hide();
			$(this).addClass('correct');
		}
		if(!passwordPattern.test(password)){
			$('#password_error').show();
			$(this).addClass('wrong');
			$(this).removeClass('correct');

		} else {
			$('#password_error').hide();
			$(this).addClass('correct');
			$(this).removeClass('wrong');
		}
	};

	var passwordAgainValidate = function() {
		var password  = $('#password').val();
		var passwordAgain = $('#passwordAgain').val();
		if(password != passwordAgain) {
			$('#passwordAgain_error').show();
			$(this).addClass('wrong');
			$(this).removeClass('correct');
		} else {
			$('#passwordAgain_error').hide();
			$(this).addClass('correct');
			$(this).removeClass('wrong');
		}
	};
	$(document).ready(function() {
		$('.error').hide();
		$(".message").hide();
		/*  $('#submit').prop('disabled', true);*

		 */

		$('#protocol').click(protocolValidate).click(errorShow);
		$('#username').keyup(usernameValidation);
		$('#email').keyup(emailValidation);
		$('#qq').keyup(qqValidation);
		$('#phone').keyup(phoneValidation);
		$('#password').keyup(passwordValidate);
		$('#passwordAgain').keyup(passwordAgainValidate);

		$('#submit').prop('disabled', true).click(function(event){
			var username = $('#username').val();
			var password = $('password').val();
			if(username.length < 1 || password.length <1){
				$('#submit_message').show().delay(3000).hide(0);
				$('#protocol').attr('checked', false);
				event.preventDefault();
			}
		});
	})
</script>
</html>