
function soil_get_field_capacity(_soil){
	
	var v = 0;
	switch (_soil) {
		case SOIL.SAND:
			v = 0.09;
			break;
		case SOIL.LOAM:
			v = 0.27;
			break;
		case SOIL.CLAY:
			v = 0.40;
			break;
		default:
			ASSERT(false, 0, "soil_get_field_capacity - invalid soil: "+string(_soil));
	}
	
	return v;
}