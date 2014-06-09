<%@ page contentType="text/html;charset=utf-8"%>
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
<body>

	<form action="${pageContext.request.contextPath}/sales/add.html"
		method="post">
		选择用户： <select>
			<option>选择用户：</option>
			<option>王楠</option>
		</select> 录入销售金额：<input type="text" /> 选择日期：<input type="text"
			readonly="readonly" id="choicedate" /> <input type="submit"
			value="添加销售数据" />
	</form>
	<div id="main"
		style="height: 500px; border: 1px solid #ccc; padding: 10px;"></div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#choicedate').datepicker({
				 closeText: '关闭',  
		            prevText: '<上月',  
		            nextText: '下月>',  
		            currentText: '今天',  
		            monthNames: ['一月','二月','三月','四月','五月','六月',  
		            '七月','八月','九月','十月','十一月','十二月'],    
		            dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],  
		            dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'],  
		            dayNamesMin: ['日','一','二','三','四','五','六'],  
		            weekHeader: '周',  
		            dateFormat: 'yy-mm-dd',  
		            firstDay: 1,  
		            isRTL: false,  
		            showMonthAfterYear: true
			});
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
