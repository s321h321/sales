<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>test</title>
<%@ include file="/pages/common.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${path}/css/common/jquery-ui-1.9.2.custom.css" />
<!-- Le styles -->
<link href="${path}/css/common/bootstrap.min.css" rel="stylesheet">
<link type="text/css" href="${path}/css/common/font-awesome.min.css"
	rel="stylesheet" />
<!--[if IE 7]>
            <link rel="stylesheet" href="${path}/css/common/font-awesome-ie7.min.css">
        <![endif]-->
<!--[if lt IE 9]>
            <link rel="stylesheet" type="text/css" href="${path}/css/common/jquery.ui.1.10.0.ie.css"/>
        <![endif]-->
<link href="${path}/css/common/docs.css" rel="stylesheet" />
<body>
	<a id="modal_link" class="ui-state-default ui-corner-all" href="#"><span
		class="ui-icon ui-icon-newwin"></span>添加用户信息</a>
	<a id="addsale_link"
		class="ui-button-primary ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
		href="#">添加业绩信息</a>
	<input id="seesales"
		class="ui-button-primary ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
		type="button" value="查看报表数据" />
	<div id="adduser" style="display: none;" align="center">
		<form id="addusers">
			<table>
				<tr>
					<td>用户姓名：</td>
					<td><input id="name" name="name" type="text" value="" /></td>
				</tr>
				<tr>
					<td>登录帐号：</td>
					<td><input id="username" name="username" type="text" value="" //>
					</td>
				</tr>
				<tr>
					<td>登录密码：</td>
					<td><input id="password" name="password" type="password"
						value="" //></td>
				</tr>
				<tr>
					<td>
						<button id="btsave"
							class="ui-button-primary ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">
							保存用户</button>
					</td>
					<td>
						<button id="btclose"
							class="ui-button-primary ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">
							关闭窗口</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="addsales" style="display: none;">
		<table>
			<form id="addsales" method="post" action="${path}/sales/add.html">
				<tr>
					<td>选择用户：</td>
					<td><select id="uid" name="uid">
							<option value="-1" selected="selected">请选择销售人员</option>
					</select></td>
				</tr>
				<tr>
					<td>录入销售金额：</td>
					<td><input name="money" type="text" /></td>
				</tr>
				<tr>
					<td>选择日期：</td>
					<td><input id="saletime" type="text" name="saletime" /></td>
				</tr>
				<tr>
					<td><input
						class="ui-button-primary ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
						type="submit" value="添加销售数据" /></td>
					<td><input id="btcloseSales"
						class="ui-button-primary ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
						type="button" value="关  闭" /></td>
				</tr>
			</form>
		</table>
	</div>
	<div id="main"
		style="height: 500px; border: 1px solid #ccc; padding: 5px;"></div>
	<div style="height: 365px; width: 100%">
		<table id="MyGrid" class="table table-bordered datagrid">
			<thead>
				<tr>
					<th><span class="datagrid-header-title">Geographic Data
							Sample</span>

						<div class="datagrid-header-left">
							<div class="input-append search datagrid-search">
								<input type="text" class="input-medium" placeholder="Search">
								<button type="button" class="btn">
									<i class="icon-search"></i>
								</button>
							</div>
						</div></th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>
						<div class="datagrid-footer-left" style="display: none;">
							<div class="grid-controls">
								<span> <span class="grid-start"></span> - <span
									class="grid-end"></span> of <span class="grid-count"></span>
								</span>
								<div class="select grid-pagesize" data-resize="auto">
									<button type="button" data-toggle="dropdown"
										class="btn dropdown-toggle">
										<span class="dropdown-label"></span> <span class="caret"></span>
									</button>
									<ul class="dropdown-menu">
										<li data-value="5" data-selected="true"><a href="#">5</a></li>
										<li data-value="10"><a href="#">10</a></li>
										<li data-value="20"><a href="#">20</a></li>
										<li data-value="50"><a href="#">50</a></li>
										<li data-value="100"><a href="#">100</a></li>
									</ul>
								</div>
								<span>Per Page</span>
							</div>
						</div>
						<div class="datagrid-footer-right" style="display: none;">
							<div class="grid-pager">
								<button type="button" class="btn grid-prevpage">
									<i class="icon-chevron-left"></i>
								</button>
								<span>Page</span>

								<div class="input-append dropdown combobox">
									<input class="span1" type="text">
									<button type="button" class="btn" data-toggle="dropdown">
										<i class="caret"></i>
									</button>
									<ul class="dropdown-menu"></ul>
								</div>
								<span>of <span class="grid-pages"></span></span>
								<button type="button" class="btn grid-nextpage">
									<i class="icon-chevron-right"></i>
								</button>
							</div>
						</div>
					</th>
				</tr>
			</tfoot>
		</table>
	</div>
	<script type="text/javascript"
		src="${path}/js/jquery/jquery-1.11.1.min.js"></script>
	<script type="text/javascript"
		src="${path}/js/common/jquery-ui-1.9.2.custom.min.js"></script>
	<script type="text/javascript" src="${path}/js/common/bootstrap.min.js"></script>
	<script type="text/javascript" src='${path}/js/common/esl.js'></script>
	<script type="text/javascript" src='${path}/js/sales/Imagesforms.js'></script>
</body>
</html>
