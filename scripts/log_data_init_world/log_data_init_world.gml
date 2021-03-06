// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function log_data_init_world(){

	show_debug_message("");
	show_debug_message("==============================================================");
	show_debug_message("***                     log_event INITIALIZED                   ***");
	show_debug_message("==============================================================");
	show_debug_message("Screen pixels:      "+string(controller.world.world_max_x)+", "+string(controller.world.world_max_y));
	show_debug_message("World cells:        "+string(controller.world.world_w)+", "+string(controller.world.world_h));
	show_debug_message("-------------------------------------");
	show_debug_message("TIME_SIM_STEPS_PER_MONTH:         "+ string(TIME_SIM_STEPS_PER_MONTH));
	show_debug_message("SIMULATION_SPEED:				  "+ string(SIMULATION_SPEED));
	show_debug_message("SIMULATION_WORLD_RADIATION:       "+ string(SIMULATION_WORLD_RADIATION));
	show_debug_message("SIMULATION_UNITS_PER_KG:          " + string( SIMULATION_UNITS_PER_KG));
	show_debug_message("NUTRIENT_TILE_OFFSET:             "+ string( NUTRIENT_TILE_OFFSET));
	show_debug_message("NUTRIENT_TILE_MULTIPLIER:         "+ string( NUTRIENT_TILE_MULTIPLIER));
	//show_debug_message("CLIMATE_TILE_OFFSET:          "+ string( CLIMATE_TILE_OFFSET));
	show_debug_message("climate_change_temperature_increment:      "+ string(controller.world.climate_change_temperature_increment));
	show_debug_message("LOG_IF_SHIFT_PRESSED:             "+ string( LOG_IF_SHIFT_PRESSED));
	show_debug_message("-------------------------------------");
	//show_debug_message("1 sim year =  "+string(1/TIME_SIM_STEPS_PER_MONTH)+" second");
	show_debug_message("1 sim year =  "+string(years_to_sim_steps(1))+" sim step");
	show_debug_message("1 sim step =  "+string(sim_steps_to_years(1))+" year");
	show_debug_message("1 sim kg =    "+string(1/units_to_kg(1))+" unit");
	show_debug_message("1 unit =      "  +string(units_to_kg(1))+" kg");
	show_debug_message("1 sim kg/year   = "  +string(kg_per_year_to_units(1)*room_speed)+" unit/second");
	show_debug_message("1 sim kg/year   = "  +string(kg_per_year_to_units(1))+" unit/sim step");
	show_debug_message("1 unit/step	    = "  +string(1/kg_per_year_to_units(1))+" kg/year");
	show_debug_message("-------------------------------------");
	show_debug_message("");


}