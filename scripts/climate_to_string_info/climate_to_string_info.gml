/// @function            climate_to_string(climate)
/// @description         Returns description
/// @param {real} climate    Climate for the cell



function climate_to_string_info(_climate) {
	
	return "Climate: "+climate_to_string(_climate)
		+"\n"
		+"\nMonth . Temp (ºC) . Rain (mm) . ET0 (mm/month)"
		+"\nJAN "+ _format_month_temp_rain(_climate, 1)
		+"\nFEB "+ _format_month_temp_rain(_climate, 2)
		+"\nMAR "+ _format_month_temp_rain(_climate, 3)
		+"\nAPR "+ _format_month_temp_rain(_climate, 4)
		+"\nMAY "+ _format_month_temp_rain(_climate, 5)
		+"\nJUN "+ _format_month_temp_rain(_climate, 6)
		+"\nJUL "+ _format_month_temp_rain(_climate, 7)
		+"\nAGO "+ _format_month_temp_rain(_climate, 8)
		+"\nSET "+ _format_month_temp_rain(_climate, 9)
		+"\nOCT "+ _format_month_temp_rain(_climate, 10)
		+"\nNOV "+ _format_month_temp_rain(_climate, 11)
		+"\nDEC "+ _format_month_temp_rain(_climate, 12)
		+"\nAvg."+string_format(climate_temperature_year_average(_climate), 4, 1)
				+" . "
				+ string_format(climate_rain_year_average(_climate), 4, 1)
				+" . "
				+ string_format(climate_ET0_evotranspiration_year_average(_climate), 4, 1)
					
}

function _format_month_temp_rain(_climate, _month) {
	var t = controller.world.climates[_climate].temperature[_month-1];
	var r = controller.world.climates[_climate].rain[_month-1];
	var e = climate_ET0_evotranspiration(_climate, _month-1);
	return " . " + string_format(t, 4, 1) + " . " + string_format(r, 4, 1) +" . " + string_format(e, 4, 1);
}

