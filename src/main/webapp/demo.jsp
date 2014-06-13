<%@ page contentType="text/html;charset=UTF-8" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>test</title>
        <%@ include file="/pages/common.jsp"%>
        <link rel="stylesheet" type="text/css" href="${path}/css/common/jquery-ui-1.9.2.custom.css" />
        <!-- Le styles -->
        <link href="${path}/css/common/bootstrap.min.css" rel="stylesheet">
        <link type="text/css" href="${path}/css/common/font-awesome.min.css" rel="stylesheet" />
        <!--[if IE 7]>
            <link rel="stylesheet" href="${path}/css/common/font-awesome-ie7.min.css">
        <![endif]-->
        <!--[if lt IE 9]>
            <link rel="stylesheet" type="text/css" href="${path}/css/common/jquery.ui.1.10.0.ie.css"/>
        <![endif]-->
        <link href="${path}/css/common/docs.css" rel="stylesheet"/>
        <script type="text/javascript" src="${path}/js/jquery/jquery-1.8.3.min.js"></script>
        <script type="text/javascript" src="${path}/js/common/jquery-ui-1.9.2.custom.min.js"></script>
        <script type="text/javascript" src="${path}/js/common/bootstrap.min.js"></script>
        <script type="text/javascript" src='${path}/js/common/esl.js'></script>
        <script type="text/javascript" src='${path}/js/sales/Imagesforms.js'></script>
        <body>
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
                    <form id="addsales" method="post" action="${path}/sales/add.html">
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
