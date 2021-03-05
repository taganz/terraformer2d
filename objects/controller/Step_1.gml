

if room != Room0 {

	if !controller.sim_paused {

		// === update time
		
		time.step();

		// === rain
				
		// once per month
		if time.sim_month_entry
				world.rain();		
	

	}
}
	