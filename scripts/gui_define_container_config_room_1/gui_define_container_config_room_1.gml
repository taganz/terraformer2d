/* 

	Dialog to configure screens with one climate

	GUI library
		https://github.com/DragoniteSpam/Emu/wiki/Emu-Default-Macros
*/

function gui_define_container_config_room_1(){
	
	var COLUMN_1_X = 32;
	//var COLUMN_2_X = 400;

	var container = new EmuCore(32, 32, 640, 640);
	var yy = 32;
	
	
	// === COLUMN 1

	// info text

	var text = new EmuText(COLUMN_1_X, yy, 512, 32, "Configure this zone");
	container.AddContent(text);
	yy+=32;
	yy+=32;


	// climate selection list
	
	var list = new EmuList(COLUMN_1_X, yy, 256, 32, "Climates", "default", 5, function() {
	    var selected_index = GetSelection();
	    if (selected_index >= 0) {
	        show_debug_message("Climate selected: " + string(selected_index));
			controller.user_options.climate_replace = selected_index;	
	    }
		});
	list.SetMultiSelect(false, false, false);
	list.AddEntries(climate_array_climates());
	container.AddContent(list);
	yy+=32;
	yy+=32;
	yy+=32;
	yy+=32;
	yy+=32;
	yy+=32;


	// soil selection list
	
	var list = new EmuList(COLUMN_1_X, yy, 256, 32, "Soil", "default", 3, function() {
	    var selected_index = GetSelection();
	    if (selected_index >= 0) {
	        show_debug_message("Soil selected: " + string(selected_index));
			controller.user_options.soil_type_replace = selected_index;	
	    }
		});
	list.SetMultiSelect(false, false, false);
	list.AddEntries(soil_array_soils());
	container.AddContent(list);
	yy+=32;
	yy+=32;
	yy+=32;
	yy+=32;
	yy+=32;


	// --- cancel / accept

	var _button = new EmuButton(COLUMN_1_X, yy, 100, 32, "Cancel", function() {
		
		controller.user_options.climate_replace = -1;
		controller.user_options.selected_room = -1;
		obj_gui.state = GUI_STATE.MENU_INPUT;
		
		
	});
	container.AddContent(_button);
	var _button = new EmuButton(COLUMN_1_X + 100, yy, 100, 32, "Accept", function() {
		
		obj_gui.state = GUI_STATE.LAUNCH_SIMULATION;
	
		
		
	});
	container.AddContent(_button);
	yy+=32;


	return container;
}