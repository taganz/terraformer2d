
// get biomass from plants in the same cell
// try small producers first, then big producers
// increment structure.animal_eaten_biomass


function state_eat_primary(_id) {
	

		// get creatures in my cell or nearby
		
		// try first with small producers
		//var _list_creatures_cell = world_get_nearby_creatures(_id.x, _id.y, "small_producer");
		var _list_creatures_cell = world_get_nearby_creatures(_id.x, _id.y, "producer");
		_process_producers_list(_id, _list_creatures_cell);
		
		// if no small, try with the big ones
		//if _eat == false {
		//	var _list_creatures_cell = world_get_nearby_creatures(_id.x, _id.y, "big_producer");
		//	_process_producers_list(_id, _list_creatures_cell);
		//}
					
		
		_id.state.next_state = STATE.IDLE;
	
}


// if there is one producer in the list, eat from it and return true	

function _process_producers_list(_id, _producers_list) {
	
		var _prey = -1;

		// iterate producers in list looking for a plant to eat

		for(var i=0; i<ds_list_size(_producers_list); i++) { 
			
			_prey = ds_list_find_value(_producers_list, i);		
			if is_undefined(_prey)== false {
						
											
				// can eat plant?
						
				//if _id.structure.biomass > _prey.structure.biomass / _prey.genome[GEN.INDIVIDUALS_PER_CREATURE] * PRIMARY_TO_PLANT_RATIO_TO_EAT  {
				if _id.genome[GEN.COMBAT_ATTACK_POINTS] > _prey.genome[GEN.COMBAT_DEFENSE_POINTS] {
					
					// move to plant position, it is near
					world_creature_move(_id, _prey.x, _prey.y);
						
					// capture a part of biomass from one of the plants 
					var _biomass_got = been_eated(_prey, _id, _id.structure.biomass_eat);
					_id.structure.anabolism_input += _biomass_got; 
						
					// log eat event
					var _txt = "anabolism_input: "+string((_id.structure.anabolism_input))+"  biomass prey: "+string((_prey.structure.biomass));
					log_event(LOGEVENT.CREATURE_EAT, _id, _prey, _biomass_got, _txt);
				
					// store to draw
					last_prey_eaten = _prey;
				
					return true;	
				}
			}
		}
		return false;
}