/*

	Generates one offspring creature

*/

function state_reproduction(_id){


	// calculate birt place
	var _d = _id.structure.reproduction_distance;
	var _xTo = _id.x + _d * random_range (0.5, 1) * choose(-1, 1);
	var _yTo = _id.y + _d * random_range (0.5, 1) * choose(-1, 1);
				
	// check if birth place is inside world
	if controller.world.is_inside_world(_xTo, _yTo) {
					
		// create child creature
		var _child = instance_create_layer(_xTo, _yTo, "Instances", _id.object_index);
					
		// give genome to child
		_id.dna.reproduction_get_genome(_child.dna.genome, controller.world.get_radiation(_id.x, _id.y));
					
		// give biomass to child
		var _biomass_give = - _id.structure.biomass_modify(-_id.structure.biomass_reproductive); 
		_id.structure.biomass_reproductive -= _biomass_give;	// reset biomass_reproductive
		
		_child.structure.biomass = _biomass_give;
		_child.structure.biomass_at_birth = _biomass_give;

		// increment generation number
		_child.structure.generation = _id.structure.generation + 1;


		// store age at last reproduction to apply interval
		_id.structure.age_last_reproduction = _id.structure.age;
		
		// remember hom many childs
		_id.structure.reproduction_count++;
		
		// reset reproduction state
		_id.structure.is_prepared_for_reproduction = false;
		
		//LOG_ID(_id, "REPRODUCED - child id: "+string(_child)+", child count: "+string(_id.structure.reproduction_count));
		LOG(LOGEVENT.CREATURE_REPRODUCTION, _id, _child, _biomass_give);
		//LOG(LOGEVENT.CREATURE_BORN, _child);

	}
	
	_id.state.next_state = STATE.IDLE;

}