
function MACROS(){

// === LOG

// see log_user_options


// ===	GAME

#macro OBJ_CREATED_BY_CLIC obj_primary_tiny   // the object that will be created with left click
#macro DEBUG_RAIN_UNLIMITED	false // climates give 999999 rain water
#macro FILE_INITIAL_SPECIES_CSV "initial_species.csv"

// === ROOM SETUP

#macro LAYER_CLIMATE "climate"
#macro LAYER_NUTRIENTS "nutrients"
// creatures are created at a depth - LAYER_BASE - y   (-16000 < depth < 16000)
#macro LAYER_BASE_PRODUCER 1000
#macro LAYER_BASE_PRIMARY 5000
#macro LAYER_BASE_SECONDARY 10000

// === WORLD 

#macro CELL_SIZE_PX 64							// pixel size 

#macro ET0_REFERENCE_CROP_EVOTRANSPIRATION		180   // (mm/month) <--- should depend on climate


// cell area
#macro CELL_SIZE_M				10			// m
#macro CELL_AREA				100			// m2 
//#macro WATER_IN_1_MM_AREA		100			// kg


#macro BIOMASS_DECOMPOSITION_FACTOR 0.15  // per sim_step (animals) o sim_month (plants)
#macro NUTRIENT_TILE_OFFSET  1000		// kg
#macro NUTRIENT_TILE_MULTIPLIER  100    // kg multiply with nutrients tile number to obtain nutrients
#macro SIMULATION_WORLD_RADIATION 0.1		// 
#macro SIMULATION_UNITS_PER_KG 1			
//#macro WORLD_WATER_PER_LEAF_KG 2 // 2			// per month
#macro LEAF_M2_PER_KG 1						// area/weight ratio for leafs 
#macro SOIL_WEIGHT_PER_CELL 3500 // 1500
#macro BIOMASS_ADULT_BIG_THRESHOLD  100		// the threshold among small and big plants

// === TIME

#macro SIMULATION_SPEED	10					// system steps / sim steps. greater is slower. must be > 1
#macro TIME_SIM_STEPS_PER_MONTH 10			// 

//#macro SIMULATION_PLANT_CYCLE_SIM_STEPS	 7  // rain, evapotranspiration and plant metabolism is calculate every this sim steps


// === CREATURES 


// general life constants
#macro BIOMASS_DECOMPOSITION_ZERO  10			// when biomass decompeses under this level instance is destroyed
#macro INITIAL_SPECIES_SPAWN_AS_ADULTS true		// if false, depends on variable creature_spawn_as_adult

}



