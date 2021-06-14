/* 

	Dialog to configure screens with one climate

	GUI library
		https://github.com/DragoniteSpam/Emu/wiki/Emu-Default-Macros
*/

function gui_define_container_config_room_1(){
	
	var COLUMN_1_X = 32;
	var COLUMN_2_X = 400;

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
			controller.user_options.room_climate = selected_index;	
	    }
		});
	list.SetMultiSelect(false, false, false);
	list.AddEntries(climate_array_climates());
	list.Select(controller.user_options.room_climate, true);
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
			controller.user_options.room_soil_type = selected_index;	
	    }
		});
	list.SetMultiSelect(false, false, false);
	list.AddEntries(soil_array_soils());
	list.Select(controller.user_options.room_soil_type, true);
	container.AddContent(list);
	yy+=32;
	yy+=32;
	yy+=32;
	yy+=32;
	yy+=32;




	// --- cancel / accept

	var _button = new EmuButton(COLUMN_1_X, yy, 100, 32, "Cancel", function() {
		
		controller.user_options.room_climate = -1;
		controller.user_options.selected_room = -1;
		obj_gui.state = GUI_STATE.MENU_INPUT;
		
		
	});
	container.AddContent(_button);
	var _button = new EmuButton(COLUMN_1_X + 100, yy, 100, 32, "Accept", function() {
		
		obj_gui.state = GUI_STATE.LAUNCH_SIMULATION;
	
		
		
	});
	container.AddContent(_button);
	yy+=32;



	// === COLUMN 2
	
	yy = 64;

	// --- primary selection list
	
	var _list_primaries = genus_get_names_array(TROPHIC_LEVEL.PRIMARY);
	var list = new EmuList(COLUMN_2_X, yy, 256, 32, "Primary", "Default", 3, function() {
		var _list_primaries_2 = genus_get_names_array(TROPHIC_LEVEL.PRIMARY);
	    var selected_index = GetSelection();
	    if (selected_index >= 0) {
	        show_debug_message("Primary index selected: " + string(selected_index));
			controller.user_options.spawn_genus_object = genus_object_from_id(genus_id_from_name(_list_primaries_2[@ selected_index]));	
			//controller.user_options.spawn_quantity = 5;
			controller.user_options.spawn_distance_max = 100;
			controller.user_options.spawn_log_probability = 1;	// log all spawned creatures
	    }
		});
	list.SetMultiSelect(false, false, false);
	list.AddEntries(_list_primaries);
	// select default value from user options
	if controller.user_options.spawn_genus_object != -1 {
		for (var i = 0; i < array_length(_list_primaries); i++) {
			if _list_primaries[i] == genus_name_from_object(controller.user_options.spawn_genus_object) {
				list.Select(i, true);		
				break;
			}
		}
	}
	container.AddContent(list);
	yy+=32;
	yy+=32;
	yy+=32;
	yy+=32;
	yy+=32;


	// --- primary quantity

	var input = new EmuInput(COLUMN_2_X, yy, 250, 32, "Primary qty",
		string(controller.user_options.spawn_quantity), "0 - 50", 2, E_InputTypes.INT, function() {
	    controller.user_options.spawn_quantity = value;
	});
	input.SetRealNumberBounds(1, 50);
	container.AddContent(input);
	yy+=32;





	// --- secondary selection list
	
	var _list_secondaries = genus_get_names_array(TROPHIC_LEVEL.SECONDARY);
	var list = new EmuList(COLUMN_2_X, yy, 256, 32, "Secondary", "Default", 3, function() {
		var _list_secondaries_2 = genus_get_names_array(TROPHIC_LEVEL.SECONDARY);
	    var selected_index = GetSelection();
	    if (selected_index >= 0) {
	        show_debug_message("Secondary index selected: " + string(selected_index));
			controller.user_options.spawn_2_genus_object = genus_object_from_id(genus_id_from_name(_list_secondaries_2[@ selected_index]));	
			//controller.user_options.spawn_2_quantity = 2;
			controller.user_options.spawn_2_distance_max = 50;
			controller.user_options.spawn_2_log_probability = 1;	// log all spawned creatures
	    }
		});
	list.SetMultiSelect(false, false, false);
	list.AddEntries(_list_secondaries);
	// select default value from user options
	if controller.user_options.spawn_2_genus_object != -1 {
		for (var i = 0; i < array_length(_list_secondaries); i++) {
			if _list_secondaries[i] == genus_name_from_object(controller.user_options.spawn_2_genus_object) {
				list.Select(i, true);		
				break;
			}
		}
	}
	container.AddContent(list);
	yy+=32;
	yy+=32;
	yy+=32;
	yy+=32;
	yy+=32;


	// --- secondary quantity

	var input = new EmuInput(COLUMN_2_X, yy, 250, 32, "Secondary qty",
		string(controller.user_options.spawn_2_quantity), "0 - 30", 2, E_InputTypes.INT, function() {
	    controller.user_options.spawn_2_quantity = value;
	});
	input.SetRealNumberBounds(1, 30);
	container.AddContent(input);
	yy+=32;




	return container;
}