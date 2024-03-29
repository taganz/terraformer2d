/*

	Initializes gui containers
  
		container_home, for Room0
		TBD

	This object must be placed in all screens

	GUI library
		https://github.com/DragoniteSpam/Emu/wiki/Emu-Default-Macros


*/


depth = -15000;

// === user settings
options_unlimited_water = DEBUG_RAIN_UNLIMITED;
options_log = new log_user_options();

// === simulation screen
input_show_cell_info = false;
input_show_creature_info = false;
warning_no_creature_alive_issued = - 1;
showing_debug_data_for_creature = - 1;
show_escape_screen = false;

// === home screen
state = 0;					
selected_room = -1;
selected_climate = -1;
selected_soil_type = -1;

// === gui containers for each screen
container_home= -1;
container_config_room_1 = -1;
container_simulation = -1;
container_escape_screen = -1;		 

