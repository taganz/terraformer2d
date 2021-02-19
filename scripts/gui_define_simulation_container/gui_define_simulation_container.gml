/* 
 GUI library
		https://github.com/DragoniteSpam/Emu/wiki/Emu-Default-Macros
*/


function gui_define_simulation_container(){
	
var yy = 0;
var _simulation_container = new EmuCore(100, 10, 640, 50);

// === room selection column


var _button = new EmuButton(10, yy, 70, 32, "Slower", function() {
    controller.time.sim_speed_slower();
});
_simulation_container.AddContent(_button);

var _button = new EmuButton(90, yy, 70, 32, "Pause", function() {
	controller.sim_paused = ! controller.sim_paused;
});
_simulation_container.AddContent(_button);

var _button = new EmuButton(170, yy, 70, 32, "Faster", function() {
    controller.time.sim_speed_faster();
});
_simulation_container.AddContent(_button);

var _button = new EmuButton(250, yy, 70, 32, "Options", function() {
	gui_escape_screen_toggle();
});
_simulation_container.AddContent(_button);

return _simulation_container;

}

