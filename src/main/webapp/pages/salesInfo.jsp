<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>销售数据柱状图</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/jquery-ui-1.10.4.custom.min.css" />
<script language='javascript'
	src='${pageContext.request.contextPath}/js/common/esl.js'></script>
<script language='javascript'
	src='${pageContext.request.contextPath}/js/jquery/jquery-1.8.3.min.js'></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/common/jquery.ui.core.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/common/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/common/jquery.ui.datepicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/common/jquery.ui.widget.js"></script>

</head>
<body >
	<div id="addsales" style="display: none;" >
		<form action="${pageContext.request.contextPath}/sales/add.html"
			method="post">
			选择用户： <select id="uid" name="uid">
				<option value="-1" selected="selected">请选择销售人员</option>
				<c:forEach var="list" items="${requestScope.ids}">
					<option value='${list.id}'>${list.name}</option>
				</c:forEach>
			</select> 录入销售金额：<input name="money" type="text" /> 选择日期：<input type="text"
				name="saletime" readonly="readonly" id="choicedate" /> <input
				type="submit" value="添加销售数据" /> <input type="button" value="添加用户"
				onclick="showadduser();" />
				<a href="${pageContext.request.contextPath}/login.html">返回登录</a>
		</form>
	</div>
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
	<div id="main"
		style="height: 500px; border: 1px solid #ccc; padding: 10px;"></div>
	<script type="text/javascript">
		var user = "${sessionScope.user}";
		if (user =="caiyanting") {
			$("#addsales").show();
		};
		function showadduser() {
			$("#adduser").show();
		};
		function usercacel() {
			$("#adduser").hide();
		};
		$('#choicedate')
				.datepicker(
						{
							closeText : '关闭',
							prevText : '<上月',  
		            nextText: '下月>',
							currentText : '今天',
							monthNames : [ '一月', '二月', '三月', '四月', '五月', '六月',
									'七月', '八月', '九月', '十月', '十一月', '十二月' ],
							dayNames : [ '星期日', '星期一', '星期二', '星期三', '星期四',
									'星期五', '星期六' ],
							dayNamesShort : [ '周日', '周一', '周二', '周三', '周四',
									'周五', '周六' ],
							dayNamesMin : [ '日', '一', '二', '三', '四', '五', '六' ],
							weekHeader : '周',
							dateFormat : 'yy-mm-dd',
							firstDay : 1,
							isRTL : false,
							showMonthAfterYear : true
						});
		var jsonstr = '${requestScope.salesInfo}';
		var dataset = $.parseJSON(jsonstr);
		var namearr = new Array();
		var salearr = new Array();
		for (i = 0; i < dataset.length; i++) {
			namearr[i] = dataset[i].name;
			salearr[i] = dataset[i].sale;
		}
		require
				.config({
					paths : {
						echarts : '${pageContext.request.contextPath}/js/common/echarts'
					}
				});
		require([ 'echarts', 'echarts/chart/bar', ], function(ec) {
			var myChart = ec.init(document.getElementById('main'));
			myChart.setOption({
				tooltip : {
					trigger : 'axis',
					show : true

				},
				legend : {
					data : [ '销售业绩' ]
				},
				toolbox : {
					show : true,
					feature : {

						magicType : {
							show : true,
							type : [ 'bar', 'line', 'stack', 'tiled' ]
						},
						saveAsImage : {
							show : true
						}
					}
				},
				calculable : false,
				xAxis : [ {
					type : 'category',
					data : namearr,
					axisLine : false,
					splitLine : false

				} ],
				yAxis : [ {
					type : 'value',
					splitArea : {
						show : true
					},
					axisLine : false,
					splitLine : false
				} ],
				series : [ {
					name : '销售业绩',
					type : 'bar',
					barWidth : 40,
					data : salearr,
					itemStyle : {
						normal : { // 系列级个性化，横向渐变填充
							borderRadius : 5,
							color : (function() {
								var zrColor = require('zrender/tool/color');
								return zrColor.getLinearGradient(0, 0, 1000, 0,
										[ [ 0, 'rgba(30,144,255,0.8)' ] ])
							})(),
							label : {
								show : true,
								textStyle : {
									fontSize : '20',
									fontFamily : '微软雅黑',
									fontWeight : 'bold'
								}
							}
						}
					}
				} ]
			});

		})
	</script>
</body>
</html>
