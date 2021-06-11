/* 
 GUI library
		https://github.com/DragoniteSpam/Emu/wiki/Emu-Default-Macros
*/

function gui_define_container_escape_screen(){
	
	var COLUMN_1_X = 32;
	var COLUMN_2_X = 400;

	var _container = new EmuCore(32, 32, 640, 640);
	var yy = 32;
	
	
	// === COLUMN 1

	// --- help

	var _button = new EmuButton(COLUMN_1_X, yy, 256, 32, "Keys", function() {
	    var dialog = new EmuDialog(640, 640, "Terraformer2D");
	    dialog.AddContent(new EmuText(32, 32, 512, 256, gui_help_keys()));
	});
	_container.AddContent(_button);
	yy+=32;

	// --- debug

	var _button = new EmuButton(COLUMN_1_X, yy, 256, 32, "Debug (4)", function() {
		gui_debug_toogle();
	});
	_container.AddContent(_button);
	yy+=32;

	// === restart

	var _button = new EmuButton(COLUMN_1_X, yy, 256, 32, "Restart (R)", function() {
		gui_game_restart();
	});
	_container.AddContent(_button);
	yy+=32;

	// === back to simulation

	var _button = new EmuButton(COLUMN_1_X, yy, 256, 32, "Back", function() {
		//obj_gui.show_escape_screen = false;
		gui_escape_screen_toggle();
	});
	_container.AddContent(_button);
	yy+=32;

	
	
	yy+=32;
	yy+=32;
	yy+=32;
	yy+=32;

	// checkbox

	var checkbox = new EmuCheckbox(COLUMN_1_X, yy, 256, 32, "Toggle", false, function() {
	    show_debug_message("The state of the checkbox is " + (value ? "on" : "off"));
	});
	_container.AddContent(checkbox);
	yy+=32;

	// button close

	var _button = new EmuButton(COLUMN_1_X, yy, 256, 32, "Help", function() {
	    //var dialog = new EmuDialog(640, 640, "Hey, listen!", emu_null);
	    var dialog = new EmuDialog(640, 640, "Hey, listen!");
	    dialog.AddContent(new EmuText(32, 32, 256, 64, "These are words that you can read and stuff"));
	});
	_container.AddContent(_button);
	yy+=32;

	// info

	var text = new EmuText(COLUMN_1_X, yy, 512, 32, "sim step: " + string(controller.time.current_sim_step));
	_container.AddContent(text);
	yy+=32;
	var text = new EmuText(COLUMN_1_X, yy, 512, 32, "step: " + string(controller.time.current_step) );
	_container.AddContent(text);
	yy+=32;



	// === COLUMN 2
	
	yy=0;

/*
	// spawn specie selection

	var object_names_array = genus_get_names_array(-1);
	var radio = new EmuRadioArray(COLUMN_2_X, yy, 256, 32, "Specie to spawn on left click:", 0, function() {
		var _object_names_array = genus_get_names_array(-1);
	    show_debug_message("You have chosen specie #" + string(value) + ".");
		controller.user_options.object_spawn_on_click = genus_object_from_name(_object_names_array[value]);
	});
	radio.AddOptions(object_names_array);
	//radio.SetColumns(3, 256);
	radio.SetColumns(0, 256);
	_container.AddContent(radio);
	
	yy+=32;
*/

	// spawn specie selection
	
	var object_names_array = genus_get_names_array(-1);
	var list = new EmuList(COLUMN_2_X, yy, 256, 32, "Specie to spawn on left click:", "Default", 10, function() {
		var object_names_array_2 = genus_get_names_array(-1);
	    var selected_index = GetSelection();
	    if (selected_index >= 0) {
	        show_debug_message("Primary index selected: " + string(selected_index));
			controller.user_options.object_spawn_on_click = genus_object_from_id(genus_id_from_name(object_names_array_2[@ selected_index]));	
	    }
		});
	list.SetMultiSelect(false, false, false);
	list.AddEntries(object_names_array);
	// select default value from user options
	if controller.user_options.spawn_genus_object != -1 {
		for (var i = 0; i < array_length(object_names_array); ++i) {
			if object_names_array[i] == genus_name_from_object(controller.user_options.object_spawn_on_click) {
				list.Select(i, true);		
				break;
			}
		}
	}
	_container.AddContent(list);
	
	yy+=32 * 12;
	
	
	
	return _container;
}