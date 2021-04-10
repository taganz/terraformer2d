

// <-- calculate average rain for climate

function climate_rain_year_average(climate){

	if obj_gui.options_unlimited_water {
		return 999999
	}
	else  {
			
		var avg = 0;
		
		for (var _month = 0; _month < 12; _month++ ) {
		
			avg += controller.world.climates[climate].rain[_month-1] / 12;
		}
	
		return avg;
	}

}