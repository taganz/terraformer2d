// return a string showing creatures and nutrients for cell corresponding to pixels _x, _y
function cell_to_string(_cell){
	
	if _cell == 0 {
		return "empty cell";
	}
	else {
		
		with _cell {
			
			var ss = "";
		
			ss+= "Cell pos: "+string(x_cell)+","+string(y_cell);
			ss += "\nSoil: "+soil_to_string(soil_type)+ ", water max:"+ string(_cell.soil_available_water_max);
			ss = ss + "\nClimate: "+ climate_to_string(climate);
			ss = ss + "\nAvailable water: "+ string(available_water);
		
			// concatenate creatures
			ss += "\nSmall producers: ";
			for (var i = 0; i< ds_list_size(list_producers_small);i++) {
				ss = ss + string(ds_list_find_value(list_producers_small, i))+ ".";
			}
			ss+= "\nBig producers:";
			for (var i = 0; i< ds_list_size(list_producers_big);i++) {
				ss = ss + string(ds_list_find_value(list_producers_big, i))+ ".";
			}
			ss+= "\nPrimaries:";
			for (var i = 0; i< ds_list_size(list_primaries);i++) {
				ss = ss + string(ds_list_find_value(list_primaries, i))+ ".";
			}
			ss+= "\nSecondaries:";
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
}