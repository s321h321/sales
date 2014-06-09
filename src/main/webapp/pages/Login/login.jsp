<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>销售业绩系统登录界面</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${pageContext.request.contextPath}/js/jquery/jquery-1.8.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/sales/cloud.js" type="text/javascript"></script>
<script language="javascript">
	$(function() {
		$('.loginbox').css({
			'position' : 'absolute',
			'left' : ($(window).width() - 692) / 2
		});
		$(window).resize(function() {
			$('.loginbox').css({
				'position' : 'absolute',
				'left' : ($(window).width() - 692) / 2
			});
		})
	});
</script>

</head>

<body
	style="background-color: #1c77ac; background-image: url(images/light.png); background-repeat: no-repeat; background-position: center top; overflow: hidden;">



	<div id="mainBody">
		<div id="cloud1" class="cloud"></div>
		<div id="cloud2" class="cloud"></div>
	</div>


	<div class="logintop">
		<span>欢迎登录后台管理界面平台</span>
		<ul>
			<li><a href="#">回首页</a></li>
			<li><a href="#">帮助</a></li>
			<li><a href="#">关于</a></li>
		</ul>
	</div>

	<div class="loginbody">

		<span class="systemlogo"></span>

		<div class="loginbox">
		<form action="${pageContext.request.contextPath}/login.html" method="post">
			<ul>
				<li><input name="username" type="text" class="loginuser" value="帐号"
					onclick="JavaScript:this.value=''" /></li>
				<li><input name="password" type="password" class="loginpwd" value="密码"
					onclick="JavaScript:this.value=''" /></li>
				<li><input name="" type="submit" class="loginbtn" value="登录"/><label><input
						name="" type="checkbox" value="" checked="checked" />记住密码</label><label><a
						href="#">忘记密码？</a></label></li>
			</ul>

</form>
		</div>

	</div>



	<div class="loginbm">
		版权所有 2014 <a href="http://www.qf580.com">qf580.com</a>
	</div>


</body>
</html>