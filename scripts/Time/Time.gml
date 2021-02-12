/*

  Time handles the different time scales
  - Game Maker steps 
  - Simulation step - creatures uses this one
  - Simulation month - used to calculate water cycle
  
		

*/

function Time() constructor {
	
	current_step = 0;
	_current_sim_step_real = 0;		// real number, this is the one we use internally
	current_sim_step = 0;		// integer, floor of real
	sim_steps_per_step = 1 / SIMULATION_SPEED;	// sim_steps increment per step
	
	sim_step_entry = true;			// first system step for current sim step
	_last_sim_step = -1;
	
	current_sim_month = 0;
	sim_month_entry = true;
	_last_sim_month = -1;
	
	current_sim_year = 0;
	
	flash_50 = false;			// used to do flash efects. true during 50% room_step cycle
	
	// === step
	
	step = function() {
		// system step
		current_step++;
		
		flash_50 = current_step mod room_speed < room_speed/2; 
			
		// sim step
		_current_sim_step_real += sim_steps_per_step;
		current_sim_step = floor(_current_sim_step_real);
		sim_step_entry = current_sim_step != _last_sim_step;
		_last_sim_step = current_sim_step;
		// month 
		//current_sim_month = 1 + ((current_sim_step div TIME_SIM_STEPS_PER_MONTH) mod 12);
		current_sim_month = 1 + ((current_sim_step div TIME_SIM_STEPS_PER_MONTH) mod 12);
		sim_month_entry = current_sim_month != _last_sim_month;
		_last_sim_month = current_sim_month;
		// year
		if sim_month_entry and current_sim_month == 1
			current_sim_year ++;
	}



	// === speed
	
	sim_speed_slower = function() {
		if controller.sim_paused==false
			if sim_steps_per_step > 1
				sim_steps_per_step --;
			else
				controller.sim_paused = true;
	}
	
	sim_speed_faster = function() {
		if controller.sim_paused == true
			controller.sim_paused = false
		else
			sim_steps_per_step++;
	}

	// === conversions
	
	years_to_sim_steps = function(_year) {
		//return _year / SIMULATION_YEARS_PER_SECOND * sim_speed * room_speed ;
		return _year * 12 * TIME_SIM_STEPS_PER_MONTH;
	}
	sim_steps_to_years = function(_sim_step) {
		return (_sim_step / 12 /  TIME_SIM_STEPS_PER_MONTH); 
	}

	kg_per_year_to_units_per_sim_step = function(kg_year) {
		return kg_year * SIMULATION_UNITS_PER_KG  * TIME_SIM_STEPS_PER_MONTH * 12 ;
	}

		
	
}