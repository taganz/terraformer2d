// update internal draw parameters to avoid doing this at draw event

function morphology_step(_id){

	with _id.morphology {
		
		if  _id.structure.biomass >= 0 {
		
			// adjust size
			// should check creature is not decreasing size? <------ 

			var _head_volum_sqrt = 	sqrt(_id.structure.biomass/_id.genome[GEN.BIOMASS_ADULT]);
			
			_head_h_scale = _head_volum_sqrt * _my_scale_factor_h;
			_head_w_scale = _head_volum_sqrt * _my_scale_factor_w;

			//show_debug_message(string(_id)+" mass%: "+string(_id.structure.biomass/_id.structure._biomass_adult_max_genome)+" scale h: "+string(_head_h_scale)+"scale w:"+string(_head_w_scale))


		}			
	}
}