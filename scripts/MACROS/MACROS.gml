
function MACROS(){
	
// ===	GAME

//#macro FIRST_ROOM Room4
#macro TBD assert(false, "********** Not implemented!  *******");
#macro OBJ_CREATED_BY_CLIC obj_primary_tiny   // the object that will be created with left click
#macro DEBUG_RAIN_UNLIMITED	false // climates give 999999 rain water

// === LOG 

#macro LOG_ALLOW_LOG			false		// main log switch. if false, no log file is created
#macro LOG_CREATURE_TO_FOLLOW	100018 
#macro LOG_IF_SHIFT_PRESSED		true		// log() will output only if shift is pressed
#macro LOG_CREATURES_FOLLOWING	true		// log all CREATURE events
#macro LOG_CREATURES_ALL		false		// false = log CREATURE events only for followed creature
#macro LOG_WORLD				true		// log WORLD events
#macro LOG_BORN_DEAD_SUMMARY	true		// log info at birth and dead for all creatures


// === ROOM SETUP

#macro LAYER_CLIMATE "climate"
#macro LAYER_NUTRIENTS "nutrients"
// creatures are created at a depth - LAYER_BASE - y   (-16000 < depth < 16000)
#macro LAYER_BASE_PRODUCER 1000
#macro LAYER_BASE_PRIMARY 5000
#macro LAYER_BASE_SECONDARY 10000

// === WORLD 

#macro CELL_SIZE 64		// default CELL_SIZE 32
#macro BIOMASS_DECOMPOSITION_FACTOR 0.15  // per sim_step (animals) o sim_month (plants)
#macro NUTRIENT_TILE_OFFSET  1000		// kg
#macro NUTRIENT_TILE_MULTIPLIER  100    // kg multiply with nutrients tile number to obtain nutrients
#macro SIMULATION_WORLD_RADIATION 0.1		// 
#macro SIMULATION_UNITS_PER_KG 1			// 
#macro WORLD_WATER_PER_LEAF_KG 2 // 2			// per month
#macro SOIL_FIELD_CAPACITY 0.5 //  (gr water/ gr dry soil), depends on soil type (field capacity - wilting point)
#macro SOIL_WEIGHT_PER_CELL 3500 // 1500

// === TIME

#macro SIMULATION_SPEED	10					// system steps / sim steps. greater is slower. must be > 1
#macro TIME_SIM_STEPS_PER_MONTH 10			// 

//#macro SIMULATION_PLANT_CYCLE_SIM_STEPS	 7  // rain, evapotranspiration and plant metabolism is calculate every this sim steps


// === CREATURES 


// general life constants
//#macro BIOMASS_MAX_MINIMUM_FRACTION_LIVE  0.5  // a plant will die if it reduces biomass under this level
#macro BIOMASS_DECOMPOSITION_ZERO  10			// when biomass decompeses under this level instance is destroyed


}



