// == log event codes enum

function LOGEVENT_enum(){

	enum LOGEVENT {
		//CREATURE_ADULT,
		CREATURE_BORN,
		CREATURE_BORN_INFO,
		//CREATURE_BORN_INFO_NUM,
		CREATURE_ANABOLISM,					// obtained biomass during metabolism
		CREATURE_CATABOLISM,				// consumed biomass during metabolism
		CREATURE_DEAD,
		CREATURE_DEAD_INFO,
		CREATURE_DEAD_INFO_NUM,
		CREATURE_BIOMASS,					// biomass at the end of step
		CREATURE_BIOMASS_EAT,			
		CREATURE_BIOMASS_BODY,			
		CREATURE_BIOMASS_REPRODUCTION,			
		// CREATURE_BIOMASS_RESERVE,		// 
		CREATURE_DECOMPOSE,
		CREATURE_DECOMPOSE_COMPLETED,
		CREATURE_EAT,
		CREATURE_ANABOLISM_INPUT,			// plants
		CREATURE_BEEN_EATED,
		CREATURE_DEBUG,
		CREATURE_LIFE_EVENT,
		CREATURE_STARVING,
		CREATURE_REPRODUCTION,
		CREATURE_TEMPERATURE,				// at cell this month
		CREATURE_RAIN,						// at cell this month
		//CREATURE_WATER_RECEIVED,			// plants
		CREATURE_CELL_PLANTS_AVAILABLE_WATER,	// PAW at creature cell
		
		// Species stats
		
		SPECIE_NEW,							
		SPECIE_BORN,				// individuals born per climate
		SPECIE_ADULT,				
		SPECIE_DEAD,			
		SPECIE_GENOME,
		
		
		
		// World stats

		GENUS_POPULATION,				// total population for genus at current sim step
		WORLD_POPULATION,				// total population for trophic level at current sim step
		WORLD_BIOMASS,					// total biomass for trophic level at a current sim step
		WORLD_PROBE_SOIL,				// soil data 
		WORLD_PROBE_CLIMATE,			// climate data					
		WORLD_PROBE_TEMPERATURE,					
		//WORLD_SPAWNER,
		WORLD_INITIAL_GENUS,			// report initial situation
		WORLD_PROBE_RAIN_TEMP,					
		WORLD_PROBE_PLANT_AVAILABLE_WATER,					
		
		// Simulation information
		
		INFO_WARNING,						// system warning
		INFO_ERROR,							// system error
		INFO_ERROR_ASSERT, 					// error from ASSERT function
		INFO_PARAMETERS						// info about simulation parameters
	}



}