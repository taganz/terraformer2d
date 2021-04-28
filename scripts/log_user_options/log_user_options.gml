// there are 4 types of log events
//  INFO_			logged always if ALLOW_LOG is selected
//  CREATURE_		logged if CREATURES_FOLLOWIN or CREATURES_ALL is selected
//  SPECIES_		logged if BORN_DEAD_SUMMARY is selected
//  WORLD_			logged if WORLD is selected


#macro BUFFER_LINES 5000
#macro SIM_LOG_FILE_NAME "SIM_LOG"
#macro CSV_SEPARATOR ";"

function log_user_options () constructor {

	LOG_ALLOW_LOG				= false;	// main log switch. if false, no log file is created
	LOG_CREATURES_FOLLOWING		= false;	// log all CREATURE events
	LOG_CREATURES_ALL			= false;	// false = log CREATURE events only for followed creature
	LOG_BORN_DEAD_SUMMARY		= false;	// log info at birth and dead for all creatures
	LOG_WORLD					= false;	// log WORLD events
	log_user_spawned_creatures	= true;		// set log for user spawned creatures

}