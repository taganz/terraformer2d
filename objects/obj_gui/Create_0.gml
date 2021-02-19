/*

	Initializes gui containers
  
		home_container, for Room0
		TBD

	This object must be placed in all screens

	GUI library
		https://github.com/DragoniteSpam/Emu/wiki/Emu-Default-Macros


*/



	
//scribble_add_font("fnt_small");
	
gui = new GUI();
show_escape_screen = false;
depth = -15000;

// === user settings
options_unlimited_water = DEBUG_RAIN_UNLIMITED;
options_log = LOG_ALLOW_LOG;

// === gui containers
home_container = -1;
simulation_container = -1;
escape_screen_container = -1;		// 
