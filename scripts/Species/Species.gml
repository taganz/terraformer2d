/*
	- Store species
*/

function Species() constructor {

	
	// === read gen values for initial species grid
	// columns are initial species
	// rows are gens
	// grid can contain comment rows. valid rows contain "GENUS" or gen names in first column
	_genus_grid = _genus_load_csv();
	
	_genus_max_columns = ds_grid_width(_genus_grid);
	_genus_max_rows = ds_grid_height(_genus_grid);
	
	// get row with initial species code
	_genus_code_row = ds_grid_value_y(_genus_grid, 0, 0, 1, _genus_max_rows, "GENUS_ID");
	
	// store last variant for each initial specie
	_genus_last_variant = array_create(GENUS._LENGTH_, 0);
	
	// store actual population
	genus_population = array_create(GENUS._LENGTH_, -1);	
				
	// load genus sprites
	_genus_sprite_id = array_create(GENUS._LENGTH_, 0);
	
		
}
	