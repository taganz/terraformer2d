/*

	Initializes gui containers
  
		container_main, for Room0
		TBD

	This object must be placed in all screens

	GUI library
		https://github.com/DragoniteSpam/Emu/wiki/Emu-Default-Macros


*/
function gui_events_create(){

	with obj_gui {
		
		
		// === screen size
		
		gui_set_window_size();
		
		

		depth = -15000;



		// === simulation screen
		input_show_cell_info = false;
		input_show_creature_info = false;
		warning_no_creature_alive_issued = - 1;
		showing_debug_data_for_creature = - 1;
		show_escape_screen = false;

		// === home screen
		//state = GUI_STATE.MENU_INPUT;					



		// === gui containers for each screen
		container_main= -1;    // main menu
		//container_config_room_1 = -1;
		container_bar_simulation = -1;   // options bar for simulation screen
		container_escape_screen = -1;	 

		// === visible layers status
		layer_soil_visible = -1;
		layer_climate_visible = -1;
		layer_cell_grid_visible = -1;
		layer_tools_visible = -1;


	}
}