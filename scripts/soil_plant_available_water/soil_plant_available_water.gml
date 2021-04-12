/*
IF THEN ELSE
(
stored water > soil field capacity * cell water kg ref,

(soil field capacity-soil permanent wilting point) *cell water kg ref, 

MAX(stored water - soil permanent wilting point *cell water kg ref, 0)

)
*/
function soil_plant_available_water(stored_water_kg, soil_FC_kg, soil_PWP_kg){

	var paw = 0;
	
	if stored_water_kg > soil_FC_kg {
		paw = soil_FC_kg - soil_PWP_kg;
	}
	else {
		paw = max(stored_water_kg - soil_PWP_kg, 0);
	}

	return paw;
}


/*
	_cell.stored_water > _cell.soil_saturation_water_kg * _cell.soil_field_capacity ? 
								_cell.soil_saturation_water_kg * (_cell.soil_field_capacity - _cell.soil_permanent_wilting_point) :
							max(0, _cell.stored_water - _cell.soil_saturation_water_kg * _cell.soil_permanent_wilting_point);



*/