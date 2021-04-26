	
// === born
	
// adjust sprite image to specie
// in:
//		- sprite_head/body
//		- my_id.genome  --> we'll taks specie_code_x(genome) and specie_code_y(genome)
// output
//		- sprite_head_image
//		- sprite_trunk_image
//		- sprite_dead_image = 0

function morphology_plant_born(_id){
	

	with _id.morphology {
		
		// -- specie blend
		
		specie_blend = make_colour_hsv(_id.genome[GEN.SPECIE_HUE], 128, 255);
		
		// -- sprite_head_image
		
		switch (sprite_get_number(sprite_head)) {
		case 1:
			sprite_head_image = 0;
			break;
		case 4:
			sprite_head_image = (specie_code_x(_id.genome) + specie_code_y(_id.genome)) mod 4;
			break;
		case 5:
			sprite_head_image = (specie_code_x(_id.genome) + specie_code_y(_id.genome)) mod 5;
			break;
		case 6:
			sprite_head_image = (specie_code_x(_id.genome) + specie_code_y(_id.genome)) mod 6;
			break;
		case 16:
			sprite_head_image = specie_code_x(_id.genome) + specie_code_y(_id.genome) * 4; 
			break;
		default:
			sprite_head_image = 0;
			ASSERT(false, _id, "Morphology_Plant invalid sprite_get_number(sprite_head): "+string(sprite_get_number(sprite_head)==1));
		}
		
		// -- sprite_trunk_image
		
		switch (sprite_get_number(sprite_body)) {
		case 1:
			sprite_body_image = 0;
			break;
		case 4:
			sprite_body_image = (specie_code_x(_id.genome) + specie_code_y(_id.genome)) mod 4;
			break;
		case 5:
			sprite_body_image = (specie_code_x(_id.genome) + specie_code_y(_id.genome)) mod 5;
			break;
		case 6:
			sprite_body_image = (specie_code_x(_id.genome) + specie_code_y(_id.genome)) mod 6;
			break;
		case 16:
			sprite_body_image = specie_code_x(_id.genome) + specie_code_y(_id.genome) * 4; 
			break;
		default:
			sprite_body_image = 0;
			ASSERT(false, _id, "Morphology_Plant invalid sprite_get_number(sprite_head): "+string(sprite_get_number(sprite_head)==1));
		}
		
		sprite_dead_image = 0;
	}

}