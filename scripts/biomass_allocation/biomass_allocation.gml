// -- BIOMASS ALLOCATION
// in
//		age_is_adult
//		_LMFa
// updates
//		biomass
//		biomass_reproduction
//		biomass_eat
//		biomass_body 

function biomass_allocation(_id) {

	

	with _id.structure {
		
		if age_is_adult == false {
			
			// == growing
			
			// biomass_eat changes during growth
			biomass_eat = biomass *(_LMFa + (0.9 - _LMFa) * (1 - biomass / my_id.dna.genome[GEN.BIOMASS_ADULT]));
			biomass_body = biomass - biomass_eat - biomass_reproduction;
			if biomass_body < 0 {
				biomass_body = 0;
			}
		}
		else {
		
			// == adult
		
			// -- biomass eat
			biomass_eat = biomass * _LMFa;		

			// -- biomass_reproduction
			biomass_reproduction = 	biomass > biomass_max - _biomass_reproduction_max ? biomass - (biomass_max - _biomass_reproduction_max) : 0;

				
			// -- biomass_body
			biomass_body = biomass - biomass_eat - biomass_reproduction;
			if biomass_body < 0 {
				biomass_body = 0;		// should not happen
			}
		}
	}
}