<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>销售数据柱状图</title>
<script language='javascript'
	src='${pageContext.request.contextPath}/js/common/esl.js'></script>
<script language='javascript'
	src='${pageContext.request.contextPath}/js/jquery/jquery-1.8.3.min.js'></script>
</head>
<body>
	<a href="${pageContext.request.contextPath}/login.html?username=out">返回登录</a>
	<div id="main"
		style="height: 500px; border: 1px solid #ccc; padding: 10px;"></div>
	<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
	        cache: "true",
	        type: "POST",
	        url: "${pageContext.request.contextPath}/getsales.html",
	        async: false,
	        dataType: "json",
	        error: function(request){
	            alert("获取报表数据失败！！！");
	        },
	        success: function(data){
	            var dataset = $.parseJSON(data);
	            var namearr = new Array();
	            var salearr = new Array();
	            for (i = 0; i < dataset.length; i++) {
	                namearr[i] = dataset[i].name;
	                salearr[i] = dataset[i].sale;
	            }
			showsales(namearr,salearr);
	        }
	    });
	});
    
    function showsales(namearr, salearr){
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
    });};		

	</script>
</body>
</html>
