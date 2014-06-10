<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>test</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/popModal.min.css" />
<script language='javascript'
	src='${pageContext.request.contextPath}/js/common/popModal.js'></script>
	<script language='javascript'
	src='${pageContext.request.contextPath}/js/jquery/jquery-1.11.1.min.js'></script>

</head>
<body>
	<button id="adduser" data-dialogModalBind="adduser">Example</button>
	<script language="javascript">
		$('#adduser').dialogModal({});
	</script>
	<div id="adduser" style="display: none;">
		<table>
			<form action="${pageContext.request.contextPath}/adduser.html"
				method="post">
				<tr>
					<td>用户姓名：</td>
					<td><input name="name" type="text" /></td>
				</tr>
				<tr>
					<td>登录帐号：</td>
					<td><input name="username" type="text" /></td>
				</tr>
				<tr>
					<td>登录密码：</td>
					<td><input name="password" type="password" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="添加用户" /></td>
					<td><input type="button" value="取消" onclick="usercacel();" /></td>
				</tr>

			</form>
		</table>
	</div>
</body>
</html>