// return distance (me) from x,y to a creature
// take in account if creature is a crop

function world_distance_to_object_m(_x, _y, _creature){

	var d = -1;
	if _creature.genome[GEN.FAMILY] != "fam_crop" {
		d = point_distance(_x, _y, _creature.x, _creature.y);
	}
	else {
		// instead of looking to creature x,y look at center of cell
		if instance_exists(obj_world_dot) == false {
			instance_create_layer(_x, _y, "Instances", obj_world_dot);
		}
		with obj_world_dot {
			x = _x;
			y = _y;
			d = distance_to_object(_creature);
			
		}
		
	}

	return world_px_to_m(d);
}