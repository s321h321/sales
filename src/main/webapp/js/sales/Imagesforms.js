$(document).ready(function() {
					$("#modal_link").click(
							function() {
								$('#adduser').dialog('open');
								$("#addsales").find(':input').not(
										':button, :submit, :reset').val('')
										.removeAttr('checked').removeAttr(
												'selected');
								return false;
							});

					$("#addsale_link").click(
							function() {
								$('#addsales').dialog('open');
								$("#addsales").find(':input').not(
										':button, :submit, :reset').val('')
										.removeAttr('checked').removeAttr(
												'selected');
								return false;
							});

					$("#btcloseSales").click(
							function() {
								$("#addsales").find(':input').not(
										':button, :submit, :reset').val('')
										.removeAttr('checked').removeAttr(
												'selected');
								$('#addsales').dialog('close');
								return false;
							});
					$("#btclose").click(
							function() {
								$("#addsales").find(':input').not(
										':button, :submit, :reset').val('')
										.removeAttr('checked').removeAttr(
												'selected');
								$('#adduser').dialog('close');
								return false;
							});
					$('#adduser').dialog({
						autoOpen : false,
						modal : true,
						draggable : false,
						width : 500,
						title : "添加用户"
					});
					$('#addsales').dialog({
						autoOpen : false,
						modal : true,
						draggable : false,
						width : 500,
						title : "添加业绩信息"
					});
					$('#main').dialog({
						autoOpen : false,
						modal : true,
						draggable : false,
						width : 900,
						height : 600,
						title : "销售业绩柱状图"
					});
					$('#saletime').datepicker(
							{
								dateFormat : "yy-mm-dd",
								currentText : "Now",
								monthNames : [ '1月', '2月', '3月', '4月', '5月',
										'6月', '7月', '8月', '9月', '10月', '11月',
										'12月', ],
								dayNamesMin : [ '日', '一', '二', '三', '四', '五',
										'六' ]

							});
					$("#saletime").click(function() {
						$('#saletime').datepicker({
							dateFormat : "yy-mm-dd",
							currentText : "Now"
						});
					});
					function showsales(namearr, salearr) {
						require.config({
							paths : {
								echarts : path + '/js/common/echarts'
							}
						});
						require(
								[ 'echarts', 'echarts/chart/bar' ],
								function(ec) {
									var myChart = ec.init(document
											.getElementById('main'));
									myChart
											.setOption({
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
															type : [ 'bar',
																	'line',
																	'stack',
																	'tiled' ]
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
																return zrColor
																		.getLinearGradient(
																				0,
																				0,
																				1000,
																				0,
																				[ [
																						0,
																						'rgba(30,144,255,0.8)' ] ])
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
					}
					;
					$("#seesales").click(function() {
						$('#main').dialog('open');
						$.ajax({
							cache : "true",
							type : "POST",
							url : path + "/getsales.html",
							async : false,
							dataType : "json",
							error : function(request) {
								alert("获取报表数据失败！！！");
							},
							success : function(data) {
								var dataset = $.parseJSON(data);
								var namearr = new Array();
								var salearr = new Array();
								for (i = 0; i < dataset.length; i++) {
									namearr[i] = dataset[i].name;
									salearr[i] = dataset[i].sale;
								}
								showsales(namearr, salearr);
							}
						});
						return false;
					});
					$("#uid").click(
							function() {
								if ($("#uid").children().length > 1) {
									return false;
								}
								$.ajax({
									type : "POST",
									url : path + "/getIdAndNames.html",
									data : $('#addsales').serialize(),
									async : false,
									dataType : "json",
									error : function(request) {
										alert("获取用户列表！！！");
									},
									success : function(data) {
										var selObj = $("#uid");
										var data = $.parseJSON(data);
										var str = '';
										for (i = 0; i < data.length; i++) {
											selObj.append('<option value='
													+ data[i].id + '>'
													+ data[i].name
													+ '</option>');
										}
									}
								});
							});
					$("#btsave").click(function() {
						$.ajax({
							type : "POST",
							url : path + "/adduser.html",
							data : $('#addusers').serialize(),
							async : false,
							dataType : "json",
							error : function(request) {
								alert("添加用户信息失败！！！");
							},
							success : function(data) {
								alert(data);
							}
						});
						$(':input', '#addusers');
						$('#adduser').dialog('close');
						// return false;
					});
				});