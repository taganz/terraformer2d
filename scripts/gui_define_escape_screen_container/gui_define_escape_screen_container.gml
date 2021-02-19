// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gui_define_escape_screen_container(){
	
	var _escape_screen_container = new EmuCore(32, 32, 640, 640);
	var yy = 32;
	

	// === help

	var _button = new EmuButton(32, yy, 256, 32, "Help", function() {
	    var dialog = new EmuDialog(640, 640, "Terraformer2D");
	    dialog.AddContent(new EmuText(32, 32, 512, 256, 
		"Terraformer2D"
		+"\n============================="
		+"\nInstructions to be completed..."
		));
	});
	_escape_screen_container.AddContent(_button);
	yy+=32;



	// === debug

	var _button = new EmuButton(32, yy, 256, 32, "Debug (4)", function() {
		gui_debug_toogle();
	});
	_escape_screen_container.AddContent(_button);
	yy+=32;

	// === restart

	var _button = new EmuButton(32, yy, 256, 32, "Restart (R)", function() {
		gui_game_restart();
	});
	_escape_screen_container.AddContent(_button);
	yy+=32;

	// === back to simulation

	var _button = new EmuButton(32, yy, 256, 32, "Back", function() {
		obj_gui.show_escape_screen = false;
	});
	_escape_screen_container.AddContent(_button);
	yy+=32;

	// checkbox

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


	return _escape_screen_container;
}