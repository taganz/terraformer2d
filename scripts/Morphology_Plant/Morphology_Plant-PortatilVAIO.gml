function Morphology_Plant(_id) constructor {

	
	sprite_head = _id.creature_sprite_head;
	sprite_body = _id.creature_sprite_body;
	sprite_dead = _id.creature_sprite_dead; 

	sprite_head_image = -1;
	sprite_body_image = -1;
	sprite_dead_image = -1;
		

	
#region private attributes

	my_id = _id;
	
	// -- size parameters
	
	_head_w_scale = 0;		// scale factor, depends on density and form factor
	_head_h_scale = 0;
	_body_w_scale = 0;
	_body_h_scale = 0;
	_head_w = 1;			// scaled sprite size  
	_head_h = 1;
	_body_w = 1;
	_body_h = 1;

#endregion


	// === born
	
	// adjust sprite to specie
	// in:
	//		- sprite_head/body
	//		- my_id.genome
	// output
	//		- sprite_head/body/dead_image
	born = function() {
		
		// -- sprite_head_image
		
		switch (sprite_get_number(sprite_head)) {
		case 1:
			sprite_head_image = 0;
			break;
		case 4:
			sprite_head_image = (specie_code_x(my_id.genome) + specie_code_y(my_id.genome)) mod 4;
			break;
		case 16:
			sprite_head_image = specie_code_x(my_id.genome) + specie_code_y(my_id.genome) * 4; 
			break;
		default:
			sprite_head_image = 0;
			ASSERT(false, my_id, "Morphology_Plant invalid sprite_get_number(sprite_head): "+string(sprite_get_number(sprite_head)==1));
		}
		
		// -- sprite_trunk_image
		
		switch (sprite_get_number(sprite_body)) {
		case 1:
			sprite_body_image = 0;
			break;
		case 4:
			sprite_body_image = (specie_code_x(my_id.genome) + specie_code_y(my_id.genome)) mod 4;
			break;
		case 16:
			sprite_body_image = specie_code_x(my_id.genome) + specie_code_y(my_id.genome) * 4; 
			break;
		default:
			sprite_body_image = 0;
			ASSERT(false, my_id, "Morphology_Plant invalid sprite_get_number(sprite_head): "+string(sprite_get_number(sprite_head)==1));
		}
		
		sprite_dead_image = 0;
	}
	// === step
	
	// update draw parameters, to avoid doing this at draw event
	// in:
	//	my_id.structure.biomass	
	//					body_density
	//					head_density
	//					body_form_factor
	//					head_form_factor
	step = function() {
		
		
		// adjust size
		// should check creature is not decreasing size? <------ 
		// ratio head biomass and body biomass depends on density <--
		
		// crown
		if (my_id.genome[GEN.PLANT_HEAD_DENSITY] > 0 ) {
			var _head_volum_sqrt = sqrt(my_id.structure.biomass_eat/my_id.genome[GEN.PLANT_HEAD_DENSITY]);
			_head_h_scale = _head_volum_sqrt * my_id.genome[GEN.PLANT_HEAD_FORM_FACTOR] ;
			_head_h = _head_h_scale * sprite_get_height(sprite_head);
			_head_w_scale = _head_volum_sqrt / my_id.genome[GEN.PLANT_HEAD_FORM_FACTOR] ; 
			_head_w = _head_w_scale * sprite_get_width(sprite_head); 
		}
		
		// truck
		if (my_id.genome[GEN.PLANT_BODY_DENSITY] > 0 ) {
			var _body_volum_sqrt = sqrt(my_id.structure.biomass_body/my_id.genome[GEN.PLANT_BODY_DENSITY]);
			_body_h_scale = _body_volum_sqrt * my_id.genome[GEN.PLANT_BODY_FORM_FACTOR] ;
			_body_h = _body_h_scale * sprite_get_height(sprite_body);
			_body_w_scale = _body_volum_sqrt / my_id.genome[GEN.PLANT_BODY_FORM_FACTOR] ;
			_body_w = _body_w_scale * sprite_get_width(sprite_body);
		}		
			
	}

	// === draw 
	
	// draw head and body
	// in:
	//		state
	//		sprite head/body/image
	//		_head/body_w/h
	//		_head/body_w/h_scale:
	draw = function() {
		
		
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