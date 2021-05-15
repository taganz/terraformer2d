	// === biomass_modify(quant)
	// returns 
	//		modified quantity (can be a negative value)
	// updates
	//		biomass
	//		_biomass_max
	//		world.biomass
	//		is_hungry   
	//		is_starving	
	//		is_dead
	//		dead_cause
	function biomass_modify (_id, _quant) {
		
		var _quant_got = _quant;
		
		with _id.structure {
			
			// keep biomass within limits
			_quant = clamp(_quant, 0 -  biomass, 1.2 * _biomass_adult_max - biomass);
			
			// modify biomass 
			var biomass_previous = biomass;
			biomass += _quant;
			
			// update statistics
			controller.world.trophic_level_biomass_now[_id.genome[GEN.TROPHIC_LEVEL]]+= (biomass - biomass_previous); 
			controller.world.biomass += _quant_got;
					
			
			// check not dead and decomposing before updating living creatures parameters
			if is_dead == false {
				

				// dead by starving
				if (biomass < _biomass_life )  {
					is_dead = true;			
					dead_cause = DEADCAUSE.STARVING;
				}
				else {
					
					// _biomass_max surpassed?
					if biomass > _biomass_max {				
						_biomass_max = biomass;
						_biomass_life = _biomass_max * _id.genome[GEN.BIOMASS_LIFE_FACTOR];
					}
			
					// hungry histeresys cycle
					if is_hungry == false {
						is_hungry = (biomass < 0.8 * _biomass_adult_max);
						is_starving = false;   // first time hungry, not starving
					}
					else {
						is_hungry = biomass < 1.1 *_biomass_adult_max;
						is_starving = biomass < 2 * _biomass_life ; 
					}
				}			

			}
		}		
		
		return _quant_got;   
	}
	