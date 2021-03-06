/*

	- Store species
	- Detect specie changes



*/

function Species() constructor {

	// this map stores  prefixes - number of variants for this prefix
	_prefixes_map = ds_map_create();
	
	//species_list = ds_list_create();


	// === read gen values for initial species
	
	_initial_species_grid = initial_specie_load_csv();
	
		

}