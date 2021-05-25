/*
   Return a genome for a first generation creature
   (In case of second generation creature, parent will execute genome_offspring_copy after instance creation
   in order to make it inherit from parent)
   
*/
function genome_create(_genus){

	// genome is an array
	var _genome = array_create (GEN._LENGTH_, 0);

	with controller.species {
		
		// get gen values for all gens 
		for (var i=0; i<GEN._LENGTH_;i++) {
	
			// get value 
			var val = _genus_grid_gen_value(_genus, i);
			if (val != -999999999) {
				_genome[i] = val;
			}
			else {
				_genome[i] = 0;
				//log_error("*** ERROR *** genome_create - error getting gen "+gen_to_string(i)+" for specie "+genus_to_string(_genus))
				log_error("*** ERROR *** genome_create - error getting gen "+gen_to_string(i)+" for genus "+string(_genus))
			}
	
		}
	}	
	
	// this will last only for 1st generation creatures
	_genome[GEN.PARENT_SPECIE_CODE] = "NOPARENT";
	
	// calculate specie code
	_genome[GEN.SPECIE_CODE] = specie_code_from_genome(_genome);    
		
		
	return _genome;
	
}





