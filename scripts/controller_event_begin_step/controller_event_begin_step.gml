
function controller_event_begin_step(){
	with controller {
		
		if sim_active {

			if !controller_is_paused() {

				// === update time
		
				time.step();

				// === rain
				
				// once per month
				if time.sim_month_entry
					grid_do_rain();		
	
			}
		}

	}
}