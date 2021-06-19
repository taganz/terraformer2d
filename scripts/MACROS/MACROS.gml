
function MACROS(){

// === LOG

// see also user_options
#macro DEBUG_VERBOSE				false		// allow verbose
#macro DEBUG_VERBOSE_LOG_ANIMALS	false		// send additional debug info to console for logged animals

// ===	GAME

#macro RANDOMIZE_AT_START		true			// controller will randomize at create event
#macro OBJ_CREATED_BY_CLIC		obj_primary_tiny  // the object that will be created with left click
#macro DEBUG_RAIN_UNLIMITED		false			// climates give 999999 rain water
#macro FILE_GENUS_CSV "genus.csv"

// === ROOM SETUP

#macro LAYER_CLIMATE "climate"
#macro LAYER_SOIL "soil"
// creatures are created at a depth - LAYER_BASE - y   (-16000 < depth < 16000)
#macro LAYER_BASE_PRODUCER 1000
#macro LAYER_BASE_PRIMARY 5000
#macro LAYER_BASE_SECONDARY 10000

// === WORLD 

// mutations
#macro WORLD_RADIATION_DEFAULT      0			
#macro RADIATION_GEN_MUTATION_MIN	0.2			// gen mutation factor in offspring_copy
#macro RADIATION_GEN_MUTATION_MAX	0.7			// gen mutation factor in offspring_copy

#macro WORLD_WRAP_X		true
#macro WORLD_WRAP_Y		true

// terrain
#macro CELL_SIZE_PX				48			// pixel size - screen area (climate cells are 32x32px)
#macro CELL_AREA		15 //		25			// m2 - real world area
#macro CELL_INITIAL_STORED_WATER  0.9		// stored water in cells at creation as a factor of soil saturation water
#macro CELL_MAX_PRODUCERS		10			// producers a cell can hold

// soil
#macro SOIL_DEPTH_MM			1000			// mm - soil depth for available water calculations
#macro SOIL_DEPTH_SMALL_ROOTS	0.1				// small producers root get access to this % PAW
#macro SOIL_WATER_LOSS_DEFAULT	4				// mm/month

#macro NUTRIENT_TILE_OFFSET  1000		// kg
#macro NUTRIENT_TILE_MULTIPLIER  100    // kg multiply with nutrients tile number to obtain nutrients

#macro SOIL_WEIGHT_PER_CELL			 3500 // 1500
//#macro HEIGHT_PLANT_TRESHOLD  5		// the threshold among small and big plants



// === TIME

#macro SIMULATION_SPEED	10					// system steps / sim steps. greater is slower. must be > 1
#macro TIME_SIM_STEPS_PER_MONTH 10			// 


// === CREATURES 

#macro LEAF_M2_PER_KG				0.1			// area/weight ratio for leafs 
#macro PRODUCERS_MAX_HEIGHT			50			// roots will get maximum water at this plant height


// general life constants
#macro BIOMASS_DECOMPOSITION_ZERO  10			// when biomass decompeses under this level instance is destroyed
#macro BIOMASS_DECOMPOSITION_FACTOR 0.4			// per sim_month 
//#macro GENUS_SPAWN_AS_ADULTS true				// if false, depends on variable creature_spawn_as_adult
#macro PRODUCER_BIOMASS_MINIMUM_EAT 0.2		// if producer biomass is less than this fraction of biomass_adult can not be eaten by primaries
#macro PRIMARY_BIOMASS_MINIMUM_EAT 0.1
#macro BIOMASS_LIFE_FRACTION_STARVING 1.2	// if biomass goes below this level creature is_starving

// movement
//#macro PRIMARY_SPEED 20				// (distance per step) 
//#macro SECONDARY_SPEED 50			// (distance per step) 
//#macro PRIMARY_VIEW_DISTANCE 64		// maximum distance to see a threat
//#macro SECONDARY_VIEW_DISTANCE 128 // maximum distance to discover food
//#macro EAT_DISTANCE 16		// maximum distance to eat food
#macro WANDER_MINIMUM_DISTANCE_HOME 48
}



