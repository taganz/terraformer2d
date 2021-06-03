
function gen_enum(){


	#macro GEN_FIRST_MUTABLE 10		// first internal specie gen that can be affected by radiation
	
	
	enum GEN {
		// Genus 
		TROPHIC_LEVEL,						// 0
		GENUS,								// 1
		GENUS_NAME,							// 2 - string
		
		// Specie external, change depending on internal mutation
		SPECIE_CODE,						// 3 - string
		PARENT_SPECIE_CODE,					// 4 - specie's parent specie (not creature's parent specie)
		SPECIE_HUE,							// 5 - real, used to build blend color
		PLANT_BODY_DENSITY,					// 6 - biomass kg / volum m3	
		PLANT_BODY_FORM_FACTOR,				// 7 - (sprite height m / sprite width m2) ** 2
		PLANT_HEAD_DENSITY,					// 8
		PLANT_HEAD_FORM_FACTOR,				// 9
	
		// Specie internal, can be affected by radiation
		
		REPRODUCTION_QUANTITY,				// 10- number of offspring each reproduction
		REPRODUCTION_INTERVAL,				// 11 - years between reproduction
		REPRODUCTION_DISTANCE,				// 12 - maximum distance where child will appear
		
		AGE_DEAD,							// 13
		
		HEIGHT_ADULT,						// 14 - (m) 
		BIOMASS_ADULT,						// 15
		ALLOCATION_DIGESTIVE_ANIMALS,		// 16 - eaten biomass animals can store before metabolim
		ALLOCATION_REPRODUCTIVE,			// 17 
		BIOMASS_LIFE_FACTOR,				// 18 - % of biomass max need for live
		EVOTRANSPIRATION_FACTOR,			// 19 - used to calculate leaf area reatio
		KA_ANABOLISM_FACTOR,				// 20 conversion from anabolism_input to creature biomass  kg/kg/month
		KC_METABOLIC_RATE,					// 21 - kg of biomass consumed per biomass kg per month
		
		TEMPERATURE_OPTIMAL,				// 22 - temperature where plants converts maximum biomass in anabolim
		TEMPERATURE_RANGE,					// 23 - temperature range where plants stops working
		DORMANCY_CATABOLISM_REDUCTION,		// 24 - catabolim level at low temperatures... NOT IMPLEMENTED THIS WAY: catabolism will be by this factor and temperature during dormancy
		DORMANCY_TEMPERATURE_TRIGGER,		// 25 - NOT USED --- dormancy state will be triggered when temperature factor reaches this level
		DORMANCY_MONTHS,					// 26 - NOT USED --- the number of months dormancy will be activate before returning to normal activity
		
		COMBAT_DEFENSE_POINTS,				// 27 - 
		COMBAT_ATTACK_POINTS,				// 28
		
	
		// this is used to return the total number of gens
		_LENGTH_,							// last + 1 --> 
	
	
		// deprecated gens
		EMPTY15,							
		DEPRECATED_10
	
	
	}

}