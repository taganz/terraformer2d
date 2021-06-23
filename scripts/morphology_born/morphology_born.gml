
function morphology_born(_id){
	

	with _id.morphology {
		
		// -- specie blend
		
		if _id.genome[GEN.SPECIE_HUE] == -1
			specie_blend = c_white;
		else
			specie_blend = make_colour_hsv(_id.genome[GEN.SPECIE_HUE], 128, 255);

		

	}

}