$(function() {
	$("#modal_link").click(function{
		$('#mywindow').dialog({
			autoOpen : false,
			modal : true,
			buttons : {
				Ok : function() {
					$(this).dialog("close");
				}
			}
		});
	});
});