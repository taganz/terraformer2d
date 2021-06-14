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
#macro LOG_MAXIMUM_CREATURES_ALL	1000	// when number of creatures exceed this stops logging LOG_CREATURES_ALL
#macro LOG_MAXIMUM_YEAR				999		// will not log events after this year (powerbi app limit)

function User_options() constructor {


	// === log
#macro LOG_CREATURE_FOLLOWING_FOLLOW_CHILDREN true  // first child of followed creature is also followed	
	LOG_ALLOW_LOG				= false;	// main log switch. if false, no log file is created
	LOG_CREATURES_FOLLOWING		= true;		// log all CREATURE events
	LOG_CREATURES_ALL			= false;	// false = log CREATURE events only for followed creature
	LOG_SPECIES					= false;	// log info at birth and dead for all creatures
	LOG_WORLD					= true;		// log WORLD events

	LOG_CREATURES_PRODUCERS		= false;	// log_creature events applies to producers
	log_user_spawned_creatures	= true;		// set log for user spawned creatures


	// === room config

	room_world_radiation = WORLD_RADIATION_DEFAULT;
	room_temperature_increment = 0;
	
	room_climate = -1;			// if > 0 all climate tiles will be replaced with this value
	room_soil_type = -1;			// if > 0 all soil tiles will be replaced with this value
	
	spawn_genus_object = -1;		// creature object to be spawned at room start
	spawn_quantity = 30;
	spawn_distance_max = 200;
	spawn_log_probability = 0.1;	// fraction of spawned creatures market with log flag
	
	spawn_2_genus_object = -1;		// creature object to be spawned at room start
	spawn_2_quantity = 10;
	spawn_2_distance_max = 150;
	spawn_2_log_probability = 0.1;	// fraction of spawned creatures market with log flag
	
	
	//
	
	

	object_spawn_on_click = obj_primary_tiny;
	
	//object_spawn_on_click_options = genus_get_names_array(-1);
	/*
									[
									"obj_plant_tree_5"
									, "obj_tree_tropical"
									, "obj_tree_continental"
									, "obj_tree_mediterranean"
									, "obj_plant_desert"
									, "obj_plant_bush"
									, "obj_plant_bush_2"
									, "obj_crop_bush"
									, "obj_plant_artic"
									, "obj_primary_small"
									, "obj_primary_tiny" 
									, "obj_primary_tiny_2" 
									, "obj_primary_tiny_3" 
									, "obj_secondary_small"
									];
	*/
	/*
	object_spawn_on_click_objects = [
									obj_plant_tree_5
									, obj_tree_tropical
									, obj_tree_continental
									, obj_tree_mediterranean
									, obj_plant_desert
									, obj_plant_bush
									, obj_plant_bush_2
									, obj_crop_bush
									, obj_plant_artic
									, obj_primary_small 
									, obj_primary_tiny 
									, obj_primary_tiny_2 
									, obj_primary_tiny_3 
									, obj_secondary_small
									];
	*/

}



