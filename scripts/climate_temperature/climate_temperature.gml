/// @function           climate_rain(climate, frac_year)
/// @description        Returns climate temperature + climate_change_temperature_increment (ºC) 
/// @param {real}	climate    
/// @param {real}	month



function climate_temperature(climate, _month) {

	return controller.world.climates[climate].temperature[_month-1] 
		+ controller.world.climate_change_temperature_increment;
}
