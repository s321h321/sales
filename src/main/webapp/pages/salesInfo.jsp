<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>销售数据柱状图</title>
<script language='javascript'
	src='${pageContext.request.contextPath}/js/common/esl.js'></script>
<script language='javascript'
	src='${pageContext.request.contextPath}/js/jquery/jquery-1.10.2.min.js'></script>
</head>
<body>
	<div id="main"
		style="height: 500px; border: 1px solid #ccc; padding: 10px;"></div>
	<script type="text/javascript">
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
				} ],
				yAxis : [ {
					type : 'value',
					splitArea : {
						show : true
					}
				} ],
				series : [ {
					name : '销售业绩',
					type : 'bar',
					data : salearr,
					itemStyle : {
						normal : { // 系列级个性化，横向渐变填充
							borderRadius : 5,
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
