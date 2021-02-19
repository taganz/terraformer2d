
my_cell = 0;

// -- dna

dna = new DNA(initial_specie);    
dna.genome = initial_specie_genome(initial_specie);


// -- state

state = new State_Machine(id, STATE.BORN);
state.state_script[STATE.BORN] = state_born;
state.state_script[STATE.IDLE] = state_idle;
state.state_script[STATE.REPRODUCTION] = state_reproduction;
state.state_script[STATE.DEAD] = state_dead;



// -- structure and morphology defined in children class

/*
// spawn as adult
if creature_spawn_as_adult {
	structure.age = controller.time.years_to_sim_steps(dna.genome[GEN.AGE_ADULT]);
	structure.biomass = structure.age * kg_to_units(dna.genome[GEN.GROWTH_KG_YR]);
	structure.is_adult = true;
	}
*/

