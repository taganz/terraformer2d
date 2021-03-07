// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gen_enum(){


	#macro GEN_FIRST_MUTABLE 7		// first gen that can be affected by radiation
	#macro GEN_NUM 28				// gens total number (last gen + 1)

	enum GEN {
		// immutable gens
		TROPHIC_LEVEL,						// 0
		INITIAL_SPECIE,						// 1
		INITIAL_SPECIE_NAME,				// 2 - string
		// current specie gens
		SPECIE_CODE,						// 3 - string
		PARENT_SPECIE_CODE,					// 4 - string
		EMPTY5,
		EMPTY6,
		// gens that can be affected by radiation
		REPRODUCTION_QUANTITY,				// 7 - number of offspring each reproduction
		REPRODUCTION_INTERVAL,				// 8 - years between reproduction
		REPRODUCTION_DISTANCE,				// 9 - maximum distance where child will appear
		ALLOCATION_DIGESTIVE,				// 10 - eaten biomass animals can store before metabolim
		ALLOCATION_REPRODUCTIVE,			// 11 
		TEMPERATURE_OPTIMAL,				// 12 - temperature where plants converts maximum biomass in anabolim
		TEMPERATURE_RANGE,			// 13 - temperature range where plants stops working
		ANABOLISM_BIOMASS_PER_WATER_L,		// 14 - kg of biomass generatd per l
		ALLOCATION_RESERVE,					// 15 - % of biomass used as reserve
		METABOLIC_RATE,						// 16 - kg of biomass consumed per biomass kg per year
		DEPRECATED_GROWTH_KG_YR,			// 17 - kg per year consumed during growth
		DEPRECATED_AGE_ADULT,							// 18
		PLANT_BODY_DENSITY,					// 19 - biomass kg / volum m3	
		PLANT_BODY_FORM_FACTOR,				// 20 - (sprite height m / sprite width m2) ** 2
		PLANT_HEAD_DENSITY,					// 21 
		PLANT_HEAD_FORM_FACTOR,				// 22
		ANIMAL_ANABOLISM_BIOMASS_CONVERSION, // 23			// conversion from eaten biomass to creature biomass
		BIOMASS_BIRTH,						// 24
		DEPRECATED_BIOMASS_REPRODUCTION,				// 25		minimum mass to start reproduction
		BIOMASS_ADULT,						// 26
		AGE_DEAD							// 27
	
	}

}