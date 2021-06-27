
// return true if everything ok

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
				
				// if family is crop, must adjust position inside cell to bottom middle
				if _id.genome[GEN.FAMILY] == "fam_crop" {
					_id.x = xx * CELL_SIZE_PX + CELL_SIZE_PX / 2;
					_id.y = yy * CELL_SIZE_PX + CELL_SIZE_PX - 1;
				}
				
				//  DEBUG
				ASSERT(xx == floor(_id.x/CELL_SIZE_PX) and yy == floor(_id.y/CELL_SIZE_PX), _id, "world_creature_born repositionating crop");
						
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