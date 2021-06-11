if room != Room0 {
	
	// initial spawn
	if user_options.spawn_genus_object != -1 {
		var _spawner = instance_create_layer(world_max_x/2, world_max_y/2, "Instances", class_spawner);
		_spawner.spawner_object_to_spawn = user_options.spawn_genus_object;
		_spawner.spawner_quantity = user_options.spawn_quantity;
		_spawner.spawner_distance_max = user_options.spawn_distance_max
		_spawner.spawner_creature_log_probability = user_options.spawn_log_probability;
	}


	log_open();
	log_events_init_world();
	
}


