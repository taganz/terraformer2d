// == log event codes enum

function LOGEVENT_enum(){

	enum LOGEVENT {
		//CREATURE_ADULT,
		CREATURE_BORN,
		CREATURE_BORN_INFO,
		CREATURE_BORN_INFO_NUM,
		CREATURE_ANABOLISM,					// obtained biomass during metabolism
		CREATURE_CATABOLISM,				// consumed biomass during metabolism
		CREATURE_DEAD,
		CREATURE_DEAD_INFO,
		CREATURE_DEAD_INFO_NUM,
		CREATURE_BIOMASS,					// biomass at the end of step
		CREATURE_BIOMASS_EAT,			
		CREATURE_BIOMASS_BODY,			
		CREATURE_BIOMASS_REPRODUCTION,			
		CREATURE_BIOMASS_RESERVE,		// 
		CREATURE_DECOMPOSE,
		CREATURE_DECOMPOSE_COMPLETED,
		CREATURE_EAT,
		CREATURE_BEEN_EATED,
		CREATURE_DEBUG,
		CREATURE_LIFE_EVENT,
		CREATURE_STARVING,
		CREATURE_REPRODUCTION,
		CREATURE_TEMPERATURE,				// at cell this month
		CREATURE_RAIN,						// at cell this month
		CREATURE_WATER_RECEIVED,			// plants
		SPECIE_NEW,							
		CLIMATE_BORN,			
		PROBE_NUTRIENTS,
		PROBE_WATER,					
		PROBE_TEMPERATURE,					
		SPAWNER,
		WORLD_POPULATION,				// total population for a trophic level
		PROBE_RAIN_TEMPERATURE,						
		WARNING,						// system warning
		ERROR,							// system error
		ERROR_ASSERT, 					// error from ASSERT function
		SIMULATION_PARAMETERS,				// info about simulation parameters
	}



}