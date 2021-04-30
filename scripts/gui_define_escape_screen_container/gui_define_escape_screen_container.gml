/* 
 GUI library
		https://github.com/DragoniteSpam/Emu/wiki/Emu-Default-Macros
*/

function gui_define_escape_screen_container(){
	
	var COLUMN_1_X = 32;
	var COLUMN_2_X = 400;

	var _escape_screen_container = new EmuCore(32, 32, 640, 640);
	var yy = 32;
	

	// === help

	var _button = new EmuButton(COLUMN_1_X, yy, 256, 32, "Help", function() {
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

	var _button = new EmuButton(COLUMN_1_X, yy, 256, 32, "Debug (4)", function() {
		gui_debug_toogle();
	});
	_escape_screen_container.AddContent(_button);
	yy+=32;

	// === restart

	var _button = new EmuButton(COLUMN_1_X, yy, 256, 32, "Restart (R)", function() {
		gui_game_restart();
	});
	_escape_screen_container.AddContent(_button);
	yy+=32;

	// === back to simulation

	var _button = new EmuButton(COLUMN_1_X, yy, 256, 32, "Back", function() {
		obj_gui.show_escape_screen = false;
	});
	_escape_screen_container.AddContent(_button);
	yy+=32;

	// checkbox

	var checkbox = new EmuCheckbox(COLUMN_1_X, yy, 256, 32, "Toggle", false, function() {
	    show_debug_message("The state of the checkbox is " + (value ? "on" : "off"));
	});
	_escape_screen_container.AddContent(checkbox);
	yy+=32;

	// button close

	var _button = new EmuButton(COLUMN_1_X, yy, 256, 32, "Show Dialog", function() {
	    //var dialog = new EmuDialog(640, 640, "Hey, listen!", emu_null);
	    var dialog = new EmuDialog(640, 640, "Hey, listen!");
	    dialog.AddContent(new EmuText(32, 32, 256, 64, "These are words that you can read and stuff"));
	});
	_escape_screen_container.AddContent(_button);
	yy+=32;

	// info

	var text = new EmuText(COLUMN_1_X, yy, 512, 32, "sim step: " + string(controller.time.current_sim_step));
	_escape_screen_container.AddContent(text);
	yy+=32;
	var text = new EmuText(COLUMN_1_X, yy, 512, 32, "step: " + string(controller.time.current_step) );
	_escape_screen_container.AddContent(text);
	yy+=32;



	// === COLUMN 2

	// spawn specie selection

	yy=0;


	var radio = new EmuRadioArray(COLUMN_2_X, yy, 256, 32, "Specie to spawn on left click:", 0, function() {
	    show_debug_message("You have chosen specie #" + string(value) + ".");
		obj_gui.options_gui.object_spawn_on_click = value;
	});
	radio.AddOptions(obj_gui.options_gui.object_spawn_on_click_options);
	//radio.SetColumns(3, 256);
	radio.SetColumns(0, 256);
	_escape_screen_container.AddContent(radio);
	
	yy+=32;


	return _escape_screen_container;
}