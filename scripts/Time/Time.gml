/*

  Time handles the different time scales
  - Game Maker steps 
  - Simulation step - creatures uses this one
  - Simulation month - used to calculate water cycle
  
		

*/

function Time() constructor {
	
	current_step = 0;						// system steps counter
	steps_per_sim_step = SIMULATION_SPEED;	// steps to complete a sim_steps 
	
	current_sim_step = 0;					// integer, floor of real	
	sim_step_entry = false;					// first system step for current sim step
	
	current_sim_month = 0;					// a sim_month is TIME_SIM_STEPS_PER_MONTH * sim_step
	sim_month_entry = false;
	_last_sim_month = -1;
	
	current_sim_year = 0;					// a sim_year is 12 * sim_months
	
	flash_50 = false;			// used to do flash efects. true during 50% room_step cycle
	
	// === step
	
	step = function() {
		// system step
		current_step++;
		
		flash_50 = current_step mod room_speed < room_speed/2; 
			
		// sim step change?
		sim_step_entry = current_step mod steps_per_sim_step == 0;
		if sim_step_entry {
			//_current_sim_step_real += sim_steps_per_step;
			current_sim_step++;
			current_sim_month = 1 + ((current_sim_step div TIME_SIM_STEPS_PER_MONTH) mod 12);
			sim_month_entry = current_sim_month != _last_sim_month;
			_last_sim_month = current_sim_month;
			// year
			if sim_month_entry and current_sim_month == 1
				current_sim_year ++;
		}
		else {
			sim_month_entry = false;
		}
	}

	// === speed
	
	sim_speed_faster = function() {
		if controller.sim_paused==false
			if steps_per_sim_step > 1
				steps_per_sim_step --;
	}
	
	sim_speed_slower = function() {
		if controller.sim_paused == false
			steps_per_sim_step++;
	}

//	sim_steps_to_years = function(_sim_step) {
//		return (_sim_step / 12 /  TIME_SIM_STEPS_PER_MONTH); 
//	}

//kg_per_year_to_units = function(kg_year) {
//	return kg_year * SIMULATION_UNITS_PER_KG  * TIME_SIM_STEPS_PER_MONTH * 12 ;
//}

	
}