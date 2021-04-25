/*
   Return a genome for a first generation creature
   (In case of second generation creature, parent will execute genome_offspring_copy after instance creation
   in order to make it inherit from parent)
   
*/
function genome_create(_initial_specie){

	// genome is an array
	var _genome = array_create (GEN_NUM, 0);

	with controller.species {
		
		// get gen values for all gens 
		for (var i=0; i<GEN_NUM;i++) {
	
			// get value 
			var val = initial_specie_gen_value(_initial_specie, i);
			if (val != -1) {
				_genome[i] = val;
			}
			else {
				_genome[i] = 0;
				log_error("*** ERROR *** genome_create - error getting gen "+gen_to_string(i)+" for specie "+initial_specie_to_string(_initial_specie))
			}
	
		}
	}	
	
	// this will last only for 1st generation creatures
	_genome[GEN.PARENT_SPECIE_CODE] = "NOPARENT";
	
	// calculate specie code
	_genome[GEN.SPECIE_CODE] = specie_code_from_genome(_genome);    
		
		
	return _genome;
	
}





