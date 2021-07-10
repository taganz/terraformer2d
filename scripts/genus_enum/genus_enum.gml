

// Number must match GENUS_ID in excel definition


function genus_enum(){

	enum GENUS {
		NOPARENT			// 0 parent specie for genus - not valid as a genus!
		, PR_BUSH			// 1
		, PR_BUSH_2			// 2  
		, PR_BUSH_3			// 3
		, PR_BUSH_4			// 4
		, PR_BUSH_5			// 5
		, PR_BUSH_DESERT	// 6
		, PR_BUSH_ARTIC		// 7
		, PR_CROP_BUSH		// 8
		, PR_TREE_1			// 9
		, PR_TREE_2			// 10
		, PR_TREE_3			// 11
		, PR_TREE_4			// 12
		, PR_TREE_5			// 13
		, PRI_TINY			// 14  
		, PRI_TINY_2		// 15
		, PRI_TINY_3		// 16
		, PRI_SMALL			// 17
		, SEC_MEDIUM		// 18
		, PRI_BIG			// 19
		, SEC_TINY			// 20
		, SEC_SMALL			// 21
		, SEC_BIG			// 22
		, _LENGTH_
	}

}