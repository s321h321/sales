<%
String path=request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path	+"/";
pageContext.setAttribute("path", path);	
%>
<script type="text/javascript">
	var path = '${path}';
</script>