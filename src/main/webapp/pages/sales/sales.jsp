<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>销售业绩系统用户数据设置</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/flexigrid.pack.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/common/flexigrid.pack.js"></script>
</head>
<body>
	<script type="text/javascript">
		$(function() {
			$("#saledata").flexigrid({
				url : '${pageContext.request.contextPath}/sales/info.html', //要请求的后台处理程序地址
				dataType : 'json', //返回的数据格式 一般为 json
				colModel : [ //要显示的列 和 表头名
				{
					display : '编号',
					name : 'id',
					width : 50,
					sortable : true,
					align : 'center',
					toggle : false
				}, {
					display : '姓名',
					name : 'name',
					width : 40,
					sortable : true,
					align : 'center'
				}, {
					display : '业绩',
					name : 'sale',
					width : 180,
					sortable : true,
					align : 'center'
				}, {
					display : '月份',
					name : 'month',
					width : 120,
					sortable : true,
					align : 'center'
				}, {
					display : '销售时间',
					name : 'saletime',
					width : 130,
					sortable : true,
					align : 'center',
				} ],
				buttons : [ {
					name : 'add',
					displayname : '新增',
					bclass : 'add',
					onpress : toolbarItem
				} ],
				searchitems : [ //可供搜索的列名
				{
					display : '姓名',
					name : 'name'
				} ],
				sortname : "saletime", //初始以哪个字段排序
				sortorder : "desc", //升序：asc   降序：desc
				usepager : true, //是否使用分页
				nomsg : '没有符合条件的记录存在',
				useRp : true,
				rp : 15, //每页显示的记录条数
				//showTableToggleBtn : false, //是否显示表格“展开”和“折叠”图标
				autoload : true,
				resizable : false,
				procmsg : '加载中,请稍等...',
				hideOnSubmit : true,
				blockOpacity : 0.5,
				showcheckbox : true,
				gridClass : "bbit-grid",
				rowhandler : false,
				rowbinddata : true,
				//onrowchecked : callme,
				width : 700, //表格宽度
				height : 400
			//表格高度
			})
		});
		function toolbarItem(com, grid) {
			if (com == 'add') {
				openDialogAdd();
			}
		}
	</script>
	<table id="saledata" class="flexme"></table>
	<input type="button" id="btnTest" value="根据条件重新响应后台Ajax" />
</body>
</html>