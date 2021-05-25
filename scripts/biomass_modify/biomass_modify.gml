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
			_quant_got = clamp(_quant, 0 -  biomass, 1.2 * _biomass_adult_max - biomass);
			
			if _quant_got > 0 {
				
				// modify biomass 
				biomass += _quant_got;
			
				// update height depending on biomass
				var previous_height = my_height;
				my_height = _height_growth_factor * biomass;
				
				// if height has changed significatively cell will need to reorder producers grid
				if abs((my_height - previous_height)/my_height ) > 0.1 {
					// update height in cell
					cell_update_producer_height(_id);
					_id.my_cell.grid_producers_need_sort = true;
				}
			
				// update statistics
				//controller.world.trophic_level_biomass_now[_id.genome[GEN.TROPHIC_LEVEL]]+= (biomass - biomass_previous); 
				controller.world.trophic_level_biomass_now[_id.genome[GEN.TROPHIC_LEVEL]]+= _quant_got; 
				controller.world.biomass += _quant_got;
					
			
				// check not dead and decomposing before updating living creatures parameters
				// and not initializing
				if is_dead == false and _id.structure.age > 0 {
				

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
		}		
		
		return _quant_got;   
	}
	