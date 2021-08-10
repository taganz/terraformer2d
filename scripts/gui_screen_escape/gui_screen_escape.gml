/* 
 GUI library
		https://github.com/DragoniteSpam/Emu/wiki/Emu-Default-Macros
*/

function gui_screen_escape(){
	
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


	// === restart

	//var _button = new EmuButton(COLUMN_1_X, yy, 256, 32, "Restart (R)", function() {
	//	gui_simulation_quit();
	//});
	//_container.AddContent(_button);
	//yy+=32;


	
	// climate selection list (if configurable room)
	
	if controller.user_options.room_configurable_climate != -1 {
	
		var list = new EmuList(COLUMN_1_X, yy, 256, 32, "Climate", "default", 3, function() {
		    var selected_index = GetSelection();
		    if (selected_index >= 0) {
		        show_debug_message("Climate selected: " + string(selected_index));
				controller.user_options.room_climate = selected_index;	
				// update climate
				grid_reset_configurable_climate(selected_index);
		    }
			});
		list.SetMultiSelect(false, false, false);
		list.AddEntries(climate_array_climates());
		list.Select(controller.user_options.room_climate, true);
		_container.AddContent(list);
		yy+=32;
		yy+=32;
		yy+=32;
		yy+=32;
		
	}


	// soil selection list
		
	if controller.user_options.room_configurable_soil != -1 {
	
		var list = new EmuList(COLUMN_1_X, yy, 256, 32, "Soil", "default", 3, function() {
		    var selected_index = GetSelection();
		    if (selected_index >= 0) {
		        show_debug_message("Soil selected: " + string(selected_index));
				controller.user_options.room_soil_type = selected_index;	
				
				// update soil
				grid_reset_configurable_soil(selected_index);
		    }
			});
		list.SetMultiSelect(false, false, false);
		list.AddEntries(soil_array_soils());
		list.Select(controller.user_options.room_soil_type, true);
		_container.AddContent(list);
		yy+=32;
		yy+=32;
		yy+=32;
		yy+=32;
	}

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



	// === back to simulation

	var _button = new EmuButton(COLUMN_1_X, yy, 256, 32, "Back", function() {
		//obj_gui.show_escape_screen = false;
		gui_escape_screen_toggle();
	});
	_container.AddContent(_button);
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

	
	
	
	return _container;
}