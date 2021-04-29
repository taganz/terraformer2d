
function log_events_creature_dead(_id){
	
		// print a report at console
		log_event(LOGEVENT.CREATURE_DEAD, _id, deadcause_to_string(_id.structure.dead_cause));
		log_event(LOGEVENT.CREATURE_DEAD_INFO, _id,		"dead_cause", deadcause_to_string(_id.structure.dead_cause));
		log_event(LOGEVENT.CREATURE_DEAD_INFO_NUM, _id,	"age", sim_steps_to_years(_id.structure.age));
		log_event(LOGEVENT.CREATURE_DEAD_INFO_NUM, _id,	"biomass", (_id.structure.biomass));
		log_event(LOGEVENT.CREATURE_DEAD_INFO, _id,		"cell", cell_to_string(_id.my_cell));
		
		log_event(LOGEVENT.SPECIE_DEAD, _id);

}