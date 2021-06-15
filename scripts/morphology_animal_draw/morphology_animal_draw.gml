
function morphology_animal_draw(_id){

	with _id.morphology {
	
		// dots debug mode
		
		if controller.debug_morphology_creatures_as_dots {
			
			switch(_id.state.state){
				case STATE.DEAD: 
					draw_set_colour(c_maroon);
					break;
				case STATE.EAT: 
					if _id.structure._has_eaten_this_time {
						draw_set_colour(c_red);
					}
					else {
						// nothing to eat
						if _id.structure.is_starving 
							draw_set_colour(c_yellow);
						else 
							draw_set_colour(c_maroon);
					}
					break;
				default:  
					if _id.structure.is_starving 
						draw_set_colour(c_yellow);
					else 
						draw_set_colour(c_maroon);
					break;
			}
					
			draw_circle(_id.x, _id.y, 1+0.5*_id.structure.biomass, false);
			
				
		}
		
		// normal mode
		
		else {
		
			switch (_id.state.state) {
			case STATE.DEAD:
				// just body
				draw_sprite_ext(sprite_dead, 0, _id.x-_body_w/2, _id.y-_body_h, _body_w_scale, _body_h_scale, 0, specie_blend, 50);
				break;
			case STATE.EAT:		
				// head
				if (_head_w_scale > 0 ) {
					var sprite_head_eat = -1;
					if _id.structure.is_starving  {
						if _id.structure._has_eaten_this_time > 0
							sprite_head_eat = _id.creature_sprite_starving_eat; 
						else
							// not really eating
							sprite_head_eat = _id.creature_sprite_starving; 
					}
					else {
						if _id.structure._has_eaten_this_time > 0
							sprite_head_eat = _id.creature_sprite_eat; 
						else 
							// not really eating
							sprite_head_eat = _id.creature_sprite_head;
					}
					draw_sprite_ext(sprite_head_eat, 0, _id.x - _head_w/2, _id.y - _head_h -_body_h, _head_w_scale, _head_h_scale, 0, specie_blend, 75);
				}
				// body
				if (_body_w_scale > 0 ) {
					draw_sprite_ext(sprite_body, 0, _id.x - _body_w/2, _id.y - _body_h,          _body_w_scale, _body_h_scale, 0, specie_blend, 75);
				}
				break;

			default:			

				// body and crown
				if (_head_w_scale > 0 ) {
					if _id.structure.is_starving
						draw_sprite_ext(_id.creature_sprite_starving, 0, _id.x - _head_w/2, _id.y - _head_h -_body_h, _head_w_scale, _head_h_scale, 0, specie_blend, 75);
					else
						draw_sprite_ext(_id.creature_sprite_head, 0, _id.x - _head_w/2, _id.y - _head_h -_body_h, _head_w_scale, _head_h_scale, 0, specie_blend, 75);
						
				}
				if (_body_w_scale > 0 ) {
					draw_sprite_ext(sprite_body, 0, _id.x - _body_w/2, _id.y - _body_h,          _body_w_scale, _body_h_scale, 0, specie_blend, 75);
				}
					
			}
		}
		
		
	}

}