// spawning can not be done at create event because we need to set instance variables before doing spawn

var total = 0;
var logging = 0;

show_debug_message("Spawned started. Radiation?"+string(spawner_apply_radiation));

for (var i=0; i< spawner_quantity ;i++) {
	
	var _xTo = -1;
	var _yTo = -1;
	var _try = 0;

	// calculate birt place
	while world_is_inside_pixel(_xTo, _yTo) == false || _try++ > 10 {
		_xTo = x + spawner_distance_max * random_range (0, 1) * choose(-1, 1);
		_yTo = y + spawner_distance_max * random_range (0, 1) * choose(-1, 1);
	}
				
	// check if birth place is inside world
	if world_is_inside_pixel(_xTo, _yTo) {
		var _id = -1;
					
		// create child creature
		_id = genus_instance_create(_xTo, _yTo, genus_id_from_name(spawner_genus_to_spawn));
		ASSERT(_id != -1, 0, "spawner error creating genus instance "+string(spawner_genus_to_spawn));
		
		_id.creature_spawn_as_adult = spawner_spawn_as_adult;
		
		// mutate child
		if spawner_apply_radiation  {
			_id.genome = genome_offspring_copy(_id, world_get_radiation(_id.x, _id.y));
		}
		
		// creature should log?
		if random(1) < spawner_creature_log_probability {
			_id.creature_log = true;
			logging++;
		}
		
		total++;
							
	}
	
}

show_debug_message("*** Spawned: "+string(total)+" creatures "+ string(spawner_genus_to_spawn) +" from spawner "+string(id)+". Destroying...");
show_debug_message("Logging "+string(logging)+" creatures ");
instance_destroy();