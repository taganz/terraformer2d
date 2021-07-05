// -- BIOMASS ALLOCATION
// in
//		age_is_adult
//		biomass_adult
//		_biomass_eat_allocation
//		my_id.genome[GEN.BIOMASS_ADULT]
//		_biomass_reproduction_max
// updates
//		biomass
//		biomass_reproduction
//		biomass_eat
//		biomass_body 
//		is_dead, dead_cause - if some biomass is going negative creature dies ILL

function biomass_allocation(_id) {

	

	with _id.structure {
		
		//if age_is_adult == false {
		if biomass < biomass_adult {
			
			// == growing
			
			// during growth 
			// - biomass_eat change from 90% of total biomass to _biomas_eat_allocation
			// - biomass_reproduction is zero
			biomass_eat = max(biomass *(_biomass_eat_allocation + (0.9 - _biomass_eat_allocation) * (1 - biomass / biomass_adult)),0);
			biomass_body = max(biomass - biomass_eat, 0);
		
			biomass_reproduction = 0;
		}
		else {
		
			// == adult		
		
			// for adults
			// - biomass eat = biomass adult * eat allocation
			// - biomass reproduction = part of biomass over biomass_adult * reproductive allocation
			// - biomass body = rest of biomass
			//			
		
			// -- biomass eat
			// 7/4/21  biomass_eat = biomass_adult * _biomass_eat_allocation;		
			biomass_eat = biomass * _biomass_eat_allocation;		

			// -- biomass_reproduction
			//biomass_reproduction = 	biomass > biomass_adult - _biomass_reproduction_max ? biomass - (biomass_adult - _biomass_reproduction_max) : 0;
			biomass_reproduction = 	clamp(biomass - biomass_adult, 0, _biomass_reproduction_max);
	
			// -- biomass_body
			biomass_body = biomass - biomass_eat - biomass_reproduction;
			
		}
		
		if biomass_eat < 0 or biomass_body < 0 {
			is_dead = true;
			dead_cause = DEADCAUSE.ILL;
			//log_creature_dead(_id);
		}
	}
}