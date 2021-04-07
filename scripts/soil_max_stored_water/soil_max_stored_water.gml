
// assuming saturation level at 40% 

//for depth 1m --> 0.4 * area m2 * 1m vol soil , assuming density = 1 --> 0.4 * area * 1000 kg water 

function soil_saturation_water_kg(_soil) {
		return CELL_AREA * 400;    // kg
}