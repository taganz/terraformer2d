// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gui_define_escape_screen_container(_escape_screen_container){
	
	var yy = 32;

	// button open dialog

	var _button = new EmuButton(32, 32, 256, 32, "Show Dialog", function() {
	    //var dialog = new EmuDialog(640, 640, "Hey, listen!", emu_null);
	    var dialog = new EmuDialog(640, 640, "Hey, listen!");
	    dialog.AddContent(new EmuText(32, 32, 256, 64, "These are words that you can read and stuff"));
	});

	_escape_screen_container.AddContent(_button);
	yy+=32;

	// button demo

	_escape_screen_container.AddContent(new EmuButton(32, yy, 256, 32, "Top Button", emu_null));
	yy+=32;

	// button demo

	_escape_screen_container.AddContent(new EmuButton(32, yy, 256, 32, "Bottom Button", emu_null));
	yy+=32;


	// check box

	var checkbox = new EmuCheckbox(32, yy, 256, 32, "Toggle", false, function() {
	    show_debug_message("The state of the checkbox is " + (value ? "on" : "off"));
	});
	_escape_screen_container.AddContent(checkbox);
	yy+=32;

	// button close

	var _button = new EmuButton(32, yy, 256, 32, "Show Dialog", function() {
	    //var dialog = new EmuDialog(640, 640, "Hey, listen!", emu_null);
	    var dialog = new EmuDialog(640, 640, "Hey, listen!");
	    dialog.AddContent(new EmuText(32, 32, 256, 64, "These are words that you can read and stuff"));
	});
	_escape_screen_container.AddContent(_button);
	yy+=32;


}