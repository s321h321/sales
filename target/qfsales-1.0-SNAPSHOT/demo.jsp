<%@ page contentType="text/html;charset=UTF-8" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>test</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/jquery-ui-1.9.2.custom.css" />
        <!-- Le styles -->
        <link href="${pageContext.request.contextPath}/css/common/bootstrap.min.css" rel="stylesheet">
        <link type="text/css" href="${pageContext.request.contextPath}/css/common/font-awesome.min.css" rel="stylesheet" />
        <!--[if IE 7]>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/font-awesome-ie7.min.css">
        <![endif]-->
        <!--[if lt IE 9]>
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/jquery.ui.1.10.0.ie.css"/>
        <![endif]-->
        <link href="${pageContext.request.contextPath}/css/common/docs.css" rel="stylesheet">
        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-1.8.3.min.js">
        </script>
        <script src="${pageContext.request.contextPath}/js/common/jquery-ui-1.9.2.custom.min.js">
        </script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/bootstrap.min.js">
        </script>
        <script language='javascript'src='${pageContext.request.contextPath}/js/common/esl.js'>
        </script>
        <body>
            <script type="text/javascript">
                $(document).ready(function(){
                    $("#modal_link").click(function(){
                        $('#adduser').dialog('open');
						 $("#addsales").find(':input').not(':button, :submit, :reset').val('').removeAttr('checked').removeAttr('selected');
                        return false;
                    });
                    
                    $("#addsale_link").click(function(){
                        $('#addsales').dialog('open');
						 $("#addsales").find(':input').not(':button, :submit, :reset').val('').removeAttr('checked').removeAttr('selected');
                        return false;
                    });
                    
                    $("#btcloseSales").click(function(){
                        $("#addsales").find(':input').not(':button, :submit, :reset').val('').removeAttr('checked').removeAttr('selected');
                        $('#addsales').dialog('close');
                        return false;
                    });
                    $("#btclose").click(function(){
						 $("#addsales").find(':input').not(':button, :submit, :reset').val('').removeAttr('checked').removeAttr('selected');
                        $('#adduser').dialog('close');
                        return false;
                    });
                    $('#adduser').dialog({
                        autoOpen: false,
                        modal: true,
                        draggable: false,
                        width: 500,
                        title: "添加用户"
                    });
                    $('#addsales').dialog({
                        autoOpen: false,
                        modal: true,
                        draggable: false,
                        width: 500,
                        title: "添加业绩信息"
                    });
					 $('#main').dialog({
                        autoOpen: false,
                        modal: true,
                        draggable: false,
                        width: 900,
						height:600,
                        title: "销售业绩柱状图"
                    });
                    $('#saletime').datepicker({
                        dateFormat: "yy-mm-dd",
                        currentText: "Now",
                        monthNames: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月', ],
                        dayNamesMin: ['日', '一', '二', '三', '四', '五', '六']
                    
                    });
                    $("#saletime").click(function(){
                        $('#saletime').datepicker({
                            dateFormat: "yy-mm-dd",
                            currentText: "Now"
                        });
                    });
                    function showsales(namearr, salearr){
                        require.config({
                            paths: {
                                echarts: '${pageContext.request.contextPath}/js/common/echarts'
                            }
                        });
                        require(['echarts', 'echarts/chart/bar', ], function(ec){
                            var myChart = ec.init(document.getElementById('main'));
                            myChart.setOption({
                                tooltip: {
                                    trigger: 'axis',
                                    show: true
                                
                                },
                                legend: {
                                    data: ['销售业绩']
                                },
                                toolbox: {
                                    show: true,
                                    feature: {
                                    
                                        magicType: {
                                            show: true,
                                            type: ['bar', 'line', 'stack', 'tiled']
                                        },
                                        saveAsImage: {
                                            show: true
                                        }
                                    }
                                },
                                calculable: false,
                                xAxis: [{
                                    type: 'category',
                                    data: namearr,
                                    axisLine: false,
                                    splitLine: false
                                
                                }],
                                yAxis: [{
                                    type: 'value',
                                    splitArea: {
                                        show: true
                                    },
                                    axisLine: false,
                                    splitLine: false
                                }],
                                series: [{
                                    name: '销售业绩',
                                    type: 'bar',
                                    barWidth: 40,
                                    data: salearr,
                                    itemStyle: {
                                        normal: { // 系列级个性化，横向渐变填充
                                            borderRadius: 5,
                                            color: (function(){
                                                var zrColor = require('zrender/tool/color');
                                                return zrColor.getLinearGradient(0, 0, 1000, 0, [[0, 'rgba(30,144,255,0.8)']])
                                            })(),
                                            label: {
                                                show: true,
                                                textStyle: {
                                                    fontSize: '20',
                                                    fontFamily: '微软雅黑',
                                                    fontWeight: 'bold'
                                                }
                                            }
                                        }
                                    }
                                }]
                            });
                            
                        })
                    };
                    $("#seesales").click(function(){
						 $('#main').dialog('open');
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
						 return false;
                    });
                    $("#uid").click(function(){
                        if ($("#uid").children().length > 1) {
                            return false;
                        }
                        $.ajax({
                            type: "POST",
                            url: "${pageContext.request.contextPath}/getIdAndNames.html",
                            data: $('#addsales').serialize(),
                            async: false,
                            dataType: "json",
                            error: function(request){
                                alert("获取用户列表！！！");
                            },
                            success: function(data){
                                var selObj = $("#uid");
                                var data = $.parseJSON(data);
                                var str = '';
                                for (i = 0; i < data.length; i++) {
                                    selObj.append('<option value=' + data[i].id + '>' + data[i].name + '</option>');
                                }
                            }
                        });
                    });
                    $("#btsave").click(function(){
                        $.ajax({
                            type: "POST",
                            url: "${pageContext.request.contextPath}/adduser.html",
                            data: $('#addusers').serialize(),
                            async: false,
                            dataType: "json",
                            error: function(request){
                                alert("添加用户信息失败！！！");
                            },
                            success: function(data){
                                alert(data);
                            }
                        });
                        $(':input', '#addusers');
                        $('#adduser').dialog('close');
                        // return false;
                    });
                });
            </script>
            <a id="modal_link" class="ui-state-default ui-corner-all" href="#"><span class="ui-icon ui-icon-newwin"></span>添加用户信息</a>
            <a id="addsale_link" class="ui-button-primary ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" href="#">添加业绩信息</a>
            <input id="seesales" class="ui-button-primary ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"type="button" value="查看报表数据" />
            <div id="adduser" style="display: none;" align="center">
                <form id="addusers">
                    <table>
                        <tr>
                            <td>
                                用户姓名：
                            </td>
                            <td>
                                <input id="name" name="name" type="text" value="" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                登录帐号：
                            </td>
                            <td>
                                <input id="username" name="username" type="text" value="" //>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                登录密码：
                            </td>
                            <td>
                                <input id="password" name="password"type="password" value="" //>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <button id="btsave" class="ui-button-primary ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">
                                    保存用户
                                </button>
                            </td>
                            <td>
                                <button id ="btclose"class="ui-button-primary ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">
                                    关闭窗口
                                </button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div id="addsales" style="display: none;">
                <table>
                    <form id="addsales" method="post" action="${pageContext.request.contextPath}/sales/add.html">
                        <tr>
                            <td>
                                选择用户： 
                            </td>
                            <td>
                                <select id="uid" name="uid">
                                    <option value="-1" selected="selected">请选择销售人员</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                录入销售金额：
                            </td>
                            <td>
                                <input name="money" type="text" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                选择日期：
                            </td>
                            <td>
                                <input id="saletime" type="text" name="saletime" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input class="ui-button-primary ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"type="submit" value="添加销售数据" />
                            </td>
                            <td>
                                <input id="btcloseSales" class="ui-button-primary ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"type="button" value="关  闭" />
                            </td>
                        </tr>
                    </form>
                </table>
            </div>
            <div id="main" style="height: 500px; border: 1px solid #ccc; padding: 5px;">
            </div>
        </body>
        </html>
