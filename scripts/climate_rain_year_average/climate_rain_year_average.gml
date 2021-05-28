

// calculate monthly average rain for climate

function climate_rain_year_average(climate){

	if obj_gui.options_unlimited_water {
		return 999999/12;
	}
	else  {
			
		var avg = 0;
		
		for (var _month = 0; _month < 12; _month++ ) {
		
			avg += controller.world.climates[climate].rain[_month-1];
		}
	
		return avg/12;
	}

}