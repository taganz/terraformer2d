// === step
	
// update draw parameters, to avoid doing this at draw event
// in:
//	my_id.structure.biomass	
//					body_density
//					head_density
//					body_form_factor
//					head_form_factor

function morphology_plant_step(_id){

	with _id.morphology {
		
		
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
}