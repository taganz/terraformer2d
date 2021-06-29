/*

	Simulation screen buttons


	 GUI library
			https://github.com/DragoniteSpam/Emu/wiki/Emu-Default-Macros
*/


function gui_bar_simulation(){
	
var yy = 0;
var _container = new EmuCore(controller.user_options.room_simulation_width + 1, 0, controller.game_max_x - controller.user_options.room_simulation_width , controller.game_max_y);

// === room selection column

/*
container = new EmuCore(32, 32, 640, 640);

var tab_group = new EmuTabGroup(0, 0, 640, 640, 2, 32);
var tab_bio = new EmuTab("Bio");
var tab_look = new EmuTab("Appearance");
var tab_stats = new EmuTab("Stats");
var tab_skills = new EmuTab("Skills");
var tab_summary = new EmuTab("Summary");

tab_group.AddTabs(0, [tab_bio, tab_look]);
tab_group.AddTabs(1, [tab_stats, tab_skills, tab_summary]);

container.AddContent(tab_group);
*/

/*
var _button = new EmuButton(10, yy, 70, 32, "Slower", function() {
//    controller.time.sim_speed_slower();
    time_sim_slower();
});
_container.AddContent(_button);
*/


// === SPEED

var text = new EmuText(10, yy, 512, 32, "slow        SPEED         fast");
_container.AddContent(text);
yy += 32;

var bar = new EmuProgressBar(10, yy, 256, 32, 12, 0, 10, true, 7, function() {
    show_debug_message("Speed " + string(value) + ".");
	time_sim_set_value(11 - value);
});
bar.SetIntegersOnly(true);

_container.AddContent(bar);

yy += 32;

// --- Pause

var _button = new EmuButton(10, yy, 70, 32, "Pause", function() {
	controller.sim_paused = ! controller.sim_paused;
});
_container.AddContent(_button);
yy += 32;



// --- Restart

var _button = new EmuButton(10, yy, 256, 32, "Restart (R)", function() {
	gui_game_restart();
});
_container.AddContent(_button);
yy+=32;
	
	

var _button = new EmuButton(10, yy, 70, 32, "Options", function() {
	gui_escape_screen_toggle();
});
_container.AddContent(_button);
yy += 32;



// --- debug

var _button = new EmuButton(10, yy, 256, 32, "Debug (4)", function() {
	gui_debug_toogle();
});
_container.AddContent(_button);
yy+=32;

yy += 32;


// --- unlimited water check

var check = new EmuCheckbox(10, yy, 256, 32, "Unlimited water", obj_gui.options_unlimited_water, function() {
    obj_gui.options_unlimited_water = value;
	show_debug_message("options_unlimited_water: " + (obj_gui.options_unlimited_water ? "on" : "off"));
});
_container.AddContent(check);
yy+=32;



// --- temperature input

var input = new EmuInput(10, yy, 350, 32, "Temperature incr.", 
	string(controller.world.temperature_increment), "-50 - 50", 3, E_InputTypes.REAL, function() {
    controller.world.temperature_increment = value;
});
input.SetRealNumberBounds(-50, 50);
_container.AddContent(input);
yy+=32;

// --- radiation input

var input = new EmuInput(10, yy, 350, 32, "Radiation",
	string(controller.world.radiation), "0 - 9", 1, E_InputTypes.REAL, function() {
    controller.world.radiation = value/10;
});
input.SetRealNumberBounds(0, 9);
_container.AddContent(input);
yy+=32;


// spawn specie selection
	
var _array = genus_get_names_array(-1);
array_sort(_array, true);

var list = new EmuList(10, yy, 256, 32, "Genus to spawn on left click:", "Default", 10, function() {
	var _array_2 = genus_get_names_array(-1);
	array_sort(_array_2, true);
	var selected_index = GetSelection();
	if (selected_index >= 0) {
		for (var i = 0; i < array_length(_array_2); ++i) {
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
_container.AddContent(list);
	
yy+=32 * 12;
	

// --- multi spawn

var text = new EmuText(10, yy, 512, 32, "Multi spawn");
_container.AddContent(text);
yy += 32;

var _button = new EmuButton(10, yy, 100, 32, "Producers", function() {
	spawner_multi(TROPHIC_LEVEL.PRODUCER);
});
_container.AddContent(_button);
var _button = new EmuButton(130, yy, 100, 32, "Primaries", function() {
	spawner_multi(TROPHIC_LEVEL.PRIMARY);
});
_container.AddContent(_button);
var _button = new EmuButton(260, yy, 100, 32, "Secondaries", function() {
	spawner_multi(TROPHIC_LEVEL.SECONDARY);
});
_container.AddContent(_button);
yy+=32;

yy += 32;


// --- Help

var _button = new EmuButton(10, yy, 256, 32, "Help", function() {
	var dialog = new EmuDialog(640, 640, "Terraformer2D");
	dialog.AddContent(new EmuText(32, 32, 512, 256, gui_help_keys()));
});
_container.AddContent(_button);
yy+=32;




return _container;

}

