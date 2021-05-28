/*

	rain expressed in mm
	
*/




function climate_read_array() {
	
	var climates = array_create(CLIMATE_NUM, 0);
	
	climates[CLIMATE.DEFAULT] = 
		{
			name : "Default",
			temperature : [ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0],
			rain : [ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0]
		};
	climates[CLIMATE.DRY] = 
		{
			name : "Dry",
			temperature : [ 20,  22,  25,  25,  27,  30,  35,  30,  24,  20,  17,  15],
			rain : [ 10,  5,  5,  5,  5,  5,  10,  10,  15,  15,  20,  20]
		};
		
	climates[CLIMATE.SUPERARID] = 
		{
			name : "Superarid",
			temperature : [ 30,  32,  35,  35,  37,  40,  45,  40,  34,  30,  27,  25],
			rain : [ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0]
		};
	climates[CLIMATE.TROPICAL] = 
		{
			name : "Tropical",
			temperature : [ 22,  22,  23,  23,  25,  27,  26,  25,  24,  23,  23,  23],
			rain : [ 30,  40,  50,  150,  210,  220,  400,  350,  300,  120,  70,  30]
		};
		
	climates[CLIMATE.MEDITERRANEAN] = 
		{
			name : "Mediterranean",
			temperature : [ 15,  18,  20,  25,  30,  30,  26,  25,  24,  20,  18,  13],
			rain : [ 50,  40,  30,  20,  10,  8,  5,  5,  10,  50,  60,  70]
		}
	climates[CLIMATE.CONTINENTAL] = 
		{
			name : "Continental",
			temperature : [ -10,  -5,  0,  5,  15,  20,  25,  30,  20,  10,  0, -5],
			rain : [ 40,  35,  40,  40,  60,  80,  90,  70,  60,  50,  50,  55]
		}
	climates[CLIMATE.TUNDRA] = 
		{
			name : "Tundra",
			temperature : [ -30,  -32,  -30,  -20,  -10,  -5,  0,  5,  10,  0,  -10,  -25],
			rain : [ 15,  18,  20,  25,  30,  30,  26,  25,  24,  20,  18,  13]
		}
		
		
	return climates;
		
}
