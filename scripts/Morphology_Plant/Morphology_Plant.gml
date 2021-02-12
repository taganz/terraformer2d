function Morphology_Plant(_id) constructor {

	
	sprite_head = _id.creature_sprite_head;
	sprite_body = _id.creature_sprite_body;
	sprite_dead = _id.creature_sprite_dead; 

		
	// -- size parameters
	
	_head_w = 0;
	_head_h = 0;
	_body_w = 0;
	_body_h = 0;
	_head_w_scale = 0;
	_head_h_scale = 0;
	_body_w_scale = 0;
	_body_h_scale = 0;

	
#region private attributes

	my_id = _id;
	
	//scale = 0;
	_head_h = 1;
	_head_w = 1;
	_body_h = 1;
	_body_w = 1;
#endregion

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
		if (my_id.dna.genome[GEN.PLANT_HEAD_DENSITY] > 0 ) {
			var _head_volum = sqrt(my_id.structure.biomass_leaf/my_id.dna.genome[GEN.PLANT_HEAD_DENSITY]);
	//		_head_h = _head_volum * my_id.dna.genome[GEN.PLANT_HEAD_FORM_FACTOR] / sprite_get_height(sprite_head);
	//		_head_w = _head_volum / my_id.dna.genome[GEN.PLANT_HEAD_FORM_FACTOR] / sprite_get_width(sprite_head); 
			_head_h_scale = _head_volum * my_id.dna.genome[GEN.PLANT_HEAD_FORM_FACTOR] ;
			_head_h = _head_h_scale * sprite_get_height(sprite_head);
			_head_w_scale = _head_volum / my_id.dna.genome[GEN.PLANT_HEAD_FORM_FACTOR] ; 
			_head_w = _head_w_scale * sprite_get_width(sprite_head); 
		}
		
		// truck
		if (my_id.dna.genome[GEN.PLANT_BODY_DENSITY] > 0 ) {
			var _body_volum = sqrt(my_id.structure.biomass_trunk/my_id.dna.genome[GEN.PLANT_BODY_DENSITY]);
	//		_body_h = _body_volum * my_id.dna.genome[GEN.PLANT_BODY_FORM_FACTOR] / sprite_get_height(sprite_body);
	//		_body_w = _body_volum / my_id.dna.genome[GEN.PLANT_BODY_FORM_FACTOR] / sprite_get_width(sprite_body);
			_body_h_scale = _body_volum * my_id.dna.genome[GEN.PLANT_BODY_FORM_FACTOR] ;
			_body_h = _body_h_scale * sprite_get_height(sprite_body);
			_body_w_scale = _body_volum / my_id.dna.genome[GEN.PLANT_BODY_FORM_FACTOR] ;
			_body_w = _body_w_scale * sprite_get_width(sprite_body);
		}		
			
	}

	// === draw 
	
	// draw head and body
	draw = function() {
		
		switch (my_id.state.state) {
			case STATE.DEAD:
				// just body
				//sprite_body = sprite_dead;
				draw_sprite_ext(sprite_dead, 0, my_id.x-_body_w/2, my_id.y-_body_h, _body_w_scale, _body_h_scale, 0, c_white, 50);
				break;
			default:		
				// body and crown
				if (my_id.dna.genome[GEN.PLANT_HEAD_DENSITY] > 0 ) {
					draw_sprite_ext(sprite_head, 0, my_id.x - _head_w/2, my_id.y - _head_h -_body_h, _head_w_scale, _head_h_scale, 0, c_white, 75);
				}
				if (my_id.dna.genome[GEN.PLANT_BODY_DENSITY] > 0 ) {
					draw_sprite_ext(sprite_body, 0, my_id.x - _body_w/2, my_id.y - _body_h,          _body_w_scale, _body_h_scale, 0, c_white, 75);
				}
					
		}
				

	}

}