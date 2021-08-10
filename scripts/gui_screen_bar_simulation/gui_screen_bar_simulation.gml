/*

	Simulation screen buttons


	 GUI library
			https://github.com/DragoniteSpam/Emu/wiki/Emu-Default-Macros
*/


function gui_screen_bar_simulation(){
	
var yy = 0;
var _container = new EmuCore(controller.user_options.room_simulation_width + 1, 0, controller.game_max_x - controller.user_options.room_simulation_width , controller.game_max_y);


// === tab definition

var group = new EmuTabGroup(0, yy, 1200 - controller.user_options.room_simulation_width, controller.user_options.room_simulation_heigth, 2, 32);
var tab_main = new EmuTab("Main");
var tab_climate = new EmuTab("Climate");
var tab_soil = new EmuTab("Soil");
var tab_tools = new EmuTab("Tools");
var tab_info = new EmuTab("Info");
group.AddTabs(0, [tab_main, tab_tools, tab_info]);
group.AddTabs(1, [tab_climate, tab_soil]);

_container.AddContent(group);

yy +=64;

#region tab_main

// === tab_main =====
yy = 32;


// === buttons row
var xx = 10;


// --- Button Pause

var _button = new EmuButton(xx, yy, 100, 32, "Play/Pause", function() {
	controller.sim_paused = ! controller.sim_paused;
});
tab_main.AddContent(_button);
xx+=105;

// --- Button Reset

var _button = new EmuButton(xx, yy, 100, 32, "Reset", function() {
	gui_simulation_restart();

});
tab_main.AddContent(_button);
xx+=105;

// --- Button Quit

var _button = new EmuButton(xx, yy, 70, 32, "Quit", function() {
	gui_simulation_quit();
});
tab_main.AddContent(_button);
xx+=9;

// --- Button Help

var _button = new EmuButton(300, yy, 70, 32, "Help", function() {
	var dialog = new EmuDialog(640, 640, "Terraformer2D");
	dialog.AddContent(new EmuText(32, 32, 512, 256, gui_help_keys()));
});
tab_main.AddContent(_button);
xx+=9;

yy+=32;
yy+=32;




// --- speed

var text = new EmuText(10, yy, 512, 32, "slow        SPEED         fast");
tab_main.AddContent(text);
yy += 32;

var bar = new EmuProgressBar(10, yy, 256, 32, 12, 0, 10, true, 7, function() {
    //show_debug_message("Speed " + string(value) + ".");
	time_sim_set_value(11 - value);
});
bar.SetIntegersOnly(true);
tab_main.AddContent(bar);

yy += 32;
yy += 32;


// --- temperature input

var text = new EmuText(10, yy, 512, 32, "...");
text.inherited_render = text.Render;
text.Render = method(text, function(a1, a2) {
    self.text = "Temp increment (+20 -20): "+string(controller.world.temperature_increment);
    self.inherited_render(a1, a2);
});
tab_main.AddContent(text);
yy += 32;

var bar = new EmuProgressBar(10, yy, 256, 32, 12, -20, 20, true, 0, function() {
    //show_debug_message("Speed " + string(value) + ".");
	controller.world.temperature_increment = value
});
bar.SetIntegersOnly(true);
tab_main.AddContent(bar);

yy += 32;
yy += 32;


// --- radiation input

var text = new EmuText(10, yy, 512, 32, "..." );
text.inherited_render = text.Render;
text.Render = method(text, function(a1, a2) {
    self.text = "Radiation (0-9): "+string(controller.world.radiation);
    self.inherited_render(a1, a2);
});
tab_main.AddContent(text);
yy += 32;

var bar = new EmuProgressBar(10, yy, 256, 32, 12, 0, 9, true, 0, function() {
    //show_debug_message("Speed " + string(value) + ".");
	 controller.world.radiation = value;
});
bar.SetIntegersOnly(true);
tab_main.AddContent(bar);

yy += 32;
yy += 32;


// ----- end of tab_main -----
#endregion


#region tab_info

// === tab_info =====
yy = 32;


// --- climate

var text = new EmuText(10, yy, 512, 32, "...");
text.inherited_render = text.Render;
text.Render = method(text, function(a1, a2) {
    self.text = "Climate: "+string(climate_to_string(controller.user_options.room_climate));
    self.inherited_render(a1, a2);
});
tab_info.AddContent(text);
yy += 32;

// --- soil

var text = new EmuText(10, yy, 512, 32, "...");
text.inherited_render = text.Render;
text.Render = method(text, function(a1, a2) {
    self.text = "Soil: "+string(soil_to_string(controller.user_options.room_soil_type));
    self.inherited_render(a1, a2);
});
tab_info.AddContent(text);
yy += 32;

// --- spaw 

var text = new EmuText(10, yy, 512, 132, "...");
text.inherited_render = text.Render;
text.Render = method(text, function(a1, a2) {
    self.text = "Initial spawn:"
				+ (controller.user_options.spawn_genus == -1   ? "" : "\n " + string(controller.user_options.spawn_quantity)  +" x "+string(genus_name_from_id(controller.user_options.spawn_genus)))
				+ (controller.user_options.spawn_2_genus == -1 ? "" : "\n " + string(controller.user_options.spawn_2_quantity)+" x "+string(genus_name_from_id(controller.user_options.spawn_2_genus)))
				+ (controller.user_options.spawn_3_genus == -1 ? "" : "\n " + string(controller.user_options.spawn_3_quantity)+" x "+string(genus_name_from_id(controller.user_options.spawn_3_genus)));
	self.inherited_render(a1, a2);
});
tab_info.AddContent(text);
yy += 32;
yy += 32;








// ----- end of tab_info -----
#endregion



#region tab_tools

// === TAB TOOLS ====
yy = 64;



// --- unlimited water check

var check = new EmuCheckbox(10, yy, 256, 32, "Unlimited water", controller.user_options.unlimited_water, function() {
    controller.user_options.unlimited_water = value;
	show_debug_message("unlimited_water: " + (controller.user_options.unlimited_water ? "on" : "off"));
});
tab_tools.AddContent(check);
yy+=32;


// spawn specie selection
	
var _array = genus_get_names_array(-1);
array_sort(_array, true);

var list = new EmuList(10, yy, 256, 32, "Genus to spawn on left click:", "Default", 5, function() {
	var _array_2 = genus_get_names_array(-1);
	array_sort(_array_2, true);
	var selected_index = GetSelection();
	if (selected_index >= 0) {
		for (var i = 1; i < array_length(_array_2); ++i) {
			if _array_2[selected_index] == genus_name_from_id(i) {
				controller.user_options.genus_spawn_on_click = i;
			    show_debug_message("Primary index selected: " + string(i));
				break;
			}
		}
	}
	});
list.SetMultiSelect(false, false, false);
list.AddEntries(_array);
// select default value from user options
if controller.user_options.spawn_genus != -1 {
	for (var i = 0; i < array_length(_array); ++i) {
		if _array[i] == genus_name_from_id(controller.user_options.genus_spawn_on_click) {
			list.Select(i, true);		
			break;
		}
	}
}
tab_tools.AddContent(list);
	
yy+=32 * 7;
	


// quantity
#macro SPAWN_ON_CLICK_MAX 100 

var text = new EmuText(10, yy, 512, 32, "1        quantity       "+string(SPAWN_ON_CLICK_MAX));
tab_tools.AddContent(text);
yy += 32;

var bar = new EmuProgressBar(10, yy, 256, 32, 12, 1, SPAWN_ON_CLICK_MAX, true, controller.user_options.genus_spawn_on_click_quantity, function() {
    //show_debug_message("genus_spawn_on_clic_quantity: " + string(value) );
	controller.user_options.genus_spawn_on_click_quantity = value;
});
bar.SetIntegersOnly(true);
tab_tools.AddContent(bar);

yy += 32;



// === multi spawn

var text = new EmuText(10, yy, 512, 32, "Multi spawn");
tab_tools.AddContent(text);
yy += 32;

var _button = new EmuButton(10, yy, 90, 32, "Selected", function() {
	spawner_multi_genus_id(controller.user_options.genus_spawn_on_click);
});
tab_tools.AddContent(_button);
var _button = new EmuButton(110, yy, 90, 32, "All Prod", function() {
	spawner_multi_trophic_level(TROPHIC_LEVEL.PRODUCER);
});
tab_tools.AddContent(_button);
var _button = new EmuButton(220, yy, 90, 32, "All Prim", function() {
	spawner_multi_trophic_level(TROPHIC_LEVEL.PRIMARY);
});
tab_tools.AddContent(_button);
var _button = new EmuButton(330, yy, 90, 32, "All Sec", function() {
	spawner_multi_trophic_level(TROPHIC_LEVEL.SECONDARY);
});
tab_tools.AddContent(_button);
yy+=32;

// --- 3 trophic levels
var _button = new EmuButton(10, yy, 90, 32, "Combination", function() {
	spawner_random_3_trophic_levels();
});
tab_tools.AddContent(_button);
// --- kill all
var _button = new EmuButton(110, yy, 90, 32, "Kill all", function() {
	world_creature_kill_all();
});
tab_tools.AddContent(_button);
yy+=32;


yy += 32;



// --- Button debug

var _button = new EmuButton(10, yy, 70, 32, "Debug (4)", function() {
	gui_debug_toogle();
});
tab_tools.AddContent(_button);

// --- Button options
var _button = new EmuButton(10, yy, 70, 32, "Options", function() {
	gui_escape_screen_toggle();
});
tab_tools.AddContent(_button);
yy += 32;

yy += 32;


// ----- end of tab tools -----

#endregion

#region tab_soil

// === TAB SOIL
yy = 64;
		
	// --- configurable warning
	
	if controller.user_options.room_configurable_soil {
		var text = new EmuText(10, yy, 512, 32, "Soil is configurable");
	}
	else {
		var text = new EmuText(10, yy, 512, 32, "Soil is NOT configurable");
	}
	tab_soil.AddContent(text);
	yy += 32;
	
	// --- list selection
	
	var list = new EmuList(10, yy, 256, 32, "Soil", "default", 4, function() {
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
	tab_soil.AddContent(list);
	yy+=32;
	yy+=32;
	yy+=32;
	yy+=32;
	yy+=32;
	yy+=32;
	
	// --- info button
		
	var _button = new EmuButton(10, yy, 256, 32, "Show soil summary", function() {
		var dialog = new EmuDialog(500, 400, "Soil data");
		dialog.AddContent(new EmuText(10, 10, 512, 400, soil_to_string_info(controller.user_options.room_soil_type)));
	});
	tab_soil.AddContent(_button);
	yy+=32;


#endregion

#region tab_climate

// === TAB CLIMATE
yy = 64;
		
	// --- configurable warning
	
	if controller.user_options.room_configurable_climate {
		var text = new EmuText(10, yy, 512, 32, "Climate is configurable");
	}
	else {
		var text = new EmuText(10, yy, 512, 32, "Climate is NOT configurable");
	}
	tab_climate.AddContent(text);
	yy += 32;
	
	// --- list selection
	
	var list = new EmuList(10, yy, 256, 32, "Climate", "default", 4, function() {
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
	tab_climate.AddContent(list);
	yy+=32;
	yy+=32;
	yy+=32;
	yy+=32;
	yy+=32;
	yy+=32;
	
	// --- info button
		
	var _button = new EmuButton(10, yy, 256, 32, "Show climate summary", function() {
		var dialog = new EmuDialog(500, 500, "Climate data");
		dialog.AddContent(new EmuText(10, 10, 512, 500, climate_to_string_info(controller.user_options.room_climate)));
	});
	tab_climate.AddContent(_button);
	yy+=32;


#endregion

return _container;

}

