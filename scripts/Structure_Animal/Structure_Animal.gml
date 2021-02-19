/*

	Structure_Animal
	
	
*/

function Structure_Animal(_id, _spawn_as_adult):Structure(_id, _spawn_as_adult)  constructor {


#region Initilizations

	
	eaten_biomass = -1;
	biomass_digestive = -1;
	biomass_reproductive = -1;
	biomass_reproductive_adult = -1;



#endregion


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

		// -- age changes

		age++;			// qui assegura que es cada sim_step <----??

		// to old?
		if age > age_die {
			is_dead = true;
			dead_cause = DEADCAUSE.OLD;
			show_debug_message("*** is_dead   step:"+string(age)+" id: "+string(my_id));
		}

		// adult?
//		else if (is_adult_reproduction == false) and (age >= age_adult_reproduction) {
		else if (is_adult_reproduction == false) and (age >= age_adult) {
			is_adult_reproduction = true;
			is_adult_growth = true;
			biomass_reproductive_adult = biomass_reproductive;
			is_prepared_for_reproduction = true;
			LOG(LOGEVENT.CREATURE_ADULT, my_id, "biomass_reproductive_adult: "+string(units_to_kg(biomass_reproductive_adult)));
		}
		

		// -- anabolism and catabolism
		
		// anabolism
		var _quant_anabolism = 0;
		if eaten_biomass > 0 {
			_quant_anabolism = biomass_modify (eaten_biomass * my_id.dna.genome[GEN.ANIMAL_ANABOLISM_BIOMASS_CONVERSION]);
			LOG(LOGEVENT.CREATURE_ANABOLISM, my_id, _quant_anabolism);
			eaten_biomass -= _quant_anabolism;				  
		}
			
		// catabolism
		var _quant_catabolism = biomass_modify(- biomass * my_id.dna.genome[GEN.METABOLIC_RATE]);
		LOG(LOGEVENT.CREATURE_CATABOLISM, my_id, _quant_catabolism);

		// -- biomass allocation

		var _biomass_modif = _quant_anabolism - _quant_catabolism;

		if (_biomass_modif > 0) {
			
			if (is_adult_growth == false) {
			
				// allocation when growing
			
				biomass_digestive += _biomass_modif * my_id.dna.genome[GEN.ALLOCATION_DIGESTIVE];			
				biomass_reproductive += _biomass_modif * my_id.dna.genome[GEN.ALLOCATION_REPRODUCTIVE];			
				//biomass_muscular = biomass - biomass_digestive - biomass_reproductive;
			
			}
			else {
			
				// allocation for adults
			
				// first, refill reproductive
				if biomass_reproductive < biomass_reproductive_adult {
					var _get = biomass_reproductive + _biomass_modif < biomass_reproductive_adult ? _biomass_modif : biomass_reproductive_adult - biomass_reproductive;
					biomass_reproductive += _get;
					_biomass_modif -= _get;
				}
			
				is_prepared_for_reproduction = biomass_reproductive >= biomass_reproductive_adult * 0.95;
			}			
		}
	}
	
}