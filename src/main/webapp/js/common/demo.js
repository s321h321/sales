$(function() {

	// Accordion
	$("#accordion").accordion({
		header : "h3"
	});

	// Tabs
	$('#tabs2, #tabs, #tabs3').tabs();

	// Buttons
	$('button').button();

	// Anchors, Submit
	$('.button,#sampleButton').button();

	// Buttonset
	$('#radioset').buttonset();
	$("#format").buttonset();

	// Dialog
	$('#dialog').dialog({
		autoOpen : false,
		width : 600,
		buttons : {
			"Ok" : function() {
				$(this).dialog("close");
			},
			"Cancel" : function() {
				$(this).dialog("close");
			}
		}
	});

	// Dialog Link
	$('#dialog_link').click(function() {
		$('#dialog').dialog('open');
		return false;
	});

	// Modal Link
	$('#modal_link').click(function() {
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

	// Datepicker
	$('#datepicker').datepicker({
		inline : true
	});

	// Slider
	$('#slider').slider({
		range : true,
		values : [ 17, 67 ]
	});

	// Progressbar
	$("#progressbar").progressbar({
		value : 20
	});

	// hover states on the static widgets
	$('#dialog_link, #modal_link, ul#icons li').hover(

	function() {
		$(this).addClass('ui-state-hover');
	}, function() {
		$(this).removeClass('ui-state-hover');
	});

	// Autocomplete
	var availableTags = [ "ActionScript", "AppleScript", "Asp", "BASIC", "C",
			"C++", "Clojure", "COBOL", "ColdFusion", "Erlang", "Fortran",
			"Groovy", "Haskell", "Java", "JavaScript", "Lisp", "Perl", "PHP",
			"Python", "Ruby", "Scala", "Scheme" ];

	$("#tags").autocomplete({
		source : availableTags
	});

	// Dialogs
	$("#dialog-message").dialog({
		autoOpen : false,
		modal : true,
		buttons : {
			Ok : function() {
				$(this).dialog("close");
			}
		}
	});

	// Remove focus from buttons
	$('.ui-dialog :button').blur();

	// Vertical slider
	$("#slider-vertical").slider({
		orientation : "vertical",
		range : "min",
		min : 0,
		max : 100,
		value : 60,
		slide : function(event, ui) {
			$("#amount").val(ui.value);
		}
	});
	$("#amount").val($("#slider-vertical").slider("value"));

	// Menu
	$("#menu").menu();

	// Spinner
	var spinner = $("#spinner").spinner();

	$("#disable").click(function() {
		if (spinner.spinner("option", "disabled")) {
			spinner.spinner("enable");
		} else {
			spinner.spinner("disable");
		}
	});
	$("#destroy").click(function() {
		if (spinner.data("ui-spinner")) {
			spinner.spinner("destroy");
		} else {
			spinner.spinner();
		}
	});
	$("#getvalue").click(function() {
		alert(spinner.spinner("value"));
	});
	$("#setvalue").click(function() {
		spinner.spinner("value", 5);
	});

	$("button").button();

	// Tooltip

	$("#tooltip").tooltip();

	// Split button
	$("#rerun").button().click(function() {
		alert("Running the last action");
	}).next().button({
		text : false,
		icons : {
			primary : "ui-icon-triangle-1-s"
		}
	}).click(function() {
		alert("Could display a menu to select an action");
	}).parent().buttonset();

	// Filament datepicker
	// $('#rangeA').daterangepicker();
	// $('#rangeBa, #rangeBb').daterangepicker();

	// Dynamic tabs
	var tabTitle = $("#tab_title"), tabContent = $("#tab_content"), tabTemplate = "<li><a href='#{href}'>#{label}</a> <span class='ui-icon ui-icon-close'>Remove Tab</span></li>", tabCounter = 2;

	var tabs = $("#tabs2").tabs();

	// modal dialog init: custom buttons and a "close" callback reseting the
	// form inside
	var dialog = $("#dialog2").dialog({
		autoOpen : false,
		modal : true,
		buttons : {
			Add : function() {
				addTab();
				$(this).dialog("close");
			},
			Cancel : function() {
				$(this).dialog("close");
			}
		},
		close : function() {
			form[0].reset();
		}
	});

	// addTab form: calls addTab function on submit and closes the dialog
	var form = dialog.find("form").submit(function(event) {
		addTab();
		dialog.dialog("close");
		event.preventDefault();
	});

	// actual addTab function: adds new tab using the input from the form above
	function addTab() {
		var label = tabTitle.val() || "Tab " + tabCounter, id = "tabs-"
				+ tabCounter, li = $(tabTemplate
				.replace(/#\{href\}/g, "#" + id).replace(/#\{label\}/g, label)), tabContentHtml = tabContent
				.val()
				|| "Tab " + tabCounter + " content.";

		tabs.find(".ui-tabs-nav").append(li);
		tabs.append("<div id='" + id + "'><p>" + tabContentHtml + "</p></div>");
		tabs.tabs("refresh");
		tabCounter++;
	}

	// addTab button: just opens the dialog
	$("#add_tab").button().click(function() {
		dialog.dialog("open");
	});

	// close icon: removing the tab on click
	$("#tabs2").on("click", 'span.ui-icon-close', function() {

		var panelId = $(this).closest("li").remove().attr("aria-controls");
		$("#" + panelId).remove();
		tabs.tabs("refresh");
	});

	// Combination examples (tabs) and open dialog
	$('#sampleButton').on('click', function(event) {
		event.preventDefault();
		$('#dialog').dialog({
			autoOpen : true,
			modal : true,
			width : 600,
			buttons : {
				"Save" : function() {
					$(this).dialog("close");
				},
				"Cancel" : function() {
					$(this).dialog("close");
				}
			}
		});
	});
	// File input (using
	// http://filamentgroup.com/lab/jquery_custom_file_input_book_designing_with_progressive_enhancement/)
	// $('#file').customFileInput({
	// button_position : 'right'
	// });

	// Wijmo
	// $("#menu1").wijmenu({
	// trigger : ".wijmo-wijmenu-item",
	// triggerEvent : "click"
	// });
	// $(".wijmo-wijmenu-text").parent().bind("click", function () {
	// $("#menu1").wijmenu("hideAllMenus");
	// });
	// $(".wijmo-wijmenu-link").hover(function () {
	// $(this).addClass("ui-state-hover");
	// }, function () {
	// $(this).removeClass("ui-state-hover");
	// });

	// Toolbar
	// $("#play, #shuffle").button();
	// $("#repeat").buttonset();

});