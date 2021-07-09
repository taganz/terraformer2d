/*
	World (constructor)
	
*/



function World() constructor {
	
	// === intialize vars

	// grid_nutrients
	// grid_cells
	// statistics


	temperature_increment = 0;		// used by GUI to simulate climate change

	world_max_x = controller.user_options.room_simulation_width;
	world_max_y = controller.user_options.room_simulation_heigth;
	
	cell_size_px = controller.user_options.room_cell_size_px;
	
	world_w = floor(world_max_x/cell_size_px);
	world_h = floor(world_max_y/cell_size_px);
	grid_cells = ds_grid_create(world_w, world_h);
	
	// adjust allowed pixel area
	world_max_x = world_w * cell_size_px - 1;
	world_max_y = world_h * cell_size_px - 1;
	
	// conversion meters to pixels
	pixels_per_meter = world_max_x / world_w / CELL_WIDTH_DRAW;		
	
	show_debug_message("*** World grid size: "+string(world_w)+" x "+string(world_h));
	show_debug_message("*** World pixels per meter: "+string(pixels_per_meter));
	
	// stats
	creatures_live_now = 0;
	creatures_dead = 0;
	creatures_born = 0;
	creatures_peak = 0;
	biomass = 0;
	
	trophic_level_live_now = [];
	trophic_level_live_now[TROPHIC_LEVEL.PRODUCER]=0;
	trophic_level_live_now[TROPHIC_LEVEL.PRIMARY]=0;
	trophic_level_live_now[TROPHIC_LEVEL.SECONDARY]=0;
	
	trophic_level_biomass_now = [];
	trophic_level_biomass_now[TROPHIC_LEVEL.PRODUCER]=0;
	trophic_level_biomass_now[TROPHIC_LEVEL.PRIMARY]=0;
	trophic_level_biomass_now[TROPHIC_LEVEL.SECONDARY]=0;
	
	// genus level stats in Species()
	
	climates = [];
	climates = climate_definitions();
	
	radiation = -1;
	



}