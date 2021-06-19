
function log_events_init_world(){

	log_event(LOGEVENT.INFO_PARAMETERS, 0, "Date time "			+date_date_string(date_current_datetime()) +" "+date_time_string(date_current_datetime())); 
	log_event(LOGEVENT.INFO_PARAMETERS, 0, "Room "					+string(room_get_name(room))); 
	log_event(LOGEVENT.INFO_PARAMETERS, 0, "Screen pixels "		+string(controller.world.world_max_x)+", "+string(controller.world.world_max_y));
	log_event(LOGEVENT.INFO_PARAMETERS, 0, "World cells "			+string(controller.world.world_w)+", "+string(controller.world.world_h));
	log_event(LOGEVENT.INFO_PARAMETERS, 0, "room_climate "		+string(controller.user_options.room_climate));
	log_event(LOGEVENT.INFO_PARAMETERS, 0, "room_soil_type "	+string(controller.user_options.room_soil_type));
	log_event(LOGEVENT.INFO_PARAMETERS, 0, "World cells "			+string(controller.world.world_w)+", "+string(controller.world.world_h));
	log_event(LOGEVENT.INFO_PARAMETERS, 0, "TIME_SIM_STEPS_PER_MONTH "+ string(TIME_SIM_STEPS_PER_MONTH));
	log_event(LOGEVENT.INFO_PARAMETERS, 0, "SIMULATION_SPEED		"+ string(SIMULATION_SPEED));
	log_event(LOGEVENT.INFO_PARAMETERS, 0, "Radiation"				+ string(controller.world.radiation));
	log_event(LOGEVENT.INFO_PARAMETERS, 0, "NUTRIENT_TILE_OFFSET"	+ string( NUTRIENT_TILE_OFFSET));
	log_event(LOGEVENT.INFO_PARAMETERS, 0, "NUTRIENT_TILE_MULTIPLIER"+ string( NUTRIENT_TILE_MULTIPLIER));
	log_event(LOGEVENT.INFO_PARAMETERS, 0, "climate_change_temperature_increment "+ string(controller.world.climate_change_temperature_increment));
	log_event(LOGEVENT.INFO_PARAMETERS, 0, "1 sim year =  "		+string(years_to_sim_steps(1))+" sim step");
	log_event(LOGEVENT.INFO_PARAMETERS, 0, "1 sim step =  "		+string(sim_steps_to_years(1))+" year");
	
	
	show_debug_message("obj_gui. starting room:            "+room_get_name(room));
	show_debug_message("obj_gui. options_unlimited_water:  "+string(obj_gui.options_unlimited_water));
	show_debug_message("controller.user_options:            "+string(controller.user_options));

	log_event(LOGEVENT.INFO_PARAMETERS, 0, "starting room	"			+room_get_name(room));
	log_event(LOGEVENT.INFO_PARAMETERS, 0, "options_unlimited_water "	+string(obj_gui.options_unlimited_water));
	log_event(LOGEVENT.INFO_PARAMETERS, 0, "user_options	"			+string(controller.user_options));
	
	if controller.user_options.LOG_CREATURES_PRODUCERS == false {
		log_error("WARNING! LOG_CREATURES_PRODUCERS == false");
	}
	
}