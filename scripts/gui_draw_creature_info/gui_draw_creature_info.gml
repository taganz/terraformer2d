// shows info if shift is pressed over creature 
// and no other creature is doing this
// if "Q" is pressed, log activation for this creature is activated
	

function gui_draw_creature_info(){

	

	with obj_gui.gui {
		
		var _id = collision_point(mouse_x, mouse_y, class_creature, false, true);
		
		if _id != noone 
			&&  (showing_debug_data_for_creature == -1 or showing_debug_data_for_creature == _id) {
							
		
				draw_set_colour(c_black);
				draw_set_font(fnt_small);
				draw_text(50, 400, _log_text_creature(_id));
				showing_debug_data_for_creature = _id;
		
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
	
}



function _log_text_creature(_id){

	return string(_id) 
	+ "\n"+gen_to_string(_id.genome[GEN.SPECIE_CODE])
	+ "\ninitial_specie: "+string(_id.genome[GEN.INITIAL_SPECIE])
	+ "\n"+string_format(units_to_kg(_id.structure.biomass), 4, 1)+"kg"
	+ "\n"+string(sim_steps_to_years(_id.structure.age))+"y"
	+ "\nSTATE: " + _id.state.to_string()
	+ "\nCELL:"+cell_to_string(_id.my_cell)
	;

	
}