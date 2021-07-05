

// Number must match GENUS_ID in excel definition


function genus_enum(){

	enum GENUS {
		NOPARENT				// 0 parent specie for genus - not valid as a genus!
		, PLANT_TREE			// 1
		, TREE_TROPICAL			// 2
		, TREE_CONTINENTAL		// 3
		, PLANT_BUSH			// 4
		, PLANT_BUSH_2			// 5  
		, PRIMARY_TINY			// 6   
		, PRIMARY_SMALL			// 7
		, SECONDARY_SMALL		// 8
		, PLANT_DESERT			// 9
		, PLANT_ARTIC			// 10
		, TREE_MEDITERRANEAN	// 11
		, CROP_BUSH				// 12
		, PRIMARY_TINY_2		// 13
		, PRIMARY_TINY_3		// 14
		, PLANT_BUSH_3			// 15
		, PLANT_BUSH_4			// 16
		, PLANT_BUSH_5			// 17
		, SECONDARY_MEDIUM		// 18
		, TREE_APPLE			// 19
		, PRIMARY_BIG			// 20
		, SECONDARY_BIG			// 21
		, SECONDARY_TINY		// 22
		, _LENGTH_
	}

}