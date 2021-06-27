
// === draw 
	
// draw head and body
// can draw as a dot if "controller.debug_morphology_creatures_as_dots"=true
//
// in:
//		state
//		sprite head/body/image
//		_head/body_w/h
//		_head/body_w/h_scale:

function morphology_plant_draw(_id) {

	with _id.morphology {
	
	
		// dots debug mode
		
		if controller.debug_morphology_creatures_as_dots {
			
			//draw_circle(_id.x, _id.y, 1+20*_body_w_scale, false);
			draw_set_colour(c_green);
			draw_circle(_id.x, _id.y, 1+0.05*_id.structure.biomass, false);
	
		}
		
		// normal mode
		
		else {
	
			//show_debug_message(	gpu_get_blendmode() == bm_normal ? "NORMAL" : "NOT NORMAL");
			
			switch (_id.state.state) {
				case STATE.DEAD:
					// just body
					//sprite_body = sprite_dead;
					draw_sprite_ext(sprite_dead, 0, _id.x, _id.y, _head_w_scale, _head_h_scale, 0, specie_blend, ALPHA_PRODUCERS_DEAD);
					break;
				default:		
					// body and crown
					if (_head_w_scale > 0)  {
						draw_sprite_ext(sprite_head, 0, _id.x, _id.y, _head_w_scale, _head_h_scale, 0, specie_blend, ALPHA_PRODUCERS);
					}
			}
		}
	}
}