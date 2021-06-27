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
			obj_gui.selected_climate = selected_index;	
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
			obj_gui.selected_soil_type = selected_index;	
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
		
		obj_gui.selected_climate = -1;
		obj_gui.selected_room = -1;
		obj_gui.state = 0;
		
		
	});
	container.AddContent(_button);
	var _button = new EmuButton(COLUMN_1_X + 100, yy, 100, 32, "Accept", function() {
		
		obj_gui.state = 2;
	
		
		
	});
	container.AddContent(_button);
	yy+=32;

/*
	// --- help

	var _button = new EmuButton(COLUMN_1_X, yy, 256, 32, "Help", function() {
	    var dialog = new EmuDialog(640, 640, "Terraformer2D");
	    dialog.AddContent(new EmuText(32, 32, 512, 256, 
		"Terraformer2D"
		+"\n============================="
		+"\nInstructions to be completed..."
		));
	});
	container.AddContent(_button);
	yy+=32;

	// --- debug

	var _button = new EmuButton(COLUMN_1_X, yy, 256, 32, "Debug (4)", function() {
		gui_debug_toogle();
	});
	container.AddContent(_button);
	yy+=32;

	// === restart

	var _button = new EmuButton(COLUMN_1_X, yy, 256, 32, "Restart (R)", function() {
		gui_game_restart();
	});
	container.AddContent(_button);
	yy+=32;

	// === back to simulation

	var _button = new EmuButton(COLUMN_1_X, yy, 256, 32, "Back", function() {
		obj_gui.show_escape_screen = false;
	});
	container.AddContent(_button);
	yy+=32;

	
	
	yy+=32;
	yy+=32;
	yy+=32;
	yy+=32;

	// checkbox

	var checkbox = new EmuCheckbox(COLUMN_1_X, yy, 256, 32, "Toggle", false, function() {
	    show_debug_message("The state of the checkbox is " + (value ? "on" : "off"));
	});
	container.AddContent(checkbox);
	yy+=32;

	// button close

	var _button = new EmuButton(COLUMN_1_X, yy, 256, 32, "Show Dialog", function() {
	    //var dialog = new EmuDialog(640, 640, "Hey, listen!", emu_null);
	    var dialog = new EmuDialog(640, 640, "Hey, listen!");
	    dialog.AddContent(new EmuText(32, 32, 256, 64, "These are words that you can read and stuff"));
	});
	container.AddContent(_button);
	yy+=32;

	// info

	var text = new EmuText(COLUMN_1_X, yy, 512, 32, "sim step: " + string(controller.time.current_sim_step));
	container.AddContent(text);
	yy+=32;
	var text = new EmuText(COLUMN_1_X, yy, 512, 32, "step: " + string(controller.time.current_step) );
	container.AddContent(text);
	yy+=32;



	// === COLUMN 2
	
	yy=0;

	// spawn specie selection


	var radio = new EmuRadioArray(COLUMN_2_X, yy, 256, 32, "Specie to spawn on left click:", 0, function() {
	    show_debug_message("You have chosen specie #" + string(value) + ".");
		obj_gui.user_options.object_spawn_on_click = value;
	});
	radio.AddOptions(obj_gui.user_options.object_spawn_on_click_options);
	//radio.SetColumns(3, 256);
	radio.SetColumns(0, 256);
	container.AddContent(radio);
	
	yy+=32;

*/
	return container;
}