/*

	Generates one offspring creature
	
	- create offspring instance
	- updates offspring dna
	- give biomass to offspring and update some parameters
	

*/

function state_reproduction(_id){


	// do for all offspring

	for (var off=0; off < _id.dna.genome[GEN.REPRODUCTION_QUANTITY]; off++) {

		// calculate birth place
		var _d = _id.structure.reproduction_distance;
		var _xTo = _id.x + _d * random_range (0.5, 1) * choose(-1, 1);
		var _yTo = _id.y + _d * random_range (0.5, 1) * choose(-1, 1);
				
		// check if birth place is inside world
		if controller.world.is_inside_world(_xTo, _yTo) {
					
			// create child creature
			var _child = instance_create_layer(_xTo, _yTo, "Instances", _id.object_index);
					
			// give genome to child
			_child.dna.genome = genome_offspring_copy(_id, controller.world.get_radiation(_id.x, _id.y));
										
			// give biomass to child
			//var _biomass_give = - _id.structure.biomass_modify(-_id.structure.biomass_reproduction); 
			var _biomass_give = - biomass_modify(_id, -_id.structure.biomass_reproduction); 
			_id.structure.biomass_reproduction -= _biomass_give;	// reset biomass_reproduction
		
			_child.structure.biomass = _biomass_give;
			_child.structure.biomass_at_birth = _biomass_give;

			// increment generation number
			_child.structure.generation = _id.structure.generation + 1;


			LOG(LOGEVENT.CREATURE_LIFE_EVENT, _id, "reproduction", "biomass: "+string(units_to_kg(_id.structure.biomass)));
			LOG(LOGEVENT.CREATURE_REPRODUCTION, _id, _child, _biomass_give);
		}		
	}

	// store age at last reproduction to apply interval
	_id.structure.reproduction_age_last_time = _id.structure.age;
		
	// remember hom many reproduction times
	_id.structure.reproduction_count++;
		
	// reset reproduction state
	_id.structure.reproduction_is_ready = false;
		

	
	_id.state.next_state = STATE.IDLE;

}