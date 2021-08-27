/*

	Stores user options
	
	Modified by obj_gui and consumed by controller 
	
*/

// there are 4 types of log events
//  INFO_			logged always if ALLOW_LOG is selected
//  CREATURE_		logged if CREATURES_FOLLOWIN or CREATURES_ALL is selected
//  SPECIES_		logged if BORN_DEAD_SUMMARY is selected
//  WORLD_			logged if WORLD is selected


#macro SIM_LOG_FILE_NAME "SIM_LOG"
#macro CSV_SEPARATOR ";"
#macro LOG_MAXIMUM_CREATURES_ALL	1000	// when number of creatures exceed this stops logging LOG_CREATURES_ALL
#macro LOG_MAXIMUM_YEAR				999		// will not log events after this year (powerbi app limit)

function User_options() constructor {


	// === log
#macro LOG_CREATURE_FOLLOWING_FOLLOW_CHILDREN true  // first child of followed creature is also followed	
	LOG_ALLOW_LOG				= true;		// main log switch. if false, no log file is created
	LOG_CREATURES_FOLLOWING		= false;	// log all CREATURE events
	LOG_CREATURES_ALL			= false;	// false = log CREATURE events only for followed creature
	LOG_SPECIES					= false;	// log info at birth and dead for all creatures
	LOG_WORLD					= true;		// log WORLD events

	LOG_CREATURES_PRODUCERS		= true;	// log_creature events applies to producers
	log_user_spawned_creatures	= true;		// set log for user spawned creatures


	// === room config
	
	simulation_room = -1;
	simulation_id = -1;

	unlimited_water = DEBUG_RAIN_UNLIMITED;

	room_cell_size_px = CELL_SIZE_PX;

	room_world_radiation = WORLD_RADIATION_DEFAULT;
	room_temperature_increment = 0;
	
	room_configurable_climate = false;	// non configurable room have climate and soil defined in room editor
									// configurable rooms have at least one emtpy climate/soil tiles to be 
									// configured by user
									// this variable is set to true if some 0 tile is detected
	room_configurable_soil = false
	
	room_climate = CLIMATE.TROPICAL;	// type 0 climate tiles will be replaced with this value
	room_soil_type = SOIL.LOAM;			// type 0 soil tiles will be replaced with this value
	
	simulation_width = -1;
	simulation_height = -1;
	
	spawn_genus = -1;		// creature object to be spawned at room start
	spawn_quantity = 0;
	spawn_distance_max = 1;		// 1=all area, 0=centeer
	spawn_log_probability = 0;	// fraction of spawned creatures market with log flag
	
	spawn_2_genus = -1;		// creature object to be spawned at room start
	spawn_2_quantity = 0;
	spawn_2_distance_max = 1;
	spawn_2_log_probability = 0;	// fraction of spawned creatures market with log flag
	
	spawn_3_genus = -1;		// creature object to be spawned at room start
	spawn_3_quantity = 0;
	spawn_3_distance_max = 1;
	spawn_3_log_probability = 0;	// fraction of spawned creatures market with log flag
	
	
	//
	
	

	genus_spawn_on_click = GENUS.PRI_TINY;
	genus_spawn_on_click_quantity = 1;
	
}



