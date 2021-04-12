// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function soil_get_permanent_wilting_point(_soil){

	var v = 0;
	switch (_soil) {
		case SOIL.SAND:
			v = 0.03;
			break;
		case SOIL.LOAM:
			v = 0.12;
			break;
		case SOIL.CLAY:
			v = 0.27;
			break;
		default:
			ASSERT(false, 0, "soil_get_permanent_wilting_point - invalid soil: "+string(_soil));
	}
	
	return v;
}