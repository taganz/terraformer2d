
function log_events_init_world(){

	log_info_parameter( "Date time "			, date_date_string(date_current_datetime())); 
	log_info_parameter( "Date time string"	, date_time_string(date_current_datetime())); 
	log_info_parameter( "Room "					,string(room_get_name(room))); 
	log_info_parameter( "Screen pixels "		,string(controller.world.width_px)+", "+string(controller.world.height_px));
	log_info_parameter( "World cells "			,string(controller.world.width_cells)+", "+string(controller.world.height_cells));
	log_info_parameter( "room_climate "		,string(controller.user_options.room_climate));
	log_info_parameter( "room_soil_type "	,string(controller.user_options.room_soil_type));
	log_info_parameter( "World cells "			,string(controller.world.width_cells)+", "+string(controller.world.height_cells));
	log_info_parameter( "TIME_SIM_STEPS_PER_MONTH ",string(TIME_SIM_STEPS_PER_MONTH));
	log_info_parameter( "SIMULATION_SPEED		",string(SIMULATION_SPEED));
	log_info_parameter( "Radiation"				,string(controller.world.radiation));
	log_info_parameter( "NUTRIENT_TILE_OFFSET"	,string( NUTRIENT_TILE_OFFSET));
	log_info_parameter( "NUTRIENT_TILE_MULTIPLIER",string( NUTRIENT_TILE_MULTIPLIER));
	log_info_parameter( "temperature_increment ",string(controller.world.temperature_increment));
	log_info_parameter( "1 sim year =  "		,string(years_to_sim_steps(1))+" sim step");
	log_info_parameter( "1 sim step =  "		,string(sim_steps_to_years(1))+" year");
	log_info_parameter( "1 m =  "		,string(world_m_to_px(1))+" px");
	log_info_parameter( "1 px =  "		,string(world_px_to_m(1))+" m");
	log_info_parameter( "starting room	"			,room_get_name(room));
	log_info_parameter( "unlimited_water "	,string(controller.user_options.unlimited_water));
	log_info_parameter( "user_options	"			,string(controller.user_options));
	
	if controller.user_options.LOG_CREATURES_PRODUCERS == false {
		log_error("WARNING! LOG_CREATURES_PRODUCERS == false");
	}
	
}