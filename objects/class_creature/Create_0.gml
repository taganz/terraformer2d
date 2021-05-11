
// -- our place in the world

my_cell = 0;

// -- dna

genome = genome_create(genus);

// we put code from both animal and plants here to simplify things. this is to differenciate them

is_plant = genome[GEN.TROPHIC_LEVEL] == TROPHIC_LEVEL.PRODUCER;


// -- structure 

structure = new Structure(id, creature_spawn_as_adult);

last_prey_eaten = -1;			// TBC

// -- morphology

if is_plant {
	morphology = new Morphology_Plant(id);   // will be initialized at state_born
}
else {
	morphology = new Morphology_Animal(id);
}


// -- state

state = new State_Machine(id, STATE.BORN);
state.state_script[STATE.BORN] = state_born;
state.state_script[STATE.IDLE] = state_idle;
state.state_script[STATE.REPRODUCTION] = state_reproduction;
state.state_script[STATE.DEAD] = state_dead;
	
if is_plant {
	state.state_script[STATE.EAT] = -1;    // plants get water from world
}
else {	
	state.state_script[STATE.EAT] = state_eat_primary;
}


