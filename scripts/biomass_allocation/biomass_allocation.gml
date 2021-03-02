// -- BIOMASS ALLOCATION
// in
//		_age_is_adult_growth
//		age_is_adult_reproduction
//		_LMFa
// updates
//		biomass
//		biomass_reproduction
//		biomass_eat
//		biomass_body 

function biomass_allocation(_id) {

	

		with _id.structure {
		
			// -- biomass_eat
			if _age_is_adult_growth {
				biomass_eat = biomass * _LMFa;		
			}
			else {
				// biomass_eat changes during growth
				biomass_eat = biomass *(_LMFa + (0.9 - _LMFa) * (1 - biomass / my_id.dna.genome[GEN.BIOMASS_ADULT]));
			}

			// -- biomass_reproduction
			if age_is_adult_reproduction {
				biomass_reproduction = clamp(biomass * my_id.dna.genome[GEN.ALLOCATION_RESERVE], 0, biomass - biomass_eat - biomass_body);   
				if (biomass_reproduction < 0) {
					biomass_reproduction = 0;
				}
			}
			else
			{
				biomass_reproduction = 0;
			}
				
			// biomass_body
			biomass_body = biomass - biomass_eat - biomass_reproduction;
			if biomass_body < 0 {
				biomass_body = 0;
			}
		}

}