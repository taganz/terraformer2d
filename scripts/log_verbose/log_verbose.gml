/*
    log_verbose(id, txt) 
		- everybody: creature_verbose == true
		- animals: creature_log == true and DEBUG_VERBOSE_LOG_ANIMALS 

*/

function log_verbose(_id, txt) {
	if DEBUG_VERBOSE {
		if instance_exists(_id) {
			var cell_info = _id.my_cell != 0 ? string(_id.my_cell.x_cell)+","+string(_id.my_cell.y_cell) : "no cell"; 
			if _id.creature_verbose or _id.creature_log and DEBUG_VERBOSE_LOG_ANIMALS and _id.is_plant == false {
					show_debug_message(
							 (_id.is_primary ? " P " : (_id.is_secondary ? " S " : "p"))
							+ ", "+ string(_id) 
							+ ", "+string(sim_steps_to_years(_id.structure.age))+"y "
							+ ",Pos "+string(ceil(_id.x))+","+string(ceil(_id.y))
							+ ",Home "+string(ceil(_id.brain.home_x))+","+string(ceil(_id.brain.home_y))
							+ ", "+ cell_info
							+ ", " + txt
							);
			}
		}
	}
}