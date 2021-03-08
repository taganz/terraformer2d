for (var i=0; i< spawner_quantity ;i++) {
	
	var _xTo = -1;
	var _yTo = -1;
	var _try = 0;
	var total = 0;

	// calculate birt place
	while world_is_inside_pixel(_xTo, _yTo) == false || _try++ > 10 {
		_xTo = x + spawner_distance_max * random_range (0.1, 1) * choose(-1, 1);
		_yTo = y + spawner_distance_max * random_range (0.1, 1) * choose(-1, 1);
	}
				
	// check if birth place is inside world
	if world_is_inside_pixel(_xTo, _yTo) {
					
		// create child creature
		_id = instance_create_layer(_xTo, _yTo, "Instances", spawner_object_to_spawn);
		total++;
							
	}
	
}

show_debug_message("Spawned "+string(total)+" creatures "+ object_get_name(spawner_object_to_spawn)+ " from spawner "+string(id)+". Destroying...");
instance_destroy();