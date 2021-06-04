/*
	World (constructor)
	
*/



function World() constructor {
	
	// === intialize vars

	// grid_nutrients
	// grid_cells
	// statistics


	climate_change_temperature_increment = 0;		// used by GUI to simulate climate change

	world_max_x = window_get_width();
	world_max_y = window_get_height();
	
	world_w = floor(world_max_x/CELL_SIZE_PX);
	world_h = floor(world_max_y/CELL_SIZE_PX);
	grid_cells = ds_grid_create(world_w+1, world_h+1);
	
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
	
	climates = [];
	climates = climate_definitions();
	
	radiation = -1;
	



}