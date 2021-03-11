// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function log_events_creature_dead(_id){
	
		// print a report at console
		//LOG_ID(_id, "DEAD - age: "+string(_id.structure.age)+" biomass: "+string(_id.structure.biomass));
		//log_event(LOGEVENT.CREATURE_DEAD, _id);
		log_event(LOGEVENT.CREATURE_DEAD, _id, deadcause_to_string(_id.structure.dead_cause));
		log_event(LOGEVENT.CREATURE_DEAD_INFO, _id, "dead_cause", deadcause_to_string(_id.structure.dead_cause));
		//log_event(LOGEVENT.CREATURE_DEAD_INFO, _id, "GEN.INITIAL_SPECIE_NAME", string(_id.genome[GEN.INITIAL_SPECIE_NAME]));
		//log_event(LOGEVENT.CREATURE_CREATURE_DEAD_INFOBORN_INFO, _id, "GEN.SPECIE_CODE", _id.genome([GEN.SPECIE_CODE]));
		log_event(LOGEVENT.CREATURE_DEAD_INFO_NUM, _id, "age", sim_steps_to_years(_id.structure.age));
		//log_event(LOGEVENT.CREATURE_BORN_INFO, _id, "DEPRECATED_AGE_ADULT: "+string(sim_steps_to_years(DEPRECATED_AGE_ADULT))+"y ");
		//log_event(LOGEVENT.CREATURE_DEAD_INFO, _id, "age_die", string(sim_steps_to_years(age_die))+"y ");
		log_event(LOGEVENT.CREATURE_DEAD_INFO_NUM, _id, "biomass", units_to_kg(_id.structure.biomass));
		//log_event(LOGEVENT.CREATURE_DEAD_INFO, _id, "biomass birth", string(units_to_kg(_id.genome[GEN.BIOMASS_BIRTH]))+"kg ");
		//log_event(LOGEVENT.CREATURE_DEAD_INFO, _id, "biomass reproduction", string(units_to_kg(_id.genome[GEN.DEPRECATED_BIOMASS_REPRODUCTION]))+"kg ");
		//log_event(LOGEVENT.CREATURE_DEAD_INFO, _id, "biomass adult", string(units_to_kg(_id.genome[GEN.BIOMASS_ADULT]))+"kg ");
		//log_event(LOGEVENT.CREATURE_DEAD_INFO, _id, "generation", string(generation));
		//log_event(LOGEVENT.CREATURE_DEAD_INFO, _id, "_reproduction_interval", string(sim_steps_to_years(_reproduction_interval))+"y");
		//log_event(LOGEVENT.CREATURE_DEAD_INFO, _id, "_reproduction_distance", string(_reproduction_distance));
		log_event(LOGEVENT.CREATURE_DEAD_INFO, _id, "cell", cell_to_string(_id.my_cell));
		
		log_event(LOGEVENT.SPECIE_CLIMATE_DEAD, _id);

}