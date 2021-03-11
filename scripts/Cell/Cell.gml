// ===== CELL (struct)

// contains bioma and nutrients in a given terrain cell

function Cell() constructor {
	
	x_cell = -1;
	y_cell = -1;

	list_producers_small = ds_list_create();
	list_producers_big = ds_list_create();
	list_primaries = ds_list_create();
	list_secondaries = ds_list_create();
	
	list_dead_creatures = ds_list_create();
	
	soil_type = SOIL.DEFAULT;
	soil_available_water_max = SOIL_FIELD_CAPACITY * SOIL_WEIGHT_PER_CELL;  // l/CELL
										// we'll take a soil volum reference of SOIL_WEIGHT_PER_CELL per cell
	available_water = 0;				// (l/CELL) water a plant can get
	rain_current_month = 0;				// rain fallen current month
	temperature_current_month = 0;
	climate = -1;						// climate defines rain, temperature
	
	map_nutrients = ds_map_create();
	
		
}
	
	
	