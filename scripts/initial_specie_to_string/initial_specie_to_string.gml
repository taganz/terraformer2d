
function initial_specie_to_string(initial_specie_code){
	
	return string_replace_all(
		string_format(initial_specie_code, 2, 0)
		, " ", "0");

}