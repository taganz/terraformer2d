
// initialize here to be sure controller exists

if (controller.time.current_step == 1) {
	world_create_cell_pixel(x,y);
	my_cell =  cell_from_pixel(x,y);
	my_cell.probe_logging = true;
	show_debug_message("Starting probe "+string(id)+" "+probe_name);
	log_event(LOGEVENT.INFO_PARAMETERS, "Probe "+probe_name
		+" at cell "+string(my_cell.x_cell)+", "+string(my_cell.y_cell)+"  climate "+climate_to_string(my_cell.climate)); 
	log_event(LOGEVENT.WORLD_PROBE_SOIL, id);
	log_event(LOGEVENT.WORLD_PROBE_CLIMATE, id);
	
}

/*

if !controller.sim_paused {
	
	// monthly record 
	if controller.time.sim_month_entry  {
		
		// log temperature
		log_event(LOGEVENT.WORLD_PROBE_RAIN_TEMP, id, 
			string(my_cell.rain_current_month), 
			climate_to_string(my_cell.climate),
			string(my_cell.temperature_current_month));
			
		log_event(LOGEVENT.WORLD_PROBE_PLANT_AVAILABLE_WATER, id);

		// log water
		//log_event(LOGEVENT.WORLD_PROBE_WATER, id, string(my_cell.stored_water) , 
		//	probe_name +"_"+ cell_to_string(cell_from_pixel(x, y))); 
			
	}
		
}

*/