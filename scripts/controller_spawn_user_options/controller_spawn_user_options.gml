
// to be done at room start

function controller_spawn_user_options(){

	with controller {
		
		// initial spawn
		if user_options.spawn_genus != -1 and user_options.spawn_quantity > 0 {
			var _spawner = instance_create_layer(world.width_px/2, world.height_px/2, "Instances", class_spawner);
			_spawner.spawner_genus_to_spawn = genus_name_from_id(user_options.spawn_genus);
			_spawner.spawner_quantity = user_options.spawn_quantity;
			_spawner.spawner_distance_max = user_options.spawn_distance_max
			_spawner.spawner_creature_log_probability = user_options.spawn_log_probability;
		}

		// initial spawn #2
		if user_options.spawn_2_genus != -1 and user_options.spawn_2_quantity > 0 {
			var _spawner = instance_create_layer(world.width_px/2, world.height_px/2, "Instances", class_spawner);
			_spawner.spawner_genus_to_spawn = genus_name_from_id(user_options.spawn_2_genus);
			_spawner.spawner_quantity = user_options.spawn_2_quantity;
			_spawner.spawner_distance_max = user_options.spawn_2_distance_max
			_spawner.spawner_creature_log_probability = user_options.spawn_2_log_probability;
		}

		// initial spawn #3
		if user_options.spawn_3_genus != -1 and user_options.spawn_3_quantity > 0 {
			var _spawner = instance_create_layer(world.width_px/2, world.height_px/2, "Instances", class_spawner);
			_spawner.spawner_genus_to_spawn = genus_name_from_id(user_options.spawn_3_genus);
			_spawner.spawner_quantity = user_options.spawn_3_quantity;
			_spawner.spawner_distance_max = user_options.spawn_3_distance_max
			_spawner.spawner_creature_log_probability = user_options.spawn_3_log_probability;
		}
	}
}