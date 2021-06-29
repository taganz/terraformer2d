
// initialize here to be sure controller exists

if (controller.time.current_step == 1) {
	my_cell = world_create_cell_pixel(x,y);
	//my_cell =  cell_from_pixel(x,y);
	if my_cell != -1 {
		my_cell.probe_logging = true;
		show_debug_message("Starting probe "+string(id)+" "+probe_name+ " "+string(x)+", "+string(y));
		log_event(LOGEVENT.INFO_PARAMETERS, "Probe "+probe_name
			+" at cell "+string(my_cell.x_cell)+", "+string(my_cell.y_cell)+"  climate "+climate_to_string(my_cell.climate)); 
		log_event(LOGEVENT.WORLD_PROBE_SOIL, id);
		log_event(LOGEVENT.WORLD_PROBE_CLIMATE, id);
	}
	else
	{
		log_error("*** ERROR starting probe "+string(id)+" "+probe_name+ " "+string(x)+", "+string(y));
	}
	
}

