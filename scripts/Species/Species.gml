/*

	- Store species
	- Detect specie changes



*/

function Species() constructor {

	// this map stores a map   prefixes - number of variants for this prefix
	prefixes_map = ds_map_create();
	species_list = ds_list_create();


	// === read gen values for initial species
	
	initial_species_grid = initial_specie_load_csv();
	
	

	// get specie code from new prefix (different from parent's)
	specie_code_from_new_prefix = function(new_prefix, _id_parent) {
		
		// prefix must be different from parent (except for initial species where _id_parent is == _id_child)
		ASSERT(_id_parent.structure.generation==1 || (new_prefix != specie_code_prefix(_id_parent.dna.genome)), _id_parent, "specie_code_from_new_prefix - not new prefix!");
		
		// does this prefix already exist for other specie?
		var variants = prefixes_map[? new_prefix];
		var new_specie_code = "";
		if is_undefined(variants ) {
			// this is a new prefix and a new species
			ds_map_add(prefixes_map, new_prefix, 0);
			new_specie_code = specie_code_format(new_prefix, 0, 0);
		}
		else {
			// there was a specie with same prefix, let's update the variant
			variants++;
			prefixes_map[? new_prefix] = variants;
			new_specie_code = specie_code_format(new_prefix, variants, 0);
		}
		
		ds_list_add(species_list, new_specie_code);
		LOG(LOGEVENT.SPECIE_NEW, _id_parent, new_prefix, new_specie_code, _id_parent.dna.genome[GEN.SPECIE_CODE]);
		
		return new_specie_code;
	}
		
	
		

}