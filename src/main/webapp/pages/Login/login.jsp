<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>销售业绩系统登录界面</title>
</head>
<body>
	<div align="center">
	<form action="${pageContext.request.contextPath}/login.html" method="post">
	用户名：<input type="text" name="username" text="请输入用户名"/><br/>
	密     码:<input type="password" name="password" text="请输入密码"/><br/>
	<input type="submit"  name="loginSubmit" value="登录系统"/>
	<input type="reset"  name="loginreset" value="重 置"/>
	</form>
	</div>
</body>
</html>