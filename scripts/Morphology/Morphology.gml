function Morphology(_id) constructor {

	my_id = _id;
	
	scale = 0;
	//scale_base = 1;
		
	sprite = _id.creature_sprite_default;
	

	
	// === step
	// update draw parameters, to avoid doing this at draw event
	
	step = function() {
		//scale = scale_base * _struct.map_nutrients[? NUTRIENT.MINERAL];	
		if my_id.structure.is_adult_growth
			scale = clamp(my_id.structure.biomass/5, 0.6, 1);   // <------- 
		else 
			scale = clamp(my_id.structure.biomass/5, 0.4, 0.8);   // <------- 
			
	}

	// === draw 
	
	draw = function() {
		
		switch (my_id.state.state) {
			case STATE.EAT:		
				if my_id.structure.is_starving
					sprite = my_id.creature_sprite_starving_eat; 
				else
					sprite = my_id.creature_sprite_eat;
				break;
			case STATE.DEAD:
				sprite = my_id.creature_sprite_dead; 
				break;
			default:			
				if my_id.structure.is_starving
					sprite = my_id.creature_sprite_starving;
				else
					sprite = my_id.creature_sprite_default; 
					
		}
				

		
		draw_sprite_ext(sprite, 0, my_id.x, my_id.y, scale, scale, 0, c_white, 75);
	}

}