// resize game window. change will be effective next step

function gui_game_set_windows_size(){

	show_debug_message("*** Initializating screen");

	
	// --- check device display size
	
	var display_w = display_get_width();
	var display_h = display_get_height();
	show_debug_message("* Device screen size - display_w/h: "+string(display_get_width())+"x"+string(display_get_height()));

	// --- chose game/simulation/gui sizes depending on device display size

	with obj_gui.game_gui {
		
		if display_w >= 2400 and display_h >= 1200 {
			
			/* surface - to be confirmed
			game_width = 2400;
			game_height = 1200;
			simulation_width = 1800;
			simulation_height = 1200;
			gui_width = 1200;
			gui_height = 700;
			*/
			game_width = 1400;
			game_height = 800;
			simulation_width = 1100;     // barra ha de ser 300? <--
			simulation_height = 800;
			gui_width = 800;
			gui_height = 600;
		
		}
		else if display_w >= 1200 and display_h >= 800 {
			game_width = 1200;
			game_height = 800;
			simulation_width = 900;
			simulation_height = 800;
			gui_width = 1200;
			gui_height = 700;
		}
		else if display_w >= 1200 and display_h >= 700 {
			game_width = 1200;
			game_height = 700;
			simulation_width = 800;
			simulation_height = 700;
			gui_width = 1200;
			gui_height = 700;
		}	
		else {
			show_message("SCREEN IS TO SMALL. CHECK GAME_WIDTH / ROOM_height");
			game_width = 1200;
			game_height = 700;
			simulation_width = 800;
			simulation_height = 700;
			gui_width = 1200;
			gui_height = 700;
		}
		


	
	
	bar_width = game_width - simulation_width;
	bar_height = game_height;


	// --- set windows size. one step later will set other values
	
	show_debug_message("* Changing windows size (windows_set_size) to: "+string(game_width)+"x"+string(game_height));
	window_set_size( game_width, game_height);

	
	// --- seg gui size, this is used in Draw GUI Events
	
	display_set_gui_size(gui_width, gui_height);
	show_debug_message("* Display gui size changed to: "+string(display_get_gui_width())+"x"+string(display_get_gui_height()));
			
	}	

	
	
}