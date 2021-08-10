
function controller_event_begin_step(){
	with controller {
		
		if room != Room0 {

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