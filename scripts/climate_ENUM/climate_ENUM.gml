

// Order must fit tileset data!

// used in
//	- soil_get_losses_rate
//	- climate_get_soil

function climate_ENUM(){
	enum CLIMATE {
		DEFAULT,		// not a valid climate. need this because tile 0 is not valid
		DRY,
		TROPICAL,
		MEDITERRANEAN,
		CONTINENTAL,
		TUNDRA,
		SUPERARID			// desert with no water at all, event with unlimited water option
	}
}

#macro CLIMATE_NUM 7
