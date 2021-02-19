/*
	returns a string
    X   - trophic level
	X   - initial specie 
	00  - sprite sheet x offset, sprite sheet y offset
	00  - specie variant (TBC)
	00  - genus (TBC)

*/

function specie_code_initial(trophic_level, initial_specie){
			
	var code = "";
	code = trophic_level_to_char(trophic_level)
			+string(initial_specie) 
			+"00"						// x, y
			+"00"						// variant
			+"00";						// genus
	return code;

}