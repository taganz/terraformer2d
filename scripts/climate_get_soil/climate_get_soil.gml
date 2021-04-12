/*
   Temporary: we give a predefined soil type to each climate 
   To be reviwed <--

*/


function climate_get_soil(soil){
	var v = 0;
	switch(soil) {
		case CLIMATE.DRY:
			v = SOIL.SAND;
			break;
		case CLIMATE.TROPICAL:
			v = SOIL.CLAY;
			break;
		case CLIMATE.MEDITERRANEAN:
			v = SOIL.LOAM;
			break;
		case CLIMATE.CONTINENTAL:
			v = SOIL.CLAY;
			break;
		case CLIMATE.TUNDRA:
			v = SOIL.CLAY;
			break;
		default:
			ASSERT(false, 0, "climate_get_soil - invalid soil: "+string(_soil));
	}
	return v;
}