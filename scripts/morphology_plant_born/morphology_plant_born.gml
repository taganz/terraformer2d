	
// === born
	
// adjust sprite to specie
// in:
//		- sprite_head/body
//		- my_id.genome
// output
//		- sprite_head/body/dead_image
function morphology_plant_born(_id){
	

	with _id.morphology {
		
		// -- sprite_head_image
		
		switch (sprite_get_number(sprite_head)) {
		case 1:
			sprite_head_image = 0;
			break;
		case 4:
			sprite_head_image = (specie_code_x(my_id.genome) + specie_code_y(my_id.genome)) mod 4;
			break;
		case 6:
			sprite_head_image = (specie_code_x(my_id.genome) + specie_code_y(my_id.genome)) mod 6;
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
		case 6:
			sprite_body_image = (specie_code_x(my_id.genome) + specie_code_y(my_id.genome)) mod 6;
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

}