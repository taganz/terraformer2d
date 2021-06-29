/// @function           climate_rain(climate, frac_year)
/// @description        Returns climate temperature + temperature_increment (ºC) 
/// @param {real}	climate    
/// @param {real}	month



function climate_temperature(climate, _month) {

	return controller.world.climates[climate].temperature[_month-1] 
		+ controller.world.temperature_increment;
}
