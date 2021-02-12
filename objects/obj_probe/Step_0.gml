/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// initialize here to be sure controller exists

if (controller.time.current_step == 1) {
	controller.world.grid_create_cell_pixel(x,y);
	my_cell =  controller.world.get_cell(x,y);
	show_debug_message("Starting probe "+string(id)+" "+probe_name);
	
	
}


if !controller.sim_paused {
	
	// monthly record 
	if controller.time.sim_month_entry  {
		LOG(LOGEVENT.PROBE_RAIN_TEMPERATURE, id, 
			string(my_cell.rain_current_month), 
			climate_to_string(my_cell.climate),
			string(my_cell.temperature_current_month));
	}
	// log only at sim steps
	if controller.time.sim_step_entry  {
		
		
		LOG(LOGEVENT.PROBE_NUTRIENTS, id, controller.world.get_nutrients_2(NUTRIENT.MINERAL, x, y), 
			probe_name +"_"+ controller.world.cell_to_string(x, y)); 
			
		//LOG(LOGEVENT.PROBE_WATER, id, controller.world.get_water(x, y), 
		LOG(LOGEVENT.PROBE_WATER, id, string(my_cell.available_water) , 
			probe_name +"_"+ controller.world.cell_to_string(x, y)); 
			
			
		//last_sim_step = controller.time.current_sim_step;
	}
		
}