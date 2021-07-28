

// ****************************************************
//
// must update gen_to_string() after modifying gen_enum
//
// ****************************************************

function gen_enum(){


#macro GEN_FIRST_MUTABLE 12	// first internal specie gen that can be affected by radiation
	
	enum GEN {
		// Genus 
		GENUS_ID,							// 0. genus id
		FAMILY,								// 1. genus' family
		GENUS_NAME,							// 2. human readable string
		TROPHIC_LEVEL,						// 3
		SPRITE_HEAD,						// 4. filename for sprite. must be located at datafiles\sprites

		// Specie external, change depending on internal mutation
		SPECIE_CODE,						// 5 - string
		PARENT_SPECIE_CODE,					// 6 - specie's parent specie (not creature's parent specie)
		SPECIE_HUE,							// 7 - real, used to build blend color
		SPRITE_SCALE_W,						// 8
		SPRITE_SCALE_H,						// 9
		COMBAT_DEFENSE_POINTS,				// 10 
		COMBAT_ATTACK_POINTS,				// 11
	
		// Specie internal, can be affected by radiation
		
		
		REPRODUCTION_QUANTITY,				// - number of offspring each reproduction
		REPRODUCTION_INTERVAL,				//  - years between reproduction
		REPRODUCTION_DISTANCE_M,				//  - maximum distance where child will appear
		
		AGE_DEAD,							// 
		
		HEIGHT_ADULT,						//  - (m) 
		BIOMASS_ADULT,						// 
		ALLOCATION_DIGESTIVE_ANIMALS,		//  - eaten biomass animals can store before metabolim
		ALLOCATION_REPRODUCTIVE,			//  
		BIOMASS_LIFE_FACTOR,				//  - % of biomass max need for live
		EVOTRANSPIRATION_FACTOR,			// used to calculate leaf area reatio
		KA_ANABOLISM_FACTOR,				// kg biomass obtained from kg of anabolism_input (kg/kg/month)
		KC_METABOLIC_RATE,					// kg of biomass consumed per biomass kg per month
		
		TEMPERATURE_OPTIMAL,				// temperature where plants converts maximum biomass in anabolim
		TEMPERATURE_RANGE,					// temperature range where plants stops working
		DORMANCY_CATABOLISM_REDUCTION,		// catabolim level at low temperatures... NOT IMPLEMENTED THIS WAY: catabolism will be by this factor and temperature during dormancy
		
		VIEW_RANGE,							// (m) - distance can see food or threat
		SPEED_SLOW,							// (distance/step) - speed looking for food
		SPEED_FAST,							// (distance/step) - speed chasing/escaping from threat
		ROOT_HEIGHT_RATIO,					// (adim) - root length to plant heigth ratio
		////////////////////////////////////////////////////////////
		// this is used to return the total number of gens
		_LENGTH_,							// last + 1 --> 
		////////////////////////////////////////////////////////////
	
		// deprecated gens
		//DORMANCY_TEMPERATURE_TRIGGER,		// NOT USED --- dormancy state will be triggered when temperature factor reaches this level
		//DORMANCY_MONTHS,					// NOT USED --- the number of months dormancy will be activate before returning to normal activity
		//EMPTY15,							// NOT USED 
		//DEPRECATED_10						// NOT USED 
	
	
	}

}