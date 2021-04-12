// mm/month

// To be reviewed, should include evaporation (must take in account ET0), percolation, ...  <----


function soil_get_losses_rate(soil_climate, soil_type){
	var v = 0;
	switch (soil_climate) {
		case CLIMATE.DRY:
			switch (soil_type) {
				case SOIL.SAND: v = 4; break;
				case SOIL.LOAM:	v = 4;	break;
				case SOIL.CLAY:	v = 4;	break;
			}
		break;
		case CLIMATE.MEDITERRANEAN:
			switch (soil_type) {
				case SOIL.SAND: v = 4; break;
				case SOIL.LOAM:	v = 4;	break;
				case SOIL.CLAY:	v = 4;	break;
			}
		break;
		case CLIMATE.CONTINENTAL:
			switch (soil_type) {
				case SOIL.SAND: v = 4; break;
				case SOIL.LOAM:	v = 4;	break;
				case SOIL.CLAY:	v = 4;	break;
			}
		break;
		case CLIMATE.TROPICAL:
			switch (soil_type) {
				case SOIL.SAND: v = 4; break;
				case SOIL.LOAM:	v = 4;	break;
				case SOIL.CLAY:	v = 4;	break;
			}
		break;
		case CLIMATE.TUNDRA:
			switch (soil_type) {
				case SOIL.SAND: v = 4; break;
				case SOIL.LOAM:	v = 4;	break;
				case SOIL.CLAY:	v = 4;	break;
			}
		break;
	}
	
	return v;
}