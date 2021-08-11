function genome_offspring_copy(_id_parent, _radiation){

	var _genome_child =  array_create(GEN._LENGTH_, 0);
	
	// === copy parent genome
	
	var len = array_length(_id_parent.genome);
	array_copy(_genome_child, 0, _id_parent.genome, 0, len);
	_genome_child[GEN.SPECIE_CODE] = _id_parent.genome[GEN.SPECIE_CODE];    	


	// === check mutations and eventually update genome with new specie

	// for each of the mutable gens check if mutations happens
	var mutation_happens = false;
	for (var gen_to_mutate = GEN._SPECIE_MUTABLE_GENS_FOLLOWING_ + 1; gen_to_mutate < GEN._LENGTH_; gen_to_mutate++) {

		if random(9) < _radiation {
		
			// mutate between random interval
			var mutation_level = 1 + random_range(-1,1) * RADIATION_GEN_MUTATION_RANGE; 
			_genome_child[gen_to_mutate] *= mutation_level;
			mutation_happens = true;
		}
	}
	
	if mutation_happens {
		
		// check if change is so important that offspring can be considered a different specie 
		 
		if specie_is_same_specie(_genome_child, _id_parent.genome) == false {
		
			// if so, update some gens and log a new specie
		
			// get new specie code
			controller.species._genus_last_variant[_id_parent.genome[GEN.GENUS_ID]]++; 	
			_genome_child[GEN.SPECIE_CODE] = specie_code_from_genome(_genome_child);
		
			// parent specie is parent's specie
			_genome_child[GEN.PARENT_SPECIE_CODE] = _id_parent.genome[GEN.SPECIE_CODE];    
		
			// get new specie hue
			_genome_child[GEN.SPECIE_COLOR_HSB] = specie_color_hsb_from_genome(_genome_child);
		
			// log a new specie		
			log_event(LOGEVENT.SPECIE_NEW, 0, _genome_child[GEN.SPECIE_CODE], _id_parent.genome[GEN.SPECIE_CODE], climate_to_string(_id_parent.my_cell.climate));	
			log_events_specie_genome(_genome_child);
			
		}
	}
	
	return _genome_child;
}