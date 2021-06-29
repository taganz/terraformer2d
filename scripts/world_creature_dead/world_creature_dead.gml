// remove creature from list_creatures from grid_cells at cell corresponding to pixels _x, _y
// add to list_dead_creatures
function world_creature_dead(_id){

	with controller.world {
		
		var _x = _id.x;
		var _y = _id.y;
		
		// is position ok?
		if world_is_inside_pixel(_x, _y) {
			
			var xx = floor(_x / cell_size_px);
			var yy = floor(_y / cell_size_px);
			
			// remove from live creatures
			_cell_remove_creature (_id, xx, yy);
			
			// add to dead creatures
			ds_list_add(grid_cells[# xx, yy].list_dead_creatures, _id);
						
			// update stats
			if _id.structure.dead_cause != DEADCAUSE.BIRTH {
				creatures_live_now --;
				trophic_level_live_now[_id.genome[GEN.TROPHIC_LEVEL]]--;
				creatures_dead ++;
				creatures_peak = creatures_peak <= creatures_live_now ? creatures_live_now : creatures_peak;
			}
			
		}
		else {
			ASSERT(false, _id, "*** WARNING *** invalid x, y in creature_dead: "+string(_id)+": "+string(_x)+","+string(_y));
		}
	}
}