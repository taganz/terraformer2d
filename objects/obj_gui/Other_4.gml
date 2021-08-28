/// @description Init simulation


switch(room) {
	
	case Room0:
	break;
	
	case Room1: 
	
		with obj_gui.game_gui {
		
			if window_center_pending {
				window_center();
				surface_resize(application_surface, game_width, game_height);
				window_center_pending = false;
			}
		
		
			// reset simulation selected flag
	
			simulation_selected = -1;


			// initialize gui containers
	
			if container_main == -1 {
				container_main = gui_screen_main();	
			}

		}
		break;
		
	default:
		
		// initialize simulation when entering simulation room

		gui_simulation_start_room_start();
	
		
		// initialize gui containers
	
		if game_gui.container_bar_simulation != -1 {
			// destroy previous core to reset widgets 
			game_gui.container_bar_simulation.Destroy();
		}	
		game_gui.container_bar_simulation = gui_screen_bar_simulation();

		if game_gui.container_escape_screen == -1 {
			game_gui.container_escape_screen = gui_screen_escape();
		}

		// log status

		gui_status_log();

	}


//surface_resize(application_surface, display_get_gui_width(), display_get_gui_height());
//surface_resize(application_surface, obj_gui.game_gui.game_width, obj_gui.game_gui.game_height);










