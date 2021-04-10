/// @function            climate_rain(climate, month)
/// @description         Returns rain water (mm - l/m2) 
/// @param {real} climate    Climate for the cell
/// @param {real}			month



function climate_rain(climate, _month) {

	if obj_gui.options_unlimited_water 
		return 999999
	else 
		return controller.world.climates[climate].rain[_month-1];

}
