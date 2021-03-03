/*

	Structure_Animal
	
	
*/

function Structure_Animal(_id, _spawn_as_adult):Structure(_id, _spawn_as_adult)  constructor {


	
	eaten_biomass = -1;
	


	// === do_metabolism	
	// updates
	//		age: increment
	//		biomass: anabolism (eaten biomass) - catabolism (biomass)
	//		is_dead, dead_cause
	//		is_adult
	//		eaten_biomass
	//
	do_metabolism = function () {

		ASSERT(is_dead==false, my_id, "dead creature entering do_metabolism animal "+string(my_id));


		// -- anabolism and catabolism
		
		// anabolism
		var _quant_anabolism = 0;
		if eaten_biomass > 0 {
			_quant_anabolism = biomass_modify (my_id, eaten_biomass * my_id.dna.genome[GEN.ANIMAL_ANABOLISM_BIOMASS_CONVERSION]);
			LOG(LOGEVENT.CREATURE_ANABOLISM, my_id, _quant_anabolism);
			eaten_biomass -= _quant_anabolism;				  
		}
			
		// catabolism
		var _quant_catabolism = biomass_modify(my_id, - biomass * my_id.dna.genome[GEN.METABOLIC_RATE]);
		LOG(LOGEVENT.CREATURE_CATABOLISM, my_id, _quant_catabolism);

		// -- biomass allocation

		var _biomass_modif = _quant_anabolism - _quant_catabolism;

		if (_biomass_modif > 0) {
			
			if (age_is_adult == false) {
			
				// allocation when growing
			
				BIOMASS_EAT += _biomass_modif * my_id.dna.genome[GEN.ALLOCATION_DIGESTIVE];			
				biomass_reproduction += _biomass_modif * my_id.dna.genome[GEN.ALLOCATION_REPRODUCTIVE];			
				//biomass_muscular = biomass - BIOMASS_EAT - biomass_reproduction;
			
			}
			else {
			
				// allocation for adults
			
				// first, refill reproductive
				if biomass_reproduction < biomass_reproduction_adult {
					var _get = biomass_reproduction + _biomass_modif < biomass_reproduction_adult ? _biomass_modif : biomass_reproduction_adult - biomass_reproduction;
					biomass_reproduction += _get;
					_biomass_modif -= _get;
				}
			
				//reproduction_is_ready = biomass_reproduction >= biomass_reproduction_adult * 0.95;
			}			
		}
	}
	
}