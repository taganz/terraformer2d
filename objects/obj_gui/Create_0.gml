/*

	Initializes gui containers
  
		home_container, for Room0
		TBD

	This object must be placed in all screens

	GUI library
		https://github.com/DragoniteSpam/Emu/wiki/Emu-Default-Macros


*/



gui = new GUI();
show = false;
depth = -15000;

// === menu

options_unlimited_water = DEBUG_RAIN_UNLIMITED;
options_log = LOG_ALLOW_LOG;
home_container = gui_define_home_container();

// === demo screen


escape_screen_container = new EmuCore(32, 32, 640, 640);
gui_define_escape_screen_container(escape_screen_container);
