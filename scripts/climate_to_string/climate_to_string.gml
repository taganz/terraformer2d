/// @function            climate_to_string(climate)
/// @description         Returns description
/// @param {real} climate    Climate for the cell



function climate_to_string(_climate) {
	
	return controller.world.climates[_climate].name;

}
