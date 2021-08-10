function Morphology(_id) constructor {



	// default sprites
	
	sprite_head = spr_creature_default;
	sprite_dead = spr_creature_default_dead;
	

	// size parameters

	_head_w_scale = 1;		// scale factor, depends on density and form factor
	_head_h_scale = 1;		// initialize to show if spawned on pause
	
	_my_scale_factor_w = -1;
	_my_scale_factor_h = -1;
	
	
			
	// -- sprite
		
		
	var external_sprite = controller.species._genus_sprite_id[@ _id.genome[GEN.GENUS_ID]];
	
	if sprite_exists(external_sprite) {
			
		// assign creature sprite
		sprite_head = external_sprite; 
			
		// set sprite origin to bottom middle instead of top left
		sprite_set_offset(sprite_head, sprite_get_width(sprite_head)/2, sprite_get_height(sprite_head)-1);

	}


	// -- specie blend for color adjustment
		
	//specie_blend = _id.genome[GEN.SPECIE_COLOR_HSB];
	specie_blend = -1;
	
	// -- scale factor precalculation

	_my_scale_factor_h = sqrt(family_get_area(_id.genome[GEN.FAMILY]))
							/ CELL_WIDTH_DRAW 
							* controller.world.cell_size_px
							/ sprite_get_height(sprite_head)
							* _id.genome[GEN.SPRITE_SCALE_H];
	_my_scale_factor_w = sqrt(family_get_area(_id.genome[GEN.FAMILY]))
							/ CELL_WIDTH_DRAW 
							* controller.world.cell_size_px
							/ sprite_get_width(sprite_head)
							* _id.genome[GEN.SPRITE_SCALE_H];
}