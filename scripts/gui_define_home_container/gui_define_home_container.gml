/* 
 GUI library
		https://github.com/DragoniteSpam/Emu/wiki/Emu-Default-Macros
*/

#macro ROOMS_COLUMN_Y 32
#macro OPTIONS_COLUMN_Y 400

function gui_define_home_container(){
	
var _home_container = new EmuCore(32, 32, 640, 640);

// === room selection column

var yy = 32;

var _button = new EmuButton(ROOMS_COLUMN_Y, yy, 256, 32, "Tropical", function() {
    room_goto(rm_tropical);
});
_home_container.AddContent(_button);
yy+=32;

var _button = new EmuButton(ROOMS_COLUMN_Y, yy, 256, 32, "Artic", function() {
    room_goto(rm_artic);
});
_home_container.AddContent(_button);
yy+=32;

var _button = new EmuButton(ROOMS_COLUMN_Y, yy, 256, 32, "Mediterranean", function() {
    room_goto(rm_mediterranean);
});
_home_container.AddContent(_button);
yy+=32;

var _button = new EmuButton(ROOMS_COLUMN_Y, yy, 256, 32, "Continental", function() {
    room_goto(rm_continental);
});
_home_container.AddContent(_button);
yy+=32;


var _button = new EmuButton(ROOMS_COLUMN_Y, yy, 256, 32, "Desertic", function() {
    room_goto(rm_desertic);
});
_home_container.AddContent(_button);
yy+=32;


var _button = new EmuButton(ROOMS_COLUMN_Y, yy, 256, 32, "Climate test (2)", function() {
    room_goto(Room2);
});
_home_container.AddContent(_button);
yy+=32;

var _button = new EmuButton(ROOMS_COLUMN_Y, yy, 256, 32, "All climates (4)", function() {
    room_goto(Room4);
});
_home_container.AddContent(_button);
yy+=32;

var _button = new EmuButton(ROOMS_COLUMN_Y, yy, 256, 32, "Debug", function() {
    room_goto(rm_debug);
});
_home_container.AddContent(_button);
yy+=32;



var _button = new EmuButton(ROOMS_COLUMN_Y, yy, 256, 32, "Room1 - Test", function() {
    room_goto(Room1);
});
_home_container.AddContent(_button);
yy+=32;




// === options column
yy = 32;

var text = new EmuText(OPTIONS_COLUMN_Y, yy, 512, 32, "OPTIONS ");
_home_container.AddContent(text);
yy+=32;


// --- unlimited water check

var check = new EmuCheckbox(OPTIONS_COLUMN_Y, yy, 256, 32, "Unlimited water", obj_gui.options_unlimited_water, function() {
    obj_gui.options_unlimited_water = value;
	show_debug_message("options_unlimited_water: " + (obj_gui.options_unlimited_water ? "on" : "off"));
});
_home_container.AddContent(check);
yy+=32;



// === LOGS

// --- general log

var check = new EmuCheckbox(OPTIONS_COLUMN_Y, yy, 256, 32, "Log file", obj_gui.options_log.LOG_ALLOW_LOG, function() {
    obj_gui.options_log.LOG_ALLOW_LOG = value;
});
_home_container.AddContent(check);
yy+=32;


// --- log creatures selected

var check = new EmuCheckbox(OPTIONS_COLUMN_Y + 32, yy, 256, 32, "Log selected creatures", obj_gui.options_log.LOG_CREATURES_FOLLOWING, function() {
    obj_gui.options_log.LOG_CREATURES_FOLLOWING = value;
});
_home_container.AddContent(check);
yy+=32;

// --- log creatures all

var check = new EmuCheckbox(OPTIONS_COLUMN_Y  + 32, yy, 256, 32, "Log all creatures", obj_gui.options_log.LOG_CREATURES_ALL, function() {
    obj_gui.options_log.LOG_CREATURES_ALL = value;
});
_home_container.AddContent(check);
yy+=32;

// --- log summary

var check = new EmuCheckbox(OPTIONS_COLUMN_Y  + 32, yy, 256, 32, "Log summary", obj_gui.options_log.LOG_BORN_DEAD_SUMMARY, function() {
    obj_gui.options_log.LOG_BORN_DEAD_SUMMARY = value;
});
_home_container.AddContent(check);
yy+=32;

// --- log world

var check = new EmuCheckbox(OPTIONS_COLUMN_Y  + 32, yy, 256, 32, "Log world population", obj_gui.options_log.LOG_WORLD, function() {
    obj_gui.options_log.LOG_WORLD = value;
});
_home_container.AddContent(check);
yy+=32;



// --- temperature input

var input = new EmuInput(OPTIONS_COLUMN_Y, yy, 350, 32, "Temperature incr.", 
	string(controller.default_climate_change_temperature_increment), "-50 - 50", 3, E_InputTypes.REAL, function() {
    controller.default_climate_change_temperature_increment = value;
});
input.SetRealNumberBounds(-50, 50);
_home_container.AddContent(input);
yy+=32;

// --- radiation input

var input = new EmuInput(OPTIONS_COLUMN_Y, yy, 350, 32, "Radiation", 
	string(controller.default_world_radiation), "0 - 1", 5, E_InputTypes.REAL, function() {
    controller.default_world_radiation = value;
});
input.SetRealNumberBounds(0, 1);
_home_container.AddContent(input);
yy+=32;





return _home_container;

}

