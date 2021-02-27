 /// @description Log biomass
// Puede escribir su código en este editor

if controller.time.sim_step_entry {
	LOG(LOGEVENT.CREATURE_BIOMASS, id);
	
	if id.structure.is_dead == false {
		LOG(LOGEVENT.CREATURE_BIOMASS_EAT, id, structure.biomass_eat);
		LOG(LOGEVENT.CREATURE_BIOMASS_BODY, id, structure.biomass_body);
		LOG(LOGEVENT.CREATURE_BIOMASS_REPRODUCTION, id, structure.biomass_reproduction);
		LOG(LOGEVENT.CREATURE_BIOMASS_RESERVE, id); 
	}

}