/*

	creates genome for child
	- copy basic parameters
	- recalculate mutable parameters based on radiation
	- detects if mutations generate new specie 
		
		
*/

function genome_offspring_copy(_id_parent, _radiation){

	var _genome_child =  array_create(GEN._LENGTH_, 0);
	
	// === copy parent genome
	
	var len = array_length(_id_parent.genome);
	array_copy(_genome_child, 0, _id_parent.genome, 0, len);

	
				
	// === mutation happens?
	
	var gen_to_mutate = -1;
	var mutation_happens = random(1) < _radiation;
	if mutation_happens {
		gen_to_mutate = irandom_range(GEN_FIRST_MUTABLE, GEN._LENGTH_-1);
		var mutation_level = 
				1 
				+
				(1-2*irandom_range(0,1))
				* ((RADIATION_GEN_MUTATION_MAX - RADIATION_GEN_MUTATION_MIN) * _radiation + RADIATION_GEN_MUTATION_MIN); 
				//* ((RADIATION_GEN_MUTATION_MAX - RADIATION_GEN_MUTATION_MIN) * _radiation - RADIATION_GEN_MUTATION_MIN);
		_genome_child[gen_to_mutate] *= mutation_level;
		
	}
	
		

	// === current specie gen - specie code and parent specie could change depending on radiation
	
	// check if offspring is a different specie than parent
 
	if specie_is_same_specie(_genome_child, _id_parent.genome) {
		
		// same prefix, this means same specie as parent. let's copy full specie code
		
		_genome_child[GEN.SPECIE_CODE] = _id_parent.genome[GEN.SPECIE_CODE];    
		
		// parent specie is the same as parent's parent specie
		_genome_child[GEN.PARENT_SPECIE_CODE] = _id_parent.genome[GEN.PARENT_SPECIE_CODE];    
		
	}
	else {
		
		// this is a different specie
		
		// get new specie code
		controller.species._genus_last_variant[_id_parent.genome[GEN.GENUS_ID]]++; 	
		_genome_child[GEN.SPECIE_CODE] = specie_code_from_genome(_genome_child);
		
		// parent specie is parent's specie
		_genome_child[GEN.PARENT_SPECIE_CODE] = _id_parent.genome[GEN.SPECIE_CODE];    
		
		// get new specie hue
		_genome_child[GEN.SPECIE_HUE] = specie_hue_from_genome(_genome_child);
		
		// get new morphology parameters
		#macro MORPHOLOGY_MUTATION 0.1
		_genome_child[GEN.PLANT_BODY_DENSITY] *= random_range(1-MORPHOLOGY_MUTATION, 1+MORPHOLOGY_MUTATION);
		_genome_child[GEN.PLANT_BODY_DENSITY] *= random_range(1-MORPHOLOGY_MUTATION, 1+MORPHOLOGY_MUTATION);
		_genome_child[GEN.PLANT_BODY_DENSITY] *= random_range(1-MORPHOLOGY_MUTATION, 1+MORPHOLOGY_MUTATION);
		_genome_child[GEN.PLANT_BODY_DENSITY] *= random_range(1-MORPHOLOGY_MUTATION, 1+MORPHOLOGY_MUTATION);
		
		// log a new specie		
		log_event(LOGEVENT.SPECIE_NEW, 0, _genome_child[GEN.SPECIE_CODE], _id_parent.genome[GEN.SPECIE_CODE], climate_to_string(_id_parent.my_cell.climate));	
		log_events_specie_genome(_genome_child);
			
	}
	
	return _genome_child;
}