function gui_simulation_start(_simulation_id){
	

	// fill room user_options with default values
	
	gui_simulation_set_user_options(_simulation_id);
	
	
	// go to room, controller will be initialized at room start event

	room_goto(controller.user_options.simulation_room);  

	

}
