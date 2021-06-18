
// -- our place in the world

my_cell = 0;

// -- dna

genome = genome_create(genus);

// we put code from both animal and plants here to simplify things. this is to differenciate them

is_plant = genome[GEN.TROPHIC_LEVEL] == TROPHIC_LEVEL.PRODUCER;
is_primary = genome[GEN.TROPHIC_LEVEL] == TROPHIC_LEVEL.PRIMARY;
is_secondary = genome[GEN.TROPHIC_LEVEL] == TROPHIC_LEVEL.SECONDARY;


// -- structure 

structure = new Structure(id, creature_spawn_as_adult);

// -- brain

brain = new Brain();


// -- morphology

morphology = new Morphology(id);   // will be initialized at state_born


// -- state

state = new State_Machine(id, STATE.BORN);
state.state_script[STATE.BORN] = state_born;
state.state_script[STATE.IDLE] = state_idle;
state.state_script[STATE.REPRODUCTION] = state_reproduction;
state.state_script[STATE.ESCAPE] = state_escape;
state.state_script[STATE.DEAD] = state_dead;
	
switch (id.genome[GEN.TROPHIC_LEVEL]) {
	case TROPHIC_LEVEL.PRODUCER:
		state.state_script[STATE.EAT] = -1;    // plants get water from world
		break;
	case TROPHIC_LEVEL.PRIMARY:
	case TROPHIC_LEVEL.SECONDARY:
		state.state_script[STATE.EAT] = state_eat;
		break;
	default:
		ASSERT(false, id, "invalid trophic level");
}


