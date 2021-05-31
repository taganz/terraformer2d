// returna an array with climate strings
function climate_array_climates(){

	var array_climates = climate_definitions();

	var a = 0;
	for (var i=0; i<CLIMATE_NUM;i++) {
		a[i] = array_climates[i].name;
	}
	return a;	
}