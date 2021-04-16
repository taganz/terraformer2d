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
			
			// enough biomass to reduce?
			if biomass + _quant < 0 {
				_quant_got = -biomass;		
			}
			
			// modify biomass
			biomass = min(biomass + _quant_got, biomass_adult * 1.1);
			
			// adults can not growth bigger than biomass_adult
			//if (age_is_adult and biomass > biomass_adult) {
			//	biomass = biomass_adult;
			//}
		
			// _biomass_max surpassed?
			if biomass > _biomass_max {				
				_biomass_max = biomass;
				// "non reserve" is the part of the biomass we need to live
				_biomass_reserve_max = _biomass_max * my_id.genome[GEN.ALLOCATION_RESERVE];
			}
			
			// actual reserve = biomass - "non reserve max"
			biomass_reserve = biomass - (_biomass_max - _biomass_reserve_max);
			
			
			// update statistics. if animal eat animal sum is zero. not in decomposition or plants growth 
			controller.world.biomass += _quant_got;
					
			
			// check not dead and decomposing
			if is_dead == false {
			
				if is_hungry == false {
					
					// reserve start decreasing?
					if biomass_reserve < 0.8 * _biomass_reserve_max {
						is_hungry = true;
					}
					is_starving = false;   // first time hungry, not starving
				}
				else {
					
					// reserve is full again?
					if biomass_reserve > 0.95 * _biomass_reserve_max {
						is_hungry = false;
					}
					is_starving = biomass_reserve < 0.5 * _biomass_reserve_max; 
				}
			
				// has enough reserve to keep alive?
				if (biomass_reserve <= 0)  {
					is_dead = true;			
					dead_cause = DEADCAUSE.STARVING;
				}
			}
		}		
		
		return _quant_got;   
	}
	