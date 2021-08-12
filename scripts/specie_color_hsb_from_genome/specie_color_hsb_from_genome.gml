// calculate specie hue 

function specie_color_hsb_from_genome(genome) {

	// get genus original color hsv values
	
	var col_genus = int64(genus_get_gen(genome[GEN.GENUS_ID], GEN.SPECIE_COLOR_HSB));
	if col_genus == -1 {
		//col = make_color_hsv(191, 191, 100);
		col_genus = c_white;
	}
	var h_genus = color_get_hue(col_genus);
	var s_genus = color_get_saturation(col_genus);
	var v_genus = color_get_value(col_genus);
	
	// get genus variation from genus to new specie
	
	var topt_genus = genus_get_gen(genome[GEN.GENUS_ID], GEN.TEMPERATURE_OPTIMAL);
	var trange_genus = genus_get_gen(genome[GEN.GENUS_ID], GEN.TEMPERATURE_RANGE);
	
	var topt = genome[GEN.TEMPERATURE_OPTIMAL];
	var trange = genome[GEN.TEMPERATURE_RANGE];
	
	//var topt_dif = (topt_genus - topt) / topt_genus;
	//var trange_dif = (trange_genus - topt) / trange_genus;
	
	
	// hue goes to red if toptimal increases and to blue otherwese
	// let's assume a maximum variation of 10ºC 
	
	if h_genus < 128 {			// quadrants 1,2  (supposing 0º = E)
		var h_new = h_genus + map(topt - topt_genus, -10, 10, 100, -100);   // 100 = aprox 140º
		var h_new = clamp(h_new, 0, 127);
	}
	else {				// quadrants 3,4
		var h_new = h_genus + map(topt - topt_genus, -10, 10, -100, 100);   
		var h_new = clamp(h_new, 127, 255);
	}
		
	// saturation increases if trange is greater
	// let's assume a maximum variation of 10ºC and this will cause a 50% variation
	
	var s_new = s_genus + map( trange - trange_genus, -10, 10, -63, 63);
	var s_new = clamp(s_new, 127, 255);
		
	// value doesn't change
	
	var v_new = v_genus;
	
	// create new color from components
	
	var col_new = make_colour_hsv(h_new, s_new, v_new);
	
	/*
	if col_genus != col_new {
		show_debug_message("new color."
						+" **  topt_genus, trange_genus: "+string(topt_genus)+","+string(trange_genus)
						+"   h,s,v genus: "+string(h_genus)+","+string(s_genus)+","+string(v_genus)
						+"   color genus: "+string(col_genus)
						+" ** dif topt:"+string(topt-topt_genus)
						+"   dif hue:"+string(h_new - h_genus)
						+" ** dif trange:"+string(trange-trange_genus)
						+"   dif sat:"+string(s_new - s_genus)
						+" **  topt, trange: "+string(topt)+","+string(trange)
						+"   h,s,v new: "+string(h_new)+","+string(s_new)+","+string(v_new)
						+"   color new: "+string(col_new)
						);
	}
	*/
	
	return col_new;
	
		
}

/*
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
*/