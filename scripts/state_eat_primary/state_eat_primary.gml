
function state_eat_primary(_id) {
	

		// get creatures in my cell or nearby
		
		// try first with small producers
		var _list_creatures_cell = world_get_nearby_creatures(_id.x, _id.y, "small_producer");
		var _eat = _process_producers_list(_id, _list_creatures_cell);
		
		// if no small, try with the big ones
		if _eat == false {
			var _list_creatures_cell = world_get_nearby_creatures(_id.x, _id.y, "big_producer");
			_process_producers_list(_id, _list_creatures_cell);
		}
					
		
		_id.state.next_state = STATE.IDLE;
	
}


// if there is one producer in the list, eat from it and return true	

function _process_producers_list(_id, _producers_list) {
	
		var _prey = -1;

		// iterate producers in list looking for a plant to eat

		for(var i=0; i<ds_list_size(_producers_list); i++) { 
			
			_prey = ds_list_find_value(_producers_list, i);		
			if is_undefined(_prey)== false {
						
											
				// all plants can be eaten now <-----
						
				// move to plant position, it is near
				//world_creature_move(_id, _prey.x + 8, _prey.y + 8);
				world_creature_move(_id, _prey.x, _prey.y);
						
				// capture a part of biomass from one of the plants 
				var _biomass_got = been_eated(_prey, _id, _id.structure.biomass_eat);
				_id.structure.eaten_biomass += _biomass_got; 
						
				// log eat event
				var _txt = "eaten_biomass: "+string(units_to_kg(_id.structure.eaten_biomass))+"  biomass prey: "+string(units_to_kg(_prey.structure.biomass));
				log_event(LOGEVENT.CREATURE_EAT, _id, _prey, _biomass_got, _txt);
						
				return true;
			}
		}
		return false;
}