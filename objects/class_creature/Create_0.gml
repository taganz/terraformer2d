
// -- our place in the world

my_cell = 0;

// -- dna

dna = new DNA(initial_specie);    
dna.genome = initial_specie_genome(initial_specie);
is_producer = dna.genome[GEN.TROPHIC_LEVEL] == TROPHIC_LEVEL.PRODUCER;

// -- state

state = new State_Machine(id, STATE.BORN);
state.state_script[STATE.BORN] = state_born;
state.state_script[STATE.IDLE] = state_idle;
state.state_script[STATE.REPRODUCTION] = state_reproduction;
state.state_script[STATE.DEAD] = state_dead;


// -- structure and morphology defined in children class


