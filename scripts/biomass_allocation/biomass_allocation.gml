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
			biomass_eat = biomass *(_biomass_eat_allocation + (0.9 - _biomass_eat_allocation) * (1 - biomass / my_id.genome[GEN.BIOMASS_ADULT]));
			biomass_body = biomass - biomass_eat - biomass_reproduction;
			if biomass_body < 0 {
				biomass_body = 0;
			}
		}
		else {
		
			// == adult		
		
			// -- biomass eat
			biomass_eat = biomass_adult * _biomass_eat_allocation;		

			// -- biomass_reproduction
			biomass_reproduction = 	biomass > biomass_adult - _biomass_reproduction_max ? biomass - (biomass_adult - _biomass_reproduction_max) : 0;

				
			// -- biomass_body
			biomass_body = biomass - biomass_eat - biomass_reproduction;
			if biomass_body < 0 {
				biomass_body = 0;		// should not happen
			}
		}
	}
}