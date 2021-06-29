/*

	distance: 0 center - 1 all screen
*/


function spawner_genus(_genus_name, _quantity, _distance, _radiation) {


var total = 0;
var logging = 0;

show_debug_message("Spawned started. Radiation?"+string(_radiation));

for (var i=0; i< _quantity ;i++) {
	
	var _xTo = -1;
	var _yTo = -1;
	var _try = 0;

	// calculate birt place
	while world_is_inside_pixel(_xTo, _yTo) == false || _try++ > 10 {
		_xTo = controller.user_options.room_simulation_width * (0.5 + random_range (0, _distance/2) * choose(-1, 1));
		_yTo = controller.user_options.room_simulation_heigth * (0.5 + random_range (0, _distance/2) * choose(-1, 1));
		//_xTo = x + _distance * random_range (0, 1) * choose(-1, 1);
		//_yTo = y + _distance * random_range (0, 1) * choose(-1, 1);
	}
				
	// check if birth place is inside world
	if world_is_inside_pixel(_xTo, _yTo) {
		var _id = -1;
					
		// create child creature
		_id = genus_instance_create(_xTo, _yTo, genus_id_from_name(_genus_name));
		ASSERT(_id != -1, 0, "spawner error creating genus instance "+string(_genus_name));
		
		
		// mutate child
		if _radiation  {
			_id.genome = genome_offspring_copy(_id, world_get_radiation(_id.x, _id.y));
		}
		
		// creature should log?
		//if random(1) < spawner_creature_log_probability {
		//	_id.creature_log = true;
		//	logging++;
		//}
		
		total++;
							
	}
	
}

show_debug_message("*** Spawned: "+string(total)+" creatures "+ string(_genus_name));
}