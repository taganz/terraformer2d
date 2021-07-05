// ===== CELL (struct)

// contains bioma and nutrients in a given terrain cell

function Cell() constructor {
	
	x_cell = -1;
	y_cell = -1;
	
	
	probe_logging = false;			// log probe events?

	//list_producers_small = ds_list_create();
	//list_producers_big = ds_list_create();
	
	grid_producers = ds_grid_create(2, CELL_MAX_PRODUCERS); // columns: producer_id, producer_height
														// to get all producers use grid_producers[#0, i]
	ds_grid_set_region(grid_producers, 1, 0, 1, CELL_MAX_PRODUCERS, -1); // reset height for reordering purposes
	grid_producers_need_sort = false;	// a producer has changed height significatively and must reorder
	_grid_producers_current = 0;		// number of producer in grid. next row to fill
	
	list_primaries = ds_list_create();
	list_secondaries = ds_list_create();
	
	list_dead_creatures = ds_list_create();
	
	// soil
	
	soil_type = -1;	
	stored_water = 0;					// total water in cell (kg)
	soil_saturation_water_kg = -1;			// soil wan't absorb rain water over this (run off will ocurr, not included in model)
	soil_field_capacity_kg = -1;			// FC * area * depth
	soil_permanent_wilting_point_kg = -1;	// PWP * area * depth
	//plant_roots_water_absorbtion = 0;			// water plants can get, determined by field capacity and permanent wilting point (kg)
	plants_available_water = 0;			// water plants can get, determined by field capacity and permanent wilting point (kg)
	
	losses_per_month_kg = -1;				// kg
	
	// climate 
	
	climate = -1;						// climate defines rain, temperature
	rain_current_month = 0;				// rain fallen current month
	temperature_current_month = 0;
	
	//map_nutrients = ds_map_create();
	
	
	// keep track of user definitions to allow changes during simulation
	_user_defined_soil = false;
	_user_defined_climate = false;
}
	
	
	