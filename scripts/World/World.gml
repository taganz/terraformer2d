/*
	World (constructor)

	world size is actual room size
	this can be different from simulation size because of screen escalation
	
*/
function World() constructor {
	

	// simulation size in pixels
	width_px = ROOM_SIM_WIDTH;
	height_px = ROOM_SIM_HEIGHT;
	//width_px = controller.user_options.simulation_width;
	//height_px = controller.user_options.simulation_height;
	
	// simulation size in cells
	cell_size_px = controller.user_options.room_cell_size_px;
	width_cells = floor(width_px/cell_size_px);
	height_cells = floor(height_px/cell_size_px);
	
	// grid of cells
	
	grid_cells = ds_grid_create(width_cells, height_cells);
	
	// adjust allowed pixel area
	width_px = width_cells * cell_size_px;
	height_px = height_cells * cell_size_px;
	
	// conversion meters to pixels
	pixels_per_meter = width_px / width_cells / CELL_WIDTH_DRAW;		
	

	
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
	temperature_increment = 0;		

	



}