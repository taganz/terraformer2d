function brain_step(_id){

	ASSERT(_id.is_plant == false, _id, "brain step plants have no brain");
	
	with _id.brain {
		
		
		// === threats (primaries)
		
		if _id.is_primary {
			
			// threat still active?
			if instance_exists(seen_threat) == false or seen_threat == noone {
				
				
				// if there are secondaries in my cell, look for another threat
				if ds_list_empty(_id.my_cell.list_secondaries) == false {
					
					// set first secondary in the list as a our threat   <--- to be improved
					seen_threat = _id.my_cell.list_secondaries[| 0];
					log_verbose(_id, "new threat: "+string(seen_threat));
				}
				else {
					seen_threat = noone;
					log_verbose(_id, "no threats in this cell");
				}
			}
			else {
				
				// still see threat?
				if point_distance(_id.x, _id.y, seen_threat.x, seen_threat.y) > _id.structure.view_range {
					seen_threat = noone
					log_verbose(_id, "threat missed...");
				}
				
			}
		}
		
		// == food (animals)
		
		
		// secondaries food can move. need to recalculate distance
		if _id.is_secondary {		
			if instance_exists(seen_food) != false and seen_food != noone {
				seen_food_distance = point_distance(_id.x, _id.y, seen_food.x, seen_food.y);
				
				// has food escaped?
				if seen_food_distance > _id.structure.view_range {
					seen_food = noone;
					seen_food_distance = -1;
				}
			}
		}
		

		// need to look for other food?
		
		if instance_exists(seen_food) == false or seen_food == noone {

			// look for new food
			seen_food = noone;
						
			// get creatures in my cell or nearby
	
			if _id.is_primary {
				var _prey_list = world_get_nearby_creatures(_id.x, _id.y, TROPHIC_LEVEL.PRODUCER);
				var min_biomass_fraction_to_eat = PRODUCER_BIOMASS_MINIMUM_EAT;
			}
			else {
				var _prey_list = world_get_nearby_creatures(_id.x, _id.y, TROPHIC_LEVEL.PRIMARY);
				var min_biomass_fraction_to_eat = PRIMARY_BIOMASS_MINIMUM_EAT;
			}

			
			// iterate potential prey in list looking for a candidate

			var _prey = -1;
			
			for(var i=0; i<ds_list_size(_prey_list); i++) { 
			
				_prey = ds_list_find_value(_prey_list, i);		
			
				ASSERT(!is_undefined(_prey), _id, "brain_step _prey undefined");
				
				if is_undefined(_prey)== false and _prey != 0 {
										
					// can eat?
						
					if _id.genome[GEN.COMBAT_ATTACK_POINTS] > _prey.genome[GEN.COMBAT_DEFENSE_POINTS]
						and (_prey.structure.biomass > _prey.structure.biomass_adult * min_biomass_fraction_to_eat 
							or _prey.structure.biomass > _id.structure.biomass)
					{
						// can see? 
						var _dist = point_distance(_id.x, _id.y, _prey.x, _prey.y);
						if _dist < _id.genome[GEN.VIEW_RANGE] { 
							seen_food = _prey;
							seen_food_distance = _dist;
							break;	
						}
					}
				}
			}

		}
		
	}
	

}