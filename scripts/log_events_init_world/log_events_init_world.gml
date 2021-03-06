// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function log_events_init_world(){

	log_event(LOGEVENT.INFO_PARAMETERS, "Screen pixels:      "+string(controller.world.world_max_x)+", "+string(controller.world.world_max_y));
	log_event(LOGEVENT.INFO_PARAMETERS, "World cells:        "+string(controller.world.world_w)+", "+string(controller.world.world_h));
	log_event(LOGEVENT.INFO_PARAMETERS, "TIME_SIM_STEPS_PER_MONTH:         "+ string(TIME_SIM_STEPS_PER_MONTH));
	log_event(LOGEVENT.INFO_PARAMETERS, "SIMULATION_SPEED:				  "+ string(SIMULATION_SPEED));
	log_event(LOGEVENT.INFO_PARAMETERS, "SIMULATION_WORLD_RADIATION:       "+ string(SIMULATION_WORLD_RADIATION));
	log_event(LOGEVENT.INFO_PARAMETERS, "SIMULATION_UNITS_PER_KG:          " + string( SIMULATION_UNITS_PER_KG));
	log_event(LOGEVENT.INFO_PARAMETERS, "NUTRIENT_TILE_OFFSET:             "+ string( NUTRIENT_TILE_OFFSET));
	log_event(LOGEVENT.INFO_PARAMETERS, "NUTRIENT_TILE_MULTIPLIER:         "+ string( NUTRIENT_TILE_MULTIPLIER));
	log_event(LOGEVENT.INFO_PARAMETERS, "climate_change_temperature_increment:      "+ string(controller.world.climate_change_temperature_increment));
	log_event(LOGEVENT.INFO_PARAMETERS, "1 sim year =  "+string(years_to_sim_steps(1))+" sim step");
	log_event(LOGEVENT.INFO_PARAMETERS, "1 sim step =  "+string(sim_steps_to_years(1))+" year");
	log_event(LOGEVENT.INFO_PARAMETERS, "1 sim kg =    "+string(1/units_to_kg(1))+" unit");
	log_event(LOGEVENT.INFO_PARAMETERS, "1 unit =      "  +string(units_to_kg(1))+" kg");
	log_event(LOGEVENT.INFO_PARAMETERS, "1 sim kg/year   = "  +string(kg_per_year_to_units(1)*room_speed)+" unit/second");
	log_event(LOGEVENT.INFO_PARAMETERS, "1 sim kg/year   = "  +string(kg_per_year_to_units(1))+" unit/sim step");
	log_event(LOGEVENT.INFO_PARAMETERS, "1 unit/step	    = "  +string(1/kg_per_year_to_units(1))+" kg/year");
	
	
	show_debug_message("obj_gui. starting room:            "+room_get_name(room));
	show_debug_message("obj_gui. options_unlimited_water:  "+string(obj_gui.options_unlimited_water));
	show_debug_message("obj_gui. options_log:              "+string(obj_gui.options_log));

	log_event(LOGEVENT.INFO_PARAMETERS, "starting room:            "+room_get_name(room));
	log_event(LOGEVENT.INFO_PARAMETERS, "options_unlimited_water:  "+string(obj_gui.options_unlimited_water));
	log_event(LOGEVENT.INFO_PARAMETERS, "options_log:              "+string(obj_gui.options_log));

}