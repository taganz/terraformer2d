/*
	Saturation - refers to a soil's water content when practically all pore spaces are filled with water. 
	This is a temporary state for well-drained soils, as the excess water quickly drains out of the larger pores under the influence of gravity, 
	to be replaced by air.
	http://www.fao.org/3/y4690e/y4690e04.htm

	We suppose water drains out to field capacity level.
	
*/

function soil_saturation_water_kg(_soil) {
	
	var v = 0;
	v = soil_get_field_capacity(_soil);
	return CELL_AREA * v * SOIL_DEPTH_MM;    // kg:  area (m2) * FC (%) * soil depth (mm) * 1 kg water per mm per m2 (kg/mm/m2)
}


/*
	switch (_soil) {
		case SOIL.SAND:
			v = 0.3;
			break;
		case SOIL.LOAM:
			v = 0.4;
			break;
		case SOIL.CLAY:
			v = 0.6;
			break;
		default:
			ASSERT(false, 0, "soil_saturation_water_kg - invalid soil: "+string(_soil));
	}
	
	*/
	