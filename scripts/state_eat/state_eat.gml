
/*

	state_eat_primary
	
	- eat from food
		move to its cells and eat from it

*/

function state_eat(_id) {
	
		// === precondition

		ASSERT(_id.structure.is_hungry, _id, "state_eat not hungry");
		ASSERT(_id.brain.seen_food != noone, _id, "state_eat no food");
		

		// prey is still alive?
		
		if instance_exists(_id.brain.seen_food) {
			
		
			var _prey = _id.brain.seen_food;
			//var _speed = _id.is_primary ? PRIMARY_SPEED : SECONDARY_SPEED;
		
			if  _id.brain.seen_food_distance > EAT_DISTANCE {
			
				//  prey is not close enough
			
				// approach food
				world_creature_move_to(_id, _prey.x, _prey.y, _id.structure.speed_eat);
				_id.brain.seen_food_distance = point_distance(_id.x, _id.y, _prey.x, _prey.y);
		
			}
			else {
			
				// it's close, can eat
			
				// capture a part of biomass from one of the plants 
				var _biomass_got = been_eated(_id.brain.seen_food, _id, _id.structure.biomass_eat);
				_id.structure.anabolism_input += _biomass_got; 
						
				// log eat event
				var _txt = "anabolism_input: "+string((_id.structure.anabolism_input))+"  biomass prey: "+string((_prey.structure.biomass));
				log_event(LOGEVENT.CREATURE_EAT, _id, _prey, _biomass_got, _txt);
				
				// store to draw
				_id.brain.last_prey_eaten = _prey;

		
			}

		}
	// === transition

	if _id.structure.is_hungry 
		_id.state.next_state = STATE.EAT;
	else
		_id.state.next_state = STATE.IDLE;
	
	return 
	
}


/*
function state_eat_primary(_id) {
	
		// === precondition

		ASSERT(_id.genome[@ GEN.TROPHIC_LEVEL]==TROPHIC_LEVEL.PRIMARY, _id, "state_eat_primary error trophic level");
		ASSERT(_id.structure.is_hungry, _id, "state_eat_primary not hungry");
		ASSERT(instance_exists(_id.brain.seen_food), _id, "state_eat_primary no food");
	
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

		// === transition

		_id.state.next_state = STATE.IDLE;
	
		return 
}

*/
