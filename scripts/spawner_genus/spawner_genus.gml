/*

	distance: 0 center - 1 all screen
	_x, _y: origin of spawn, use -1 for center
	radiation: if true apply world radiation to genome
*/


function spawner_genus(_genus_name, _x, _y, _quantity, _distance, _radiation)  {


var total = 0;
var logging = 0;

if _x == -1
	_x = controller.world.width_px/2;
if _y == -1
	_y = controller.world.height_px/2;

show_debug_message("Spawned started. Radiation?"+string(_radiation));

for (var i=0; i< _quantity ;i++) {
	
	var _xTo = -1;
	var _yTo = -1;
	var _try = 0;

	// calculate birt place
	while world_is_inside_pixel(_xTo, _yTo) == false || _try++ > 10 {
		_xTo = _x + (random_range (0, controller.world.width_px/2 * _distance) * choose(-1, 1));
		_yTo = _y + (random_range (0, controller.world.height_px/2 * _distance) * choose(-1, 1));
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
				
		total++;
							
	}
	
}

show_debug_message("*** Spawned: "+string(total)+" creatures "+ string(_genus_name));
}