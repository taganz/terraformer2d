
/*

    state_born

	updates
		world, craature born
		my_cell
		next_state

*/

function state_born(_id){

	ASSERT(state_entry, _id, "state born reentry? ");
	
	// can not put this at create event to assure controller has already created world
	controller.world.creature_born(_id, _id.x, _id.y);
	_id.my_cell = controller.world.get_cell(_id.x, _id.y);

	
		
	// log parameters	
	with _id.structure {
		LOG(LOGEVENT.CREATURE_BORN, _id);
		LOG(LOGEVENT.INFO_CREATURE, _id, "specie: "+string(_id.dna.genome[GEN.NAME]));
		LOG(LOGEVENT.INFO_CREATURE, _id, "age: "+ string(sim_steps_to_years(_id.structure.age))+"y");
		//LOG(LOGEVENT.INFO_CREATURE, _id, "age_adult: "+string(sim_steps_to_years(age_adult))+"y ");
		LOG(LOGEVENT.INFO_CREATURE, _id, "age_die: "+string(sim_steps_to_years(age_die))+"y ");
		LOG(LOGEVENT.INFO_CREATURE, _id, "biomass: "+string(units_to_kg(biomass))+"kg ");
		LOG(LOGEVENT.INFO_CREATURE, _id, "biomass birth: "+string(units_to_kg(_id.dna.genome[GEN.BIOMASS_BIRTH]))+"kg ");
		LOG(LOGEVENT.INFO_CREATURE, _id, "biomass reproduction: "+string(units_to_kg(_id.dna.genome[GEN.BIOMASS_REPRODUCTION]))+"kg ");
		LOG(LOGEVENT.INFO_CREATURE, _id, "biomass adult: "+string(units_to_kg(_id.dna.genome[GEN.BIOMASS_ADULT]))+"kg ");
		LOG(LOGEVENT.INFO_CREATURE, _id, "generation: "+string(generation));
		LOG(LOGEVENT.INFO_CREATURE, _id, "reproduction_interval: "+ string(sim_steps_to_years(reproduction_interval))+"y");
		LOG(LOGEVENT.INFO_CREATURE, _id, "reproduction_distance: "+ string(reproduction_distance));
		LOG(LOGEVENT.INFO_CREATURE, _id, "cell: "+ _id.my_cell.to_string());
	}
	
	
	_id.state.next_state = STATE.IDLE;
		
}