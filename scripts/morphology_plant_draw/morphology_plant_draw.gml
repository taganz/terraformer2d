
// === draw 
	
// draw head and body
// in:
//		state
//		sprite head/body/image
//		_head/body_w/h
//		_head/body_w/h_scale:
function morphology_plant_draw(_id){




	with _id.morphology {
		
		
		if controller.debug_morphology_creatures_as_dots {
			
			draw_circle(my_id.x, my_id.y, 1+10*_body_w_scale, false);
			
			
		}
		else {
		
			switch (my_id.state.state) {
				case STATE.DEAD:
					// just body
					//sprite_body = sprite_dead;
					draw_sprite_ext(sprite_dead, sprite_dead_image, my_id.x-_body_w/2, my_id.y-_body_h, _body_w_scale, _body_h_scale, 0, c_white, 50);
					break;
				default:		
					// body and crown
					if (_head_w_scale > 0 ) {
						draw_sprite_ext(sprite_head, sprite_head_image, my_id.x - _head_w/2, my_id.y - _head_h -_body_h, _head_w_scale, _head_h_scale, 0, c_white, 75);
					}
					if (_body_w_scale > 0 ) {
						draw_sprite_ext(sprite_body, sprite_body_image, my_id.x - _body_w/2, my_id.y - _body_h,          _body_w_scale, _body_h_scale, 0, c_white, 75);
					}
					
			}
		}
				

	}

}