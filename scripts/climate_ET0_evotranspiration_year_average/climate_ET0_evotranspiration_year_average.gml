

function climate_ET0_evotranspiration_year_average(climate) {
	var avg = 0;
		
	for (var _month = 0; _month < 12; _month++ ) {
		
		avg += climate_ET0_evotranspiration(climate, _month-1);
	}
	
	return avg/12;
}