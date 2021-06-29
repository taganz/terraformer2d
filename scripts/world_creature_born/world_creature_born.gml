
// return true if everything ok

function world_creature_born(_id, _x, _y) {

	var born_ok = true;

	// add creature to grid_cells at cell corresponding to pixels _x, _y
	
	with controller.world {
		
		if world_is_inside_pixel(_x, _y) {
			
			var xx = floor(_x/controller.world.cell_size_px);
			var yy = floor(_y/controller.world.cell_size_px);
			
			var cell = _cell_add_creature (_id, xx, yy);
			
			if cell == -1 {
				born_ok = false;
			}
			else {
				
				// if family is crop, must adjust position inside cell to bottom middle
				if _id.genome[GEN.FAMILY] == "fam_crop" {
					_id.x = xx * cell_size_px + cell_size_px / 2;
					_id.y = yy * cell_size_px + cell_size_px - 1;
				}
				
				//  DEBUG
				ASSERT(xx == floor(_id.x/cell_size_px) and yy == floor(_id.y/cell_size_px), _id, "world_creature_born repositionating crop");
						
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