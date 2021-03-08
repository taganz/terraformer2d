// ===== CELL (struct)

// contains bioma and nutrients in a given terrain cell

function Cell() constructor {
	x_cell = -1;
	y_cell = -1;
	//list_creatures = ds_list_create();
	list_producers_small = ds_list_create();
	list_producers_big = ds_list_create();
	list_primaries = ds_list_create();
	list_secondaries = ds_list_create();
	list_dead_creatures = ds_list_create();
	soil_type = SOIL.DEFAULT;
	soil_available_water_max = SOIL_FIELD_CAPACITY * SOIL_WEIGHT_PER_CELL;  // l/CELL
										// we'll take a soil volum reference of SOIL_WEIGHT_PER_CELL per cell
	available_water = 0;				// (l/CELL) water a plant can get
	rain_current_month = 0;				// rain fallen current month
	temperature_current_month = 0;
	climate = -1;						// climate defines rain, temperature
	map_nutrients = ds_map_create();
	// to_string
	to_string = function() {
		var ss = "";
		
		ss+= string(x_cell)+","+string(y_cell);
		ss += "Soil: "+soil_to_string(soil_type);
		ss = ss + "Climate: "+ climate_to_string(climate);
		ss = ss + "Available water: "+ string(available_water);
		
		// concatenate creatures
		ss += "Creatures: ";
		for (var i = 0; i< ds_list_size(list_producers_small);i++) {
			ss = ss + string(ds_list_find_value(list_producers_small, i))+ ".";
		}
		for (var i = 0; i< ds_list_size(list_producers_big);i++) {
			ss = ss + string(ds_list_find_value(list_producers_big, i))+ ".";
		}
		for (var i = 0; i< ds_list_size(list_primaries);i++) {
			ss = ss + string(ds_list_find_value(list_primaries, i))+ ".";
		}
		for (var i = 0; i< ds_list_size(list_secondaries);i++) {
			ss = ss + string(ds_list_find_value(list_secondaries, i))+ ".";
		}
		// concatenate dead creatures
		ss = ss + "\nDead creatures: ";
		for (var i = 0; i< ds_list_size(list_dead_creatures);i++) {
			ss = ss + string(ds_list_find_value(list_dead_creatures, i))+ ".";
		}
		// concatenate nutrients
		ss = ss + "\nNutrients: ";
		var key = ds_map_find_first(map_nutrients);
		for (i = 0; i< ds_map_size(map_nutrients);i++) {
			ss = ss + "   "+string(key)+": "+string(map_nutrients[? key]);
			key = ds_map_find_next(map_nutrients, key);
		}
		return ss;
	}
		
}
	
	
	