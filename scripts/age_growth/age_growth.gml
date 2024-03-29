/*

	to be called at each sim_step_entry or sim_month_entry
	
	updates
		age: increments 1 sim_step for consumers, 1 month for producers
		age_is_adult
		is_dead
		dead_cause  DEADCAUSE.OLD
	
*/	

function age_growth(_id){

	ASSERT(controller.time.sim_step_entry, 0, "age_growth invalid call");
	
	with _id.structure {
	
		age += _id.is_plant ? TIME_SIM_STEPS_PER_MONTH : 1;					// sim_steps
		

		// -- to old?
		
		if age > age_die {
			is_dead = true;
			dead_cause = DEADCAUSE.OLD;
		}
				

	}
}

