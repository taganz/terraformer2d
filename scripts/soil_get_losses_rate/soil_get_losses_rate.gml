// mm/month

// To be reviewed, should include evaporation (must take in account ET0), percolation, ...  <----



function soil_get_losses_rate(soil_climate, soil_type){
	var v = 0;
	
	switch (soil_climate) {
		case CLIMATE.SUPERARID:
			v = 999999; 
			break;
		case CLIMATE.DRY:
			switch (soil_type) {
				case SOIL.SAND: v = SOIL_WATER_LOSS_DEFAULT * 1 * 2; break;
				case SOIL.LOAM:	v = SOIL_WATER_LOSS_DEFAULT * 1 * 1;	break;
				case SOIL.CLAY:	v = SOIL_WATER_LOSS_DEFAULT * 1 * 1;	break;
			}
		break;
		case CLIMATE.MEDITERRANEAN:
			switch (soil_type) {
				case SOIL.SAND: v = SOIL_WATER_LOSS_DEFAULT * 3 * 2; break;
				case SOIL.LOAM:	v = SOIL_WATER_LOSS_DEFAULT * 3 * 1;	break;
				case SOIL.CLAY:	v = SOIL_WATER_LOSS_DEFAULT * 3 * 1;	break;
			}
		break;
		case CLIMATE.CONTINENTAL:
			switch (soil_type) {
				case SOIL.SAND: v = SOIL_WATER_LOSS_DEFAULT * 5 * 2; break;
				case SOIL.LOAM:	v = SOIL_WATER_LOSS_DEFAULT * 5 * 1;	break;
				case SOIL.CLAY:	v = SOIL_WATER_LOSS_DEFAULT * 5 * 1;	break;
			}
		break;
		case CLIMATE.TROPICAL:
			switch (soil_type) {
				case SOIL.SAND: v = SOIL_WATER_LOSS_DEFAULT * 10 * 2; break;
				case SOIL.LOAM:	v = SOIL_WATER_LOSS_DEFAULT * 10 * 1;	break;
				case SOIL.CLAY:	v = SOIL_WATER_LOSS_DEFAULT * 10 * 1;	break;
			}
		break;
		case CLIMATE.TUNDRA:
			switch (soil_type) {
				case SOIL.SAND: v = SOIL_WATER_LOSS_DEFAULT * 1 * 2; break;
				case SOIL.LOAM:	v = SOIL_WATER_LOSS_DEFAULT * 1 * 1;	break;
				case SOIL.CLAY:	v = SOIL_WATER_LOSS_DEFAULT * 1 * 1;	break;
			}
		break;
		default:
			v = SOIL_WATER_LOSS_DEFAULT;
	}
	
	return v;
}