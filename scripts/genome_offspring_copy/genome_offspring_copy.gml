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
	
	// === inmutable gens
	
	_genome_child[GEN.TROPHIC_LEVEL] = _id_parent.dna.genome[GEN.TROPHIC_LEVEL];
	_genome_child[GEN.INITIAL_SPECIE] = _id_parent.dna.genome[GEN.INITIAL_SPECIE];
	_genome_child[GEN.INITIAL_SPECIE_NAME] = _id_parent.dna.genome[GEN.INITIAL_SPECIE_NAME];
				
	// === mutable gens can be changed by radiation
	
	for (var i = GEN_FIRST_MUTABLE; i < GEN_NUM;i++) {
		_genome_child[i] = _id_parent.dna.genome[i] * (1 + random_range(-_radiation, _radiation));
	}

	// === current specie gens - specie code and parent specie could change depending on radiation
	
	// specie prefix will be different from parent if specie_x or specie_y is diferent
	if specie_code_x(_id_parent.dna.genome) != specie_code_x(_genome_child)
		or specie_code_x(_id_parent.dna.genome) != specie_code_y(_genome_child) {
		
		// get specie code from prefix, this will check if specie is a new one, if it is a new 
		// variant and also update stats
		var new_specie_code = controller.species.specie_code_from_new_prefix(specie_code_prefix(_genome_child), _id_parent);
		
		// store new specie data in genome child
		_genome_child[GEN.SPECIE_CODE] = new_specie_code ;    
		// parent
		_genome_child[GEN.PARENT_SPECIE_CODE] = _id_parent.dna.genome[GEN.SPECIE_CODE];    
	}
	else {
		
		// same specie as parent
		_genome_child[GEN.SPECIE_CODE] = _id_parent.dna.genome[GEN.SPECIE_CODE];    
		_genome_child[GEN.PARENT_SPECIE_CODE] = _id_parent.dna.genome[GEN.PARENT_SPECIE_CODE];    
	}
	
	
	return _genome_child;
}