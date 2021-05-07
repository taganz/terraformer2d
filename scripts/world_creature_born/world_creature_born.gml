// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function world_creature_born(_id, _x, _y) {

	var born_ok = true;

	// add creature to grid_cells at cell corresponding to pixels _x, _y
	with controller.world {
		
		if world_is_inside_pixel(_x, _y) {
			
			var xx = floor(_x/CELL_SIZE_PX);
			var yy = floor(_y/CELL_SIZE_PX);
			
			var cell = _cell_add_creature (_id, xx, yy);
			
			if cell == -1 {
				born_ok = false;
			}
			else {
				
				// update stats
				creatures_live_now ++;
				trophic_level_live_now[_id.genome[GEN.TROPHIC_LEVEL]]++;
				creatures_born ++;
				creatures_peak = creatures_peak <= creatures_live_now ? creatures_live_now : creatures_peak;
				
				//log_event(LOGEVENT.SPECIE_BORN, _id, climate_to_string(cell.climate));
			}
		}
		else {
			show_debug_message("*** WARNING *** invalid x, y in creature_born: "+string(_id)+": "+string(_x)+","+string(_y));
			born_ok = false;
			
		}

	}

	return born_ok;
}