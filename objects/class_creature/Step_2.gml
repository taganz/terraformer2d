// Wait till end step to wait for other creatures to eat us...

if controller.time.sim_step_entry and is_producer == false 
	|| controller.time.sim_month_entry and is_producer == true {
		
	LOG(LOGEVENT.CREATURE_BIOMASS, id);
	
	if id.structure.is_dead == false {
		LOG(LOGEVENT.CREATURE_BIOMASS_EAT, id, structure.biomass_eat);
		LOG(LOGEVENT.CREATURE_BIOMASS_BODY, id, structure.biomass_body);
		LOG(LOGEVENT.CREATURE_BIOMASS_REPRODUCTION, id, structure.biomass_reproduction);
		LOG(LOGEVENT.CREATURE_BIOMASS_RESERVE, id); 
	}

}