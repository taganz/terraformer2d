/*
	formats specie code

	    X   - trophic level
		X   - initial specie 
		0	- sprite sheet x offset 
		0   - sprite sheet y offset
		00  - specie variant 
		00  - genus (NOT USED AT PRESENT)



*/
function specie_code_format(prefix, int_variant, int_genus){
	
	ASSERT(int_variant <= 99, 0, "specie_code_format int_variant > 99");
		
	return prefix 
		+ string_replace(string_format(int_variant, 2, 0), " ", "0")	// variant 
		+ string_replace(string_format(int_genus, 2, 0), " ", "0")		// genus
		; 

}