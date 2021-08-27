function GUI() constructor {


	// --- need one step to finish windows_resize before initializing containers
	//window_initialized = false;
	//all_initialized = false;
	window_center_pending = true;
	
	// --- simulation selected by user. if > 0 simulation will start at step event
	
	simulation_selected = -1;

	// --- screen dimensions
	
	simulation_width = -1;
	simulation_height = -1;
	game_width = -1;
	game_height = -1;
	gui_width = -1;			// size for draw gui events
	gui_height = -1;
	
	// --- screen containers
	
	
	container_main= -1;    // main menu
	container_bar_simulation = -1;   // options bar for simulation screen
	container_escape_screen = -1;	 

	// --- simulation user management
	
	warning_no_creature_alive_issued = false;
	input_show_cell_info = false;
	input_show_creature_info = false;
	showing_debug_data_for_creature = - 1;
	show_escape_screen = false;

	// visible layers status
	layer_soil_visible = -1;
	layer_climate_visible = -1;
	layer_cell_grid_visible = -1;
	layer_tools_visible = -1;

}