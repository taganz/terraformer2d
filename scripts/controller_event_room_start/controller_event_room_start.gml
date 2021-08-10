
function controller_event_room_start(){
	
	with controller {
	
		if room != Room0 {			
			controller_spawn_user_options();
			sim_active = true;
		}	
	}

}