/*

	creates genome for child
	- copy basic parameters
	- recalculate mutable parameters based on radiation
	- detects if mutations generate new specie 
		if so
		- saves new specie to world species register
		- updated child genome with new specie information

		
*/

function genome_offspring_copy(_id_parent, _radiation){

	var _genome_child =  array_create(GEN_NUM, 0);
	
	// === copy parent genome
	
	var len = array_length(_id_parent.genome);
	array_copy(_genome_child, 0, _id_parent.genome, 0, len);

	
				
	// === mutation happens?
	
	var gen_to_mutate = -1;
	var mutation_happens = random(1) < _radiation;
	if mutation_happens {
		gen_to_mutate = irandom_range(GEN_FIRST_MUTABLE, GEN_NUM-1);
		var mutation_level = 
				1 
				+
				(1-2*irandom_range(0,1))
				* ((RADIATION_GEN_MUTATION_MAX - RADIATION_GEN_MUTATION_MIN) * _radiation - RADIATION_GEN_MUTATION_MIN);
		_genome_child[gen_to_mutate] *= mutation_level;
		
	}
	
		

	// === current specie gen - specie code and parent specie could change depending on radiation
	
	// check if offspring is a different specie than parent
	var _child_prefix = specie_code_prefix(_genome_child);
	if _child_prefix  == specie_code_prefix(_id_parent.genome) {
		
		// same prefix, this means same specie as parent. let's copy full specie code
		_genome_child[GEN.SPECIE_CODE] = _id_parent.genome[GEN.SPECIE_CODE];    
		// parent specie is the same as parent's parent specie
		_genome_child[GEN.PARENT_SPECIE_CODE] = _id_parent.genome[GEN.PARENT_SPECIE_CODE];    
		
	}
	else {
		
		// different prefix, let's check if this prefix exist. if so, increase variant to create a new specie code
		
		with controller.species {
		
			// does this prefix already exist for other specie?
			var variants = _prefixes_map[? _child_prefix];
			var new_specie_code = "";
			if is_undefined(variants ) {
				// this is a new prefix and a new species. assign variant 0
				ds_map_add(_prefixes_map, _child_prefix, 0);
				_genome_child[GEN.SPECIE_CODE] = specie_code_replace_variant(_id_parent.genome[GEN.SPECIE_CODE], 0);
			}
			else {
				// there was a specie with same prefix, increase variant 
				variants++;
				_prefixes_map[? _child_prefix] = variants;
				var _fake_specie_code = specie_code_from_genome(_genome_child);
				_genome_child[GEN.SPECIE_CODE] = specie_code_replace_variant(_fake_specie_code, variants);
			}
		
		}
		// parent specie is parent specie
		_genome_child[GEN.PARENT_SPECIE_CODE] = _id_parent.genome[GEN.SPECIE_CODE];    
		
		// log a new specie		
		log_event(LOGEVENT.SPECIE_NEW, 0, _genome_child[GEN.SPECIE_CODE], _id_parent.genome[GEN.SPECIE_CODE]);
			
	}
	
	return _genome_child;
}