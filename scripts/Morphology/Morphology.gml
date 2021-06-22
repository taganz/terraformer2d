function Morphology(_id) constructor {

	//morphology_type = 2;


	var external_sprite = controller.species._genus_sprite_id[@ _id.genome[GEN.GENUS_ID]];
	
	if sprite_exists(external_sprite)
		sprite_head = external_sprite; 
	else
		sprite_head = spr_class_plant; 
		
	sprite_body = -1;
	sprite_dead = spr_creature_default_dead;
	
	image_body = 0;
	
	image_head = 0;			// 0
	image_eat = 0;			// 1
	image_starving = 0;		// 2
	image_starving_eat = 0;	// 3
	

	
	// color adjustment
	specie_blend = -1;		// default blend



	// -- size parameters

	_head_w_scale = 0;		// scale factor, depends on density and form factor
	_head_h_scale = 0;
	_body_w_scale = 0;
	_body_h_scale = 0;
	_head_w = 1;			// scaled sprite size  
	_head_h = 1;
	_body_w = 1;
	_body_h = 1;
	
	
	


	// === born
	
	/*
	// adjust sprite to specie
	born = function() {
	
		// pending for animals
	
	}
	*/
	
	/*
	// === step
	// update draw parameters, to avoid doing this at draw event
	
	step = function() {
		//scale = scale_base * _struct.map_nutrients[? NUTRIENT.MINERAL];	
	
		scale = clamp(my_id.structure.biomass/5, 0.6, 1);   
		
	}
*/

/*
	// === draw 
	
	draw = function() {
						

		if controller.debug_morphology_creatures_as_dots {
			
			//draw_circle(_id.x, _id.y, 1+20*_body_w_scale, false);
			draw_set_colour(c_maroon);
			draw_circle(my_id.x, my_id.y, 1+0.5*my_id.structure.biomass, false);
		}
		else 
		{
			switch (my_id.state.state) {
			case STATE.EAT:		
				if my_id.structure.is_starving  {
					if my_id.structure.anabolism_input > 0
						sprite = my_id.creature_sprite_starving_eat; 
					else
						// not really eating
						sprite = my_id.creature_sprite_starving; 
				}
				else {
					if my_id.structure.anabolism_input > 0
						sprite = my_id.creature_sprite_eat; 
					else 
						// not really eating
						sprite = my_id.creature_sprite_default;
				}
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
	
	*/

}