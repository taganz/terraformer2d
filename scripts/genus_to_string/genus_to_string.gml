
function genus_to_string(genus_code){
	
	return string_replace_all(
		string_format(genus_code, 2, 0)
		, " ", "0");

}