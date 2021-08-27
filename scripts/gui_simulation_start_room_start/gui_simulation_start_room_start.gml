// sim initialization code to be run once the room has started
function gui_simulation_start_room_start(){

	// set camera and viewport
	
	with obj_gui.game_gui {
		view_enabled = true;
	
		// left part of screen show room part used for simulation 
		// we make a specific viwport for this part to enable zoom on simulation
		view_visible[0] = true;
		view_xport[0] = 0;
		view_yport[0] = 0;
		view_wport[0] = simulation_width;
		view_hport[0] = simulation_height;
		view_camera[0] = camera_create_view(0, 0, ROOM_SIM_WIDTH, ROOM_SIM_HEIGHT);		
		camera_set_view_pos(view_camera[0], 0, 0);

		// right part of screen show simulation bar
		view_visible[1] = true;
		view_xport[1] = simulation_width+1;
		view_yport[1] = 0;
		view_wport[1] = game_width - simulation_width;
		view_hport[1] = simulation_height;
		view_camera[1] = camera_create_view(ROOM_SIM_WIDTH, 0, ROOM_BAR_WIDTH, ROOM_BAR_HEIGHT);		
		//view_camera[1] = camera_create_view(EMU_HIDE_OFFSET, EMU_HIDE_OFFSET, room_width, room_height);		
		camera_set_view_pos(view_camera[1], ROOM_SIM_WIDTH, 0);
	}


	// reset controller
	
	controller_sim_start();
	
	controller.sim_paused = true;
	global.debug = false;
	controller.debug_morphology_creatures_as_dots = false;
	obj_gui.game_gui.warning_no_creature_alive_issued = false;


	// spawn initial creatures
	
	controller_spawn_user_options();
	
	// start controller
	
	controller.sim_active = true;


}