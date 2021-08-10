// calculate specie hue 

function specie_color_hsb_from_genome(genome) {


	var topt_genus = genus_get_gen(genome[GEN.GENUS_ID], GEN.TEMPERATURE_OPTIMAL);
	var trange_genus = genus_get_gen(genome[GEN.GENUS_ID], GEN.TEMPERATURE_RANGE);
	var topt = genome[GEN.TEMPERATURE_OPTIMAL];
	var trange = genome[GEN.TEMPERATURE_RANGE];
	
	
	// === saturation (distance from white) shows mutation level
	
	var topt_dif = abs((topt_genus - topt) / topt_genus);
	var trange_dif = abs((trange_genus - topt) / trange_genus);
	var sat = map( topt_dif + trange_dif, 0, 1, 0, 255);
	
	
	// === Hue shows Toptimal variation
	
	// Toptimal has interval (-20, 30). 
	//	- range (-20, 10): hue (127, 255)
	//  - range (10, 30): hue (0, 50)
	

	if topt <= 10
		var hue = map(topt, -20, 10, 127, 255);
	else
		var hue = map(topt, 10, 30, 0, 50);

	// === Saturation
	


	// === Value / Luminosity / Brightness
	
	// Trange has interval (0, 20). 
	//	- saturation (127, 255)
	
	var val = map (trange, 0, 20, 127, 255);
	
	var color_hsb = make_colour_hsv(hue, sat, val);
	return color_hsb;
	
}
