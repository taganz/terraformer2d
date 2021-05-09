/*

	Stores user options
	
	Modified by obj_gui and consumed by controller 
	
*/

// there are 4 types of log events
//  INFO_			logged always if ALLOW_LOG is selected
//  CREATURE_		logged if CREATURES_FOLLOWIN or CREATURES_ALL is selected
//  SPECIES_		logged if BORN_DEAD_SUMMARY is selected
//  WORLD_			logged if WORLD is selected


#macro BUFFER_LINES 5000
#macro SIM_LOG_FILE_NAME "SIM_LOG"
#macro CSV_SEPARATOR ";"
#macro LOG_MAXIMUM_CREATURES_ALL	100		// when number of creatures exceed this stops logging LOG_CREATURES_ALL
#macro LOG_MAXIMUM_YEAR				999		// will not log events after this year (powerbi app limit)

function User_options() constructor {


	// === log
#macro LOG_CREATURE_FOLLOWING_FOLLOW_CHILDREN true  // first child of followed creature is also followed	
	LOG_ALLOW_LOG				= false;	// main log switch. if false, no log file is created
	LOG_CREATURES_FOLLOWING		= false;	// log all CREATURE events
	LOG_CREATURES_ALL			= false;	// false = log CREATURE events only for followed creature
	LOG_SPECIES		= false;	// log info at birth and dead for all creatures
	LOG_WORLD					= false;	// log WORLD events
	log_user_spawned_creatures	= true;		// set log for user spawned creatures


	// === world

	climate_replace = -1;			// if > 0 all climate tiles will be replaced with this value
	soil_type_replace = -1;			// if > 0 all soil tiles will be replaced with this value
	default_world_radiation = WORLD_RADIATION_DEFAULT
	default_climate_change_temperature_increment = 0;


	object_spawn_on_click = 8;
	
	object_spawn_on_click_options = [
									"obj_plant_tree"
									, "obj_tree_tropical"
									, "obj_tree_continental"
									, "obj_tree_continental_2"
									, "obj_plant_desert"
									, "obj_plant_bush"
									, "obj_plant_bush_2"
									, "obj_crop_bush"
									, "obj_plant_artic"
									, "obj_primary_small"
									, "obj_primary_tiny" 
									, "obj_secondary_small"
									];
	
	object_spawn_on_click_objects = [
									obj_plant_tree
									, obj_tree_tropical
									, obj_tree_continental
									, obj_tree_continental_2
									, obj_plant_desert
									, obj_plant_bush
									, obj_plant_bush_2
									, obj_crop_bush
									, obj_plant_artic
									, obj_primary_small 
									, obj_primary_tiny 
									, obj_secondary_small
									];

}



