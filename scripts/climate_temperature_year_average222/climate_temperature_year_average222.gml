

// calculate monthly average temperature for climate

// NOT taking into account temperature increment

function climate_temperature_year_average(climate){

	var avg = 0;
		
	for (var _month = 0; _month < 12; _month++ ) {
		
		avg += controller.world.climates[climate].temperature[_month-1];
	}
	
	return avg/12;

}