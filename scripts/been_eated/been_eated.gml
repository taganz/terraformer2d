	// === been_eated
	// the creature is been eaten by other creatures (state_eat)
	// update 
	//		biomass
	//		world.biomass
	//		is_hungry
	//		is_starving
	//		is_dead		
	//		dead_cause if creature dies
	
	function been_eated (_id, _id_attacker, _quant_organic_wanted) {
		
	with _id.structure {		
		var _quant_got = biomass < _quant_organic_wanted ? biomass : _quant_organic_wanted;
		var _was_dead = is_dead;
		biomass_modify (_id, -_quant_got);
		log_event(LOGEVENT.CREATURE_BEEN_EATED, my_id, _id_attacker, _quant_got);
		// if it is dead after taking biomass dead cause was eaten
		if _was_dead == false && is_dead == true
				dead_cause = DEADCAUSE.EATEN;   
		return _quant_got;
		}
	}