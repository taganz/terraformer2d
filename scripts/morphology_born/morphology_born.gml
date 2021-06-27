
function morphology_born(_id){
	

	with _id.morphology {
		
		// -- sprite
		
		
		var external_sprite = controller.species._genus_sprite_id[@ _id.genome[GEN.GENUS_ID]];
	
		if sprite_exists(external_sprite) {
			
			// assign creature sprite
			sprite_head = external_sprite; 
			
			// set sprite origin to bottom middle instead of top left
			sprite_set_offset(sprite_head, sprite_get_width(sprite_head)/2, sprite_get_height(sprite_head)-1);

		}


		// -- specie blend
		
		if _id.genome[GEN.SPECIE_HUE] == -1
			specie_blend = -1;
		else
			specie_blend = make_colour_hsv(_id.genome[GEN.SPECIE_HUE], 128, 255);

		// -- scale factor precalculation

		_my_scale_factor_h = sqrt(family_get_area(_id.genome[GEN.FAMILY]))
							 / CELL_WIDTH_DRAW 
							 * CELL_SIZE_PX
							 / sprite_get_height(sprite_head)
							 * _id.genome[GEN.PLANT_HEAD_FORM_FACTOR];
		_my_scale_factor_w = sqrt(family_get_area(_id.genome[GEN.FAMILY]))
							 / CELL_WIDTH_DRAW 
							 * CELL_SIZE_PX
							 / sprite_get_width(sprite_head)
							 / _id.genome[GEN.PLANT_HEAD_FORM_FACTOR];
							 
		//show_debug_message(string(_id)+" BORN: "+string(_id.structure.biomass/_id.structure._biomass_adult_max)+" scale h: "+string(_my_scale_factor_h)+"scale w:"+string(_my_scale_factor_w))
	}

}