
/*

	state_eat_primary
	
	- look for a producer in nearby cells
	- if attack > prey.defense 
		move to its cells and eat from it

*/
function state_eat_primary(_id) {
	

		ASSERT(_id.genome[@ GEN.TROPHIC_LEVEL]==TROPHIC_LEVEL.PRIMARY, _id, "state_eat_primary error trophic level");
	
		// get creatures in my cell or nearby
		
		var _producers_list = world_get_nearby_creatures(_id.x, _id.y, TROPHIC_LEVEL.PRODUCER);

		
		// iterate producers in list looking for a plant to eat

		var _prey = -1;
		_id.last_prey_eaten = -1;
		
		for(var i=0; i<ds_list_size(_producers_list); i++) { 
			
			_prey = ds_list_find_value(_producers_list, i);		
			
			ASSERT(!is_undefined(_prey), _id, "state_eat_primary _prey undefined");
			if is_undefined(_prey)== false and _prey != 0 {
						
											
				// can eat?
						
				if _id.genome[GEN.COMBAT_ATTACK_POINTS] > _prey.genome[GEN.COMBAT_DEFENSE_POINTS]
					and _prey.structure.biomass > _prey.structure.biomass_adult * PRODUCER_BIOMASS_MINIMUM_EAT {
					
					// move to plant position, it is near
					world_creature_move(_id, _prey.x, _prey.y);
						
					// capture a part of biomass from one of the plants 
					var _biomass_got = been_eated(_prey, _id, _id.structure.biomass_eat);
					_id.structure.anabolism_input += _biomass_got; 
						
					// log eat event
					var _txt = "anabolism_input: "+string((_id.structure.anabolism_input))+"  biomass prey: "+string((_prey.structure.biomass));
					log_event(LOGEVENT.CREATURE_EAT, _id, _prey, _biomass_got, _txt);
				
					// store to draw
					_id.last_prey_eaten = _prey;

					break;
				}
			}
		}

		_id.state.next_state = STATE.IDLE;
	
		return 
}
