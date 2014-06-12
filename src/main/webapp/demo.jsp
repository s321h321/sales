<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>test</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/jquery-ui-1.9.2.custom.css" />
<!-- Le styles -->
<link
	href="${pageContext.request.contextPath}/css/common/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css"
	href="${pageContext.request.contextPath}/css/common/font-awesome.min.css"
	rel="stylesheet" />
<!--[if IE 7]>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/font-awesome-ie7.min.css">
            <![endif]-->
<!--[if lt IE 9]>
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/jquery.ui.1.10.0.ie.css"/>
            <![endif]-->
<link href="${pageContext.request.contextPath}/css/common/docs.css"
	rel="stylesheet">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
            <![endif]-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery/jquery-1.8.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/common/jquery-ui-1.9.2.custom.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/common/bootstrap.min.js"></script>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#modal_link").click(function() {
				$('#adduser').dialog('open');
				return false;
			});
			$("#btclose").click(function(){
				$('#adduser').dialog('close');
				return true;
			});
			$('#adduser').dialog({
				autoOpen : false,
				modal : true,
				draggable : false,
				width : 500,
				title: "添加用户" 
			});
			$("#btsave").click(function(){
				$('#adduser').dialog('close');
				htmlobj=$.ajax({url:'${pageContext.request.contextPath}/adduser.html?name='+$("#name").val()+'&username='+$("#username").val()+'&password='+$("#password").val()});
				alert($.parseJSON(htmlobj));
				return true;
			});
		});
	</script>
	<a id="modal_link" class="ui-state-default ui-corner-all" href="#">
		<span class="ui-icon ui-icon-newwin"></span> 打开模态对话框
	</a>
	<div id="adduser" style="display: none;" align="center" >
		<table>
				<tr>
					<td>用户姓名：</td>
					<td><input id="name" type="text" value="真实姓名" /></td>
				</tr>
				<tr>
					<td>登录帐号：</td>
					<td><input id="username" type="text" value="登录帐号" //></td>
				</tr>
				<tr>
					<td>登录密码：</td>
					<td><input id="password" type="password" value="" //></td>
				</tr>
				<tr>
					<td >
					<button id="btsave" class="ui-button-primary ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" >保存用户</button>
					</td>
					<td>
					<button id ="btclose"class="ui-button-primary ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" >关闭窗口</button>
					</td>
				</tr>
		</table>
	</div>
</body>
</html>