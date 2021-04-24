function specie_code_replace_variant(specie_code, new_variant){
	
	ASSERT(new_variant <= 999, 0, "specie_code_format new_variant> 999");
		
	return string_copy(specie_code, 1, 5)
		+ string_replace_all(string_format(new_variant, 3, 0), " ", "0")	// variant 
		; 

}