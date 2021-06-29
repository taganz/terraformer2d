// shows info if shift is pressed over creature 
// and no other creature is doing this
// if "Q" is pressed, log activation for this creature is activated
	

function gui_draw_creature_info(){

	var _id = collision_point(mouse_x, mouse_y, class_creature, false, true);
		
	if _id != noone 
		&&  (showing_debug_data_for_creature == -1 or showing_debug_data_for_creature == _id) {
							
		
			// draw info
				
			draw_set_colour(c_black);
			draw_set_font(fnt_small);
			draw_set_valign(fa_top);
				
			var x_draw = 200;
			var y_draw = controller.user_options.room_simulation_heigth + 100;
			draw_text(x_draw, y_draw, string_repeat("                  \n", 10));
			draw_text(x_draw, y_draw, _log_text_creature(_id));
			showing_debug_data_for_creature = _id;
		
			// draw cell rectanble
		
			if (_id.my_cell != 0) {
				var _x0 = grid_pixel_x_from_cell_x(_id.my_cell.x_cell);
				var _y0 = grid_pixel_y_from_cell_y(_id.my_cell.y_cell);
				draw_rectangle(_x0, _y0, _x0 + controller.world.cell_size_px, _y0 + controller.world.cell_size_px, true );
			}
		
			// if q is pressed, activate log for this creature
			if (keyboard_check_pressed(ord(KEY_ACTIVATE_LOG_CREATURE_IN_SCREEN))) {
				gui_follow(_id);
			}
	}
	else {
		// reset
		showing_debug_data_for_creature = -1;
	}
	
}



function _log_text_creature(_id){

	if instance_exists(_id) {
		return string(_id) 
		+ "\nGenus:  "+string(_id.genome[GEN.GENUS_NAME])
		+ " - Specie: "+string(_id.genome[GEN.SPECIE_CODE])
		//+ "\nInitial specie: "+string(_id.genome[GEN.GENUS_ID])
		+ "\nBiomass: "+string_format(_id.structure.biomass, 4, 1)+"kg"
		+ "\nAge: "+string(sim_steps_to_years(_id.structure.age))+"y"
		+ "\Nhungry: " + string(_id.structure.is_hungry) 
		+ " - starving: " + string(_id.structure.is_starving)
		+ "\nanabolism_input: " + string(_id.structure.anabolism_input)
		+ " - _has_eaten_this_time: " + string(_id.structure._has_eaten_this_time)
		+ "\nSTATE : " + state_to_string(_id.state.state)
		+ "\nPos: "+string(ceil(_id.x))+","+string(ceil(_id.y)) + 
		+ " - Cell :"+string(cell_x_from_pixel(_id.x))+","+string(cell_x_from_pixel(_id.y))
		+ " - Home: "+string(ceil(_id.brain.home_x))+","+string(ceil(_id.brain.home_y))
		;
	}
	else {
		return "not found: "+string(_id)
		+ "\nCell:"+string(_id.my_cell.x_cell)+","+string(_id.my_cell.y_cell)
	}

}