/* 

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


var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Start here.", function() {
	obj_gui.game_gui.simulation_selected = 1;
});
_container.AddContent(_button);
yy+=32;




var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Pri Tiny on Bush Crop", function() {
	obj_gui.game_gui.simulation_selected = 2;
});
_container.AddContent(_button);
yy+=32;


var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Empty", function() {
	obj_gui.game_gui.simulation_selected = 3;
});
_container.AddContent(_button);
yy+=32;


var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Test climates", function() {
	obj_gui.game_gui.simulation_selected = 4;
});
_container.AddContent(_button);
yy+=32;



var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Climates square", function() {
	obj_gui.game_gui.simulation_selected = 5;
});
_container.AddContent(_button);
yy+=32;



/*

var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Tropical", function() {
	//obj_gui.state = GUI_STATE.LAUNCH_SIMULATION;
	controller.user_options.simulation_room = rm_tropical;
		
	with controller.user_options {
		spawn_genus = GENUS.PR_TREE_5;
		spawn_quantity = 4;
		spawn_distance_max = 1;
		spawn_2_genus = GENUS.PR_TREE_4;
		spawn_2_quantity = 4;
		spawn_2_distance_max = 1;
	}
});
_container.AddContent(_button);
yy+=32;


// separating debug rooms
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
	//obj_gui.state = GUI_STATE.CONFIG_ROOM;
	controller.user_options.simulation_room = OneClimateOneSoil;
	//obj_gui.game_gui.container_config_room_1= gui_screen_config_level();
		
});
_container.AddContent(_button);
yy+=32;




var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Tropical", function() {
	//obj_gui.state = GUI_STATE.LAUNCH_SIMULATION;
	controller.user_options.simulation_room = rm_tropical;
});
_container.AddContent(_button);
yy+=32;


var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "All climates (4)", function() {
	//obj_gui.state = GUI_STATE.LAUNCH_SIMULATION;
	controller.user_options.simulation_room = Room4;
});
_container.AddContent(_button);
yy+=32;


var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Artic", function() {
	//obj_gui.state = GUI_STATE.LAUNCH_SIMULATION;
	controller.user_options.simulation_room = rm_artic;
});
_container.AddContent(_button);
yy+=32;


var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Continental", function() {
	//obj_gui.state = GUI_STATE.LAUNCH_SIMULATION;
	controller.user_options.simulation_room = rm_continental;
});
_container.AddContent(_button);
yy+=32;


var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Desertic", function() {
	//obj_gui.state = GUI_STATE.LAUNCH_SIMULATION;
	controller.user_options.simulation_room = rm_desertic;
});
_container.AddContent(_button);
yy+=32;




var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Debug", function() {
	//obj_gui.state = GUI_STATE.LAUNCH_SIMULATION;
	controller.user_options.simulation_room = rm_debug;
});
_container.AddContent(_button);
yy+=32;





var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Central Climate", function() {
	controller.user_options.room_climate = CLIMATE.TROPICAL;
	controller.user_options.room_soil_type = SOIL.LOAM;
	controller.user_options.spawn_genus = GENUS.PRI_SMALL;
	
	
	
	//obj_gui.state = GUI_STATE.CONFIG_ROOM;
	controller.user_options.simulation_room = CentralClimate;
	//obj_gui.game_gui.container_config_room_1= gui_screen_config_level();
});
_container.AddContent(_button);
yy+=32;



*/


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

var radio = new EmuRadioArray(OPTIONS_COLUMN_Y, yy, 256, 32, "World size:", 1, function() {
    show_debug_message("Cell size: " + string(value) + ".");
	switch(value) {
		case 0: 
			controller.user_options.room_cell_size_px = round(CELL_SIZE_PX * 3);
		break;
		case 1: 
			controller.user_options.room_cell_size_px = round(CELL_SIZE_PX * 1.5);
		break;
		case 2:
			controller.user_options.room_cell_size_px = round(CELL_SIZE_PX);
		break;
		case 3:
			controller.user_options.room_cell_size_px = round(CELL_SIZE_PX / 2);
		
	}
});
radio.AddOptions(["Smallest", "Small", "Medium", "Big"]);
radio.SetColumns(4, 160);

_container.AddContent(radio)


return _container;

}

