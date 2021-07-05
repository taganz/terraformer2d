
function log_creature_dead(_id){
	
	// update stats
	
	if _id.structure.dead_cause != DEADCAUSE.BIRTH {
		
		with controller.world {	
				creatures_live_now --;
				trophic_level_live_now[_id.genome[GEN.TROPHIC_LEVEL]]--;
				creatures_dead ++;
				creatures_peak = creatures_peak <= creatures_live_now ? creatures_live_now : creatures_peak;
		}
	
		controller.species.genus_population[@ _id.genome[GEN.GENUS_ID]]--;
		ASSERT(controller.species.genus_population[@ _id.genome[GEN.GENUS_ID]]>=0, _id, "log_creature_dead  genus_population < 0");
	}	
		
	// log file
	
		log_verbose(_id, "DEAD! "+ deadcause_to_string(_id.structure.dead_cause));

		log_event(LOGEVENT.CREATURE_DEAD, _id); //, deadcause_to_string(_id.structure.dead_cause));
		log_event(LOGEVENT.SPECIE_DEAD, _id);

		
		
		log_event(LOGEVENT.CREATURE_DEAD_INFO, _id,		"dead_cause", deadcause_to_string(_id.structure.dead_cause));
		log_event(LOGEVENT.CREATURE_DEAD_INFO_NUM, _id,	"age", sim_steps_to_years(_id.structure.age));
		log_event(LOGEVENT.CREATURE_DEAD_INFO_NUM, _id,	"biomass", (_id.structure.biomass));
		log_event(LOGEVENT.CREATURE_DEAD_INFO, _id,		"cell", cell_to_string(_id.my_cell));
		log_event(LOGEVENT.CREATURE_DEAD_INFO_NUM, _id,	"reproduction_count", (_id.structure.reproduction_count));
		log_event(LOGEVENT.CREATURE_DEAD_INFO_NUM, _id,	"reproduction_offspring_count", (_id.structure.reproduction_offspring_count));
		

}