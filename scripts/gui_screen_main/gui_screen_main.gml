/* 

	When a room is selected
		change to state 1 if room configuration is needed
		change to state 2 if no configuration is needed

	 GUI library
		https://github.com/DragoniteSpam/Emu/wiki/Emu-Default-Macros
*/


function gui_screen_main(){
	
var TITLE_COLUMN_X = 32;
var ROOMS_COLUMN_X = 32;
var OPTIONS_COLUMN_Y = 400;

var _container = new EmuCore(32, 32, 640, 640);


// === room selection column

var yy = 0;

// -- title 

var text = new EmuText(TITLE_COLUMN_X, yy, 512, 32, "TERRAFORMER 2D");
_container.AddContent(text);
yy+=32;

var text = new EmuText(TITLE_COLUMN_X, yy, 512, 32, "Yet another ecosystem simulator");
_container.AddContent(text);
yy+=32;

yy+=32

// -- zone selection

var text = new EmuText(ROOMS_COLUMN_X, yy, 256, 32, "Select zone");
_container.AddContent(text);
yy+=32;


var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Pop. growth prod.", function() {
	with controller.user_options {
		spawn_3_genus = GENUS.PR_BUSH_3;
		spawn_3_quantity = 1;
		spawn_3_distance_max = 0.2;
		room_climate = CLIMATE.TROPICAL;
		room_soil_type = SOIL.LOAM;
	}
	obj_gui.state = GUI_STATE.CONFIG_ROOM;
	obj_gui.selected_room = OneClimateOneSoil;
	obj_gui.container_config_room_1= gui_screen_config_level();
		
});
_container.AddContent(_button);
yy+=32;



var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Pop. growth prim.", function() {
	with controller.user_options {
		spawn_genus = GENUS.PRI_TINY
		spawn_quantity = 1;
		spawn_distance_max = 0.2;
		spawn_3_genus = GENUS.PR_BUSH_3;
		spawn_3_quantity = 400;
		spawn_3_distance_max = 1;
		room_climate = CLIMATE.TROPICAL;
		room_soil_type = SOIL.LOAM;
	}
	obj_gui.state = GUI_STATE.CONFIG_ROOM;
	obj_gui.selected_room = OneClimateOneSoil;
	obj_gui.container_config_room_1= gui_screen_config_level();
		
});
_container.AddContent(_button);
yy+=32;




var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Mediterranean", function() {
	obj_gui.state = GUI_STATE.LAUNCH_SIMULATION;
	obj_gui.selected_room = rm_mediterranean;
		
	with controller.user_options {
		genus_spawn_on_click = GENUS.PRI_TINY_2;
		spawn_genus = GENUS.PR_TREE_1;
		spawn_quantity = 40;
		spawn_distance_max = 1;
		spawn_2_genus = GENUS.PR_BUSH;
		spawn_2_quantity = 100;
		spawn_2_distance_max = 1;
		spawn_3_genus = GENUS.PR_BUSH_2;
		spawn_3_quantity = 100;
		spawn_3_distance_max = 1;
	}
});
_container.AddContent(_button);
yy+=32;


var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Tropical", function() {
	obj_gui.state = GUI_STATE.LAUNCH_SIMULATION;
	obj_gui.selected_room = rm_tropical;
});
_container.AddContent(_button);
yy+=32;



var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Predator/Prey", function() {
	obj_gui.state = GUI_STATE.CONFIG_ROOM;
	obj_gui.selected_room = OneClimate;
});
_container.AddContent(_button);
yy+=32;

var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "All climates (4)", function() {
	obj_gui.state = GUI_STATE.LAUNCH_SIMULATION;
	obj_gui.selected_room = Room4;
});
_container.AddContent(_button);
yy+=32;


var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Artic", function() {
	obj_gui.state = GUI_STATE.LAUNCH_SIMULATION;
	obj_gui.selected_room = rm_artic;
});
_container.AddContent(_button);
yy+=32;


var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Continental", function() {
	obj_gui.state = GUI_STATE.LAUNCH_SIMULATION;
	obj_gui.selected_room = rm_continental;
});
_container.AddContent(_button);
yy+=32;


var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Desertic", function() {
	obj_gui.state = GUI_STATE.LAUNCH_SIMULATION;
	obj_gui.selected_room = rm_desertic;
});
_container.AddContent(_button);
yy+=32;

// separating debug rooms
yy+=32;


var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Test climates", function() {
	obj_gui.state = GUI_STATE.LAUNCH_SIMULATION;
	obj_gui.selected_room = TestClimates;
});
_container.AddContent(_button);
yy+=32;


var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Debug", function() {
	obj_gui.state = GUI_STATE.LAUNCH_SIMULATION;
	obj_gui.selected_room = rm_debug;
});
_container.AddContent(_button);
yy+=32;





var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Empty", function() {
	obj_gui.state = GUI_STATE.CONFIG_ROOM;
	obj_gui.selected_room = OneClimateOneSoil;
	obj_gui.container_config_room_1= gui_screen_config_level();
});
_container.AddContent(_button);
yy+=32;
// 

var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Central Climate", function() {
	controller.user_options.room_climate = CLIMATE.TROPICAL;
	controller.user_options.room_soil_type = SOIL.LOAM;
	controller.user_options.spawn_genus = GENUS.PRI_SMALL;
	
	
	
	obj_gui.state = GUI_STATE.CONFIG_ROOM;
	obj_gui.selected_room = CentralClimate;
	obj_gui.container_config_room_1= gui_screen_config_level();
});
_container.AddContent(_button);
yy+=32;



var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Primaries on Bush Crop", function() {
	controller.user_options.room_climate = CLIMATE.TROPICAL;
	controller.user_options.room_soil_type = SOIL.LOAM;
	controller.user_options.spawn_genus = GENUS.PRI_SMALL;
	
	controller.user_options.spawn_quantity = 40;
	controller.user_options.spawn_distance_max = 1;
	
	controller.user_options.spawn_2_genus = GENUS.SEC_SMALL;
	controller.user_options.spawn_2_quantity = 3;
	controller.user_options.spawn_2_distance_max = 1;
	
	controller.user_options.spawn_3_genus = GENUS.PR_CROP_BUSH;
	controller.user_options.spawn_3_quantity = 100;
	controller.user_options.spawn_3_distance_max = 1;
	
	obj_gui.state = GUI_STATE.CONFIG_ROOM;
	obj_gui.selected_room = OneClimateOneSoil;
	obj_gui.container_config_room_1= gui_screen_config_level();
});
_container.AddContent(_button);
yy+=32;





// === options column


yy = 32;

yy+=32;
yy+=32;


var text = new EmuText(OPTIONS_COLUMN_Y, yy, 512, 32, "OPTIONS ");
_container.AddContent(text);
yy+=32;




// === LOGS

// --- general log

var check = new EmuCheckbox(OPTIONS_COLUMN_Y, yy, 256, 32, "Log file", controller.user_options.LOG_ALLOW_LOG, function() {
    controller.user_options.LOG_ALLOW_LOG = value;
});
_container.AddContent(check);
yy+=32;

// --- log world

var check = new EmuCheckbox(OPTIONS_COLUMN_Y  + 32, yy, 256, 32, "Log world summary", controller.user_options.LOG_WORLD, function() {
    controller.user_options.LOG_WORLD = value;
});
_container.AddContent(check);
yy+=32;

// --- log species

var check = new EmuCheckbox(OPTIONS_COLUMN_Y  + 32, yy, 256, 32, "Log species", controller.user_options.LOG_SPECIES, function() {
    controller.user_options.LOG_SPECIES = value;
});
_container.AddContent(check);
yy+=32;

// --- log creatures selected

var check = new EmuCheckbox(OPTIONS_COLUMN_Y + 32, yy, 256, 32, "Log selected creatures", controller.user_options.LOG_CREATURES_FOLLOWING, function() {
    controller.user_options.LOG_CREATURES_FOLLOWING = value;
});
_container.AddContent(check);
yy+=32;

// --- LOG_CREATURES_PRODUCERS

var check = new EmuCheckbox(OPTIONS_COLUMN_Y  + 64, yy, 256, 32, "Include producers", controller.user_options.LOG_CREATURES_PRODUCERS, function() {
    controller.user_options.LOG_CREATURES_PRODUCERS = value;
});
_container.AddContent(check);
yy+=32;


// --- log creatures all

var check = new EmuCheckbox(OPTIONS_COLUMN_Y  + 32, yy, 256, 32, "Log all creatures", controller.user_options.LOG_CREATURES_ALL, function() {
    controller.user_options.LOG_CREATURES_ALL = value;
});
_container.AddContent(check);
yy+=32;



// === simulation size
yy+=64;

var radio = new EmuRadioArray(OPTIONS_COLUMN_Y, yy, 256, 32, "World size:", 2, function() {
    show_debug_message("Cell size: " + string(value) + ".");
	switch(value) {
		case 0: 
			controller.user_options.room_cell_size_px = CELL_SIZE_PX * 4;
		break;
		case 1: 
			controller.user_options.room_cell_size_px = CELL_SIZE_PX * 2;
		break;
		case 2:
			controller.user_options.room_cell_size_px = CELL_SIZE_PX;
		break;
		case 3:
			controller.user_options.room_cell_size_px = CELL_SIZE_PX / 2;
		
	}
});
radio.AddOptions(["Smallest", "Small", "Medium", "Big"]);
radio.SetColumns(4, 160);

_container.AddContent(radio)


return _container;

}

