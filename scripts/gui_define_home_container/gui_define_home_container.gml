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

var _button = new EmuButton(ROOMS_COLUMN_Y, yy, 256, 32, "Room4 - Climates", function() {
    room_goto(Room4);
});
_home_container.AddContent(_button);
yy+=32;

var _button = new EmuButton(ROOMS_COLUMN_Y, yy, 256, 32, "Room3 - Test", function() {
    room_goto(Room3);
});
_home_container.AddContent(_button);
yy+=32;

var _button = new EmuButton(ROOMS_COLUMN_Y, yy, 256, 32, "Room2 - Test", function() {
    room_goto(Room2);
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

var _options_unlimited_water = new EmuCheckbox(OPTIONS_COLUMN_Y, yy, 256, 32, "Unlimited water", obj_gui.options_unlimited_water, function() {
    obj_gui.options_unlimited_water = value;
	show_debug_message("options_unlimited_water: " + (obj_gui.options_unlimited_water ? "on" : "off"));
});
_home_container.AddContent(_options_unlimited_water);
yy+=32;

var _options_unlimited_water = new EmuCheckbox(OPTIONS_COLUMN_Y, yy, 256, 32, "Log", obj_gui.options_log, function() {
    obj_gui.options_log = value;
	show_debug_message("options_log: " + (obj_gui.options_log ? "on" : "off"));
});
_home_container.AddContent(_options_unlimited_water);
yy+=32;

var input_temp = new EmuInput(OPTIONS_COLUMN_Y, yy, 256, 32, "Temperature incr.", 
	string(controller.default_climate_change_temperature_increment), "-50 - 50", 3, E_InputTypes.REAL, function() {
    controller.default_climate_change_temperature_increment = value;
	show_debug_message("options_log: " + (obj_gui.options_log ? "on" : "off"));
});
input_temp.SetRealNumberBounds(-50, 50);
_home_container.AddContent(input_temp);
yy+=32;






return _home_container;

}

