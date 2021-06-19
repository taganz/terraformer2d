/* 

	When a room is selected
		change to state 1 if room configuration is needed
		change to state 2 if no configuration is needed

	 GUI library
		https://github.com/DragoniteSpam/Emu/wiki/Emu-Default-Macros
*/


function gui_define_container_home(){
	
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

var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Tropical", function() {
	obj_gui.state = GUI_STATE.LAUNCH_SIMULATION;
	obj_gui.selected_room = rm_tropical;
});
_container.AddContent(_button);
yy+=32;

var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Artic", function() {
	obj_gui.state = GUI_STATE.LAUNCH_SIMULATION;
	obj_gui.selected_room = rm_artic;
});
_container.AddContent(_button);
yy+=32;

var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Mediterranean", function() {
	obj_gui.state = GUI_STATE.LAUNCH_SIMULATION;
	obj_gui.selected_room = rm_mediterranean;
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



var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "CarryingCapacity", function() {
	obj_gui.state = GUI_STATE.CONFIG_ROOM;
	obj_gui.selected_room = CarryingCapacity;
});
_container.AddContent(_button);
yy+=32;

var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Add animals", function() {
	controller.user_options.room_climate = CLIMATE.TROPICAL;
	controller.user_options.room_soil_type = SOIL.LOAM;
	controller.user_options.spawn_genus_object = genus_object_from_id(GENUS.PRIMARY_TINY);
	controller.user_options.spawn_quantity = 0;
	controller.user_options.spawn_distance_max = 200;
	controller.user_options.spawn_2_genus_object = genus_object_from_id(GENUS.SECONDARY_SMALL);
	controller.user_options.spawn_2_quantity = 0;
	controller.user_options.spawn_2_distance_max = 200;
	controller.user_options.spawn_3_genus_object = genus_object_from_id(GENUS.CROP_BUSH);
	controller.user_options.spawn_3_quantity = 100;
	controller.user_options.spawn_3_distance_max = 300;
	obj_gui.state = GUI_STATE.CONFIG_ROOM;
	obj_gui.selected_room = OneClimateOneSoil;
	obj_gui.container_config_room_1= gui_define_container_config_room_1();
});
_container.AddContent(_button);
yy+=32;



// 

var _button = new EmuButton(ROOMS_COLUMN_X, yy, 256, 32, "Primaries on Bush Crop", function() {
	controller.user_options.room_climate = CLIMATE.TROPICAL;
	controller.user_options.room_soil_type = SOIL.LOAM;
	controller.user_options.spawn_genus_object = genus_object_from_id(GENUS.PRIMARY_SMALL);
	controller.user_options.spawn_quantity = 30;
	controller.user_options.spawn_distance_max = 200;
	controller.user_options.spawn_2_genus_object = genus_object_from_id(GENUS.SECONDARY_SMALL);
	controller.user_options.spawn_2_quantity = 1;
	controller.user_options.spawn_2_distance_max = 200;
	controller.user_options.spawn_3_genus_object = genus_object_from_id(GENUS.CROP_BUSH);
	controller.user_options.spawn_3_quantity = 100;
	controller.user_options.spawn_3_distance_max = 300;
	obj_gui.state = GUI_STATE.CONFIG_ROOM;
	obj_gui.selected_room = OneClimateOneSoil;
	obj_gui.container_config_room_1= gui_define_container_config_room_1();
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


// --- unlimited water check

var check = new EmuCheckbox(OPTIONS_COLUMN_Y, yy, 256, 32, "Unlimited water", obj_gui.options_unlimited_water, function() {
    obj_gui.options_unlimited_water = value;
	show_debug_message("options_unlimited_water: " + (obj_gui.options_unlimited_water ? "on" : "off"));
});
_container.AddContent(check);
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



// --- temperature input

var input = new EmuInput(OPTIONS_COLUMN_Y, yy, 350, 32, "Temperature incr.", 
	string(controller.user_options.room_temperature_increment), "-50 - 50", 3, E_InputTypes.REAL, function() {
    controller.user_options.room_temperature_increment = value;
});
input.SetRealNumberBounds(-50, 50);
_container.AddContent(input);
yy+=32;

// --- radiation input

var input = new EmuInput(OPTIONS_COLUMN_Y, yy, 350, 32, "Radiation",
	string(controller.user_options.room_world_radiation), "0 - 9", 1, E_InputTypes.REAL, function() {
    controller.user_options.room_world_radiation = value/10;
});
input.SetRealNumberBounds(0, 9);
_container.AddContent(input);
yy+=32;





return _container;

}

