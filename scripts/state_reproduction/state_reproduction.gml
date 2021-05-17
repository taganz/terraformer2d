/*

	Generates one offspring creature
	
	- create offspring instances
	- updates offspring dna
	- give biomass to offspring and update some parameters
	

*/

function state_reproduction(_id){


	// do for all offspring

	var _biomass_to_give_to_offspring = _id.structure.biomass_reproduction / _id.genome[GEN.REPRODUCTION_QUANTITY];
	var _offspring_count = 0;
	
	for (var off=0; off < _id.genome[GEN.REPRODUCTION_QUANTITY]; off++) {

		// calculate birth place
		var _d = _id.structure._reproduction_distance;
		var _xTo = _id.x + _d * random_range (0.5, 1) * choose(-1, 1);
		var _yTo = _id.y + _d * random_range (0.5, 1) * choose(-1, 1);
				
		// check if birth place is inside world
		if world_is_inside_pixel(_xTo, _yTo) {
					
			// create child creature
			var _child = instance_create_layer(_xTo, _yTo, "Instances", _id.object_index);
					
			// give genome to child. 
			// the instance_create_layer has executed create event for _child and it already has a genome instance
			// let's make it inherited from parent's genome
			_child.genome = genome_offspring_copy(_id, world_get_radiation(_id.x, _id.y));
										
			// give biomass to child
			_child.structure._biomass_given_by_parent = - biomass_modify(_id, -_biomass_to_give_to_offspring); 
			//_id.structure.biomass_reproduction -= _biomass_give;	// reset biomass_reproduction
		
			//biomass_modify(_child, -_child.structure.biomass);
			//ASSERT(_child.structure.biomass == 0, _child, "state_reproduction biomass not zero??")
			
			
			// increment generation number
			_child.structure.generation = _id.structure.generation + 1;

			_offspring_count++;

			// 1st offspring of followed creature is also followed
			if _id.creature_log == true and _offspring_count==1 and _id.structure.reproduction_count==0 and LOG_CREATURE_FOLLOWING_FOLLOW_CHILDREN == true {
				_child.creature_log = true;
			}

			log_event(LOGEVENT.CREATURE_REPRODUCTION, _id, _child, _child.structure._biomass_given_by_parent);
		}		
	}


	// store age at last reproduction to apply interval
	_id.structure.reproduction_age_last_time = _id.structure.age;
		
	// remember hom many reproduction times
	_id.structure.reproduction_count ++;
	_id.structure.reproduction_count += _offspring_count;
		
	log_event(LOGEVENT.CREATURE_LIFE_EVENT, _id, "reproduction", "offspring count: "+string(_offspring_count));
	
	_id.state.next_state = STATE.IDLE;

}