
function gen_enum(){


	#macro GEN_FIRST_MUTABLE 7		// first gen that can be affected by radiation
	
	#macro GEN_NUM 29				// gens total number (last active gen + 1)

	enum GEN {
		// immutable gens
		TROPHIC_LEVEL,						// 0
		GENUS,								// 1
		GENUS_NAME,							// 2 - string
		// current specie gens
		SPECIE_CODE,						// 3 - string
		PARENT_SPECIE_CODE,					// 4 - string
		SPECIE_HUE,							// 5 - real, used to build blend color
		DEPRECATED_10,						// 6 -  
		
		
		// gens that can be affected by radiation
		REPRODUCTION_QUANTITY,				// 7 - number of offspring each reproduction
		REPRODUCTION_INTERVAL,				// 8 - years between reproduction
		REPRODUCTION_DISTANCE,				// 9 - maximum distance where child will appear
		ALLOCATION_DIGESTIVE_ANIMALS,		// 10 - eaten biomass animals can store before metabolim
		ALLOCATION_REPRODUCTIVE,			// 11 
		TEMPERATURE_OPTIMAL,				// 12 - temperature where plants converts maximum biomass in anabolim
		TEMPERATURE_RANGE,					// 13 - temperature range where plants stops working
		COMBAT_DEFENSE_POINTS,				// 14 - 
		ALLOCATION_RESERVE,					// 15 - % of biomass used as reserve
		KC_METABOLIC_RATE,					// 16 - kg of biomass consumed per biomass kg per month
		// DORMANCY
		DORMANCY_TEMPERATURE_TRIGGER,		// 17 - NOT USED --- dormancy state will be triggered when temperature factor reaches this level
		DORMANCY_CATABOLISM_REDUCTION,		// 18 - catabolim level at low temperatures... NOT IMPLEMENTED THIS WAY: catabolism will be by this factor and temperature during dormancy
		DORMANCY_MONTHS,					// 19 - NOT USED --- the number of months dormancy will be activate before returning to normal activity
		// 20
		PLANT_BODY_DENSITY,					// 20 - biomass kg / volum m3	
		PLANT_BODY_FORM_FACTOR,				// 21 - (sprite height m / sprite width m2) ** 2
		PLANT_HEAD_DENSITY,					// 22
		PLANT_HEAD_FORM_FACTOR,				// 23
		KA_ANABOLISM_FACTOR,				// 24 conversion from anabolism_input to creature biomass  kg/kg/month
		COMBAT_ATTACK_POINTS,				// 25
		BIOMASS_ADULT,						// 26
		AGE_DEAD,							// 27
		EVOTRANSPIRATION_FACTOR,			// 28 - used to calculate leaf area reatio
		//
		// REMEMBER to update GEN_NUM!!  must be last used gen number + 1
		//
		// end of active gens
		EMPTY15,							// 29
		EMPTY14								// 30 
		
	}

}