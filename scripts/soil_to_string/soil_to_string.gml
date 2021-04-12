function soil_to_string(_soil) {
	var v = "";
	switch (_soil) {
		case SOIL.SAND:
			v = "SAND";
			break;
		case SOIL.LOAM:
			v = "LOAM";
			break;
		case SOIL.CLAY:
			v = "CLAY";
			break;
		default:
			return "invalid soil "+string(_soil);
	}
	
	return v;
}

