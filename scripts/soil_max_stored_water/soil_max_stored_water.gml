
// assuming saturation level at 40% 

//for depth 1m --> 0.4 * area m2 * 1m vol soil , assuming density = 1 --> 0.4 * area * 1000 kg water 

function soil_max_stored_water(_soil) {
		return CELL_SIZE_REAL * CELL_SIZE_REAL * 400;    // kg
}