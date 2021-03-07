
function state_eat_primary(_id) {
	
		var _prey = -1;

			
		// get creatures in my cell or nearby
				
		var _list_creatures_cell = controller.world.get_creatures_close_cells(_id.x, _id.y);
			
		
		// iterate creatures looking for a plant to eat
		
		for(var i=0; i<ds_list_size(_list_creatures_cell); i++) { 
			
			_prey = ds_list_find_value(_list_creatures_cell, i);		
			//ASSERT (is_undefined(_creature)==false, " state_eat_primary error in _creature at point "+string(_id.x)+","+string(_id.y));
			if is_undefined(_prey)== false {
						
				// is it a plant?
				if _prey.genome[@ GEN.TROPHIC_LEVEL]==TROPHIC_LEVEL.PRODUCER {
											
						// all plants can be eaten now <-----
						
						// move to plant position, it is near
						controller.world.creature_move(_id, _prey.x + 8, _prey.y + 8);
						
						// capture a part of biomass from one of the plants 
						//var _biomass_got = _prey.structure.been_eated(_id, _id.structure.quant_organic_wanted);
						//var _biomass_got = _prey.structure.been_eated(_id, _id.structure.BIOMASS_EAT);
						var _biomass_got = been_eated(_prey, _id, _id.structure.biomass_eat);
						_id.structure.eaten_biomass += _biomass_got; 
						
						var _msg_log = "biomass_eat: "+string(units_to_kg(_id.structure.biomass_eat))+"  biomass prey: "+string(units_to_kg(_prey.structure.biomass));
							
						log_event(LOGEVENT.CREATURE_EAT, _id, _prey, _biomass_got, _msg_log);
						
						break;
				}
			}
		}
					
		
		_id.state.next_state = STATE.IDLE;
	
}