// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information



enum GEN {
	// gen 0 and 1 are not afected by radiation
	NAME,								// 0 - string
	TROPHIC_LEVEL,						// 1 
	// gen 2 to GEN_NUM -1 can be affected by radiation
	AGE_DEAD,							// 2
	REPRODUCTION_INTERVAL,				// 3 - years between reproduction
	REPRODUCTION_DISTANCE,				// 4 - maximum distance where child will appear
	ALLOCATION_DIGESTIVE,				// 5 - eaten biomass animals can store before metabolim
	ALLOCATION_REPRODUCTIVE,			// 6 
	TEMPERATURE_OPTIMAL,				// 7 - temperature where plants converts maximum biomass in anabolim
	TEMPERATURE_RANGE_MINIMUM,			// 8 - temperature range where plants stops working
	ANABOLISM_BIOMASS_PER_WATER_L,		// 9 - kg of biomass generatd per l
	DEPRECATED_10,						// 10 
	METABOLIC_RATE,						// 11 - kg of biomass consumed per biomass kg per year
	GROWTH_KG_YR,						// 12 - kg per year consumed during growth
	AGE_ADULT,							// 13
	PLANT_BODY_DENSITY,					// 14 - biomass kg / volum m3	
	PLANT_BODY_FORM_FACTOR,				// 15 - (sprite height m / sprite width m2) ** 2
	PLANT_HEAD_DENSITY,					// 16 
	PLANT_HEAD_FORM_FACTOR,				// 17
	ANIMAL_ANABOLISM_BIOMASS_CONVERSION, // 18			// conversion from eaten biomass to creature biomass
	// plant
	BIOMASS_BIRTH,						// 19
	BIOMASS_REPRODUCTION,				// 20		minimum mass to start reproduction
	BIOMASS_ADULT						// 21
	
}
#macro GEN_NUM 19		// gens number, used to initialise genome array to zero

enum SPECIE {
	//PLANT_SMALL,
	PLANT_TREE,
	PLANT_TREE_3,
	PLANT_TREE_4,
	PLANT_BUSH,
	PLANT_BUSH_2,
	PRIMARY_TINY,
	PRIMARY_SMALL,
	SECONDARY_SMALL
}



function DNA(_initial_specie) constructor {
	
	// === initialize creature genome with selected initial specie	
	genome = array_create(GEN_NUM, 0);
		
	// === get_initial_specie_genome(nom_especie) 
	get_initial_specie_genome = function (_initial_specie) {
		var _genome =  array_create(GEN_NUM, 0);
		switch(_initial_specie) {
			case SPECIE.PLANT_TREE: 
			_genome[GEN.NAME] = "Tree";    // es un tree!
			_genome[GEN.TROPHIC_LEVEL] = TROPHIC_LEVEL.PRODUCER;    // 
			_genome[GEN.AGE_DEAD] = 12;    // 
			_genome[GEN.REPRODUCTION_INTERVAL] = 0.8;    // 
			_genome[GEN.REPRODUCTION_DISTANCE] = 64;    // 
			_genome[GEN.BIOMASS_BIRTH] = 3;    // 
			_genome[GEN.BIOMASS_REPRODUCTION] = 400;    // 
			_genome[GEN.BIOMASS_ADULT] = 800;    // 
			_genome[GEN.METABOLIC_RATE] = 0.2;    // 
			_genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L] = 0.4;			
			_genome[GEN.TEMPERATURE_OPTIMAL] = 30;			
			_genome[GEN.TEMPERATURE_RANGE_MINIMUM] = -15;			
			_genome[GEN.PLANT_BODY_DENSITY] =  400;			
			_genome[GEN.PLANT_BODY_FORM_FACTOR] =  1.2;		
			_genome[GEN.PLANT_HEAD_DENSITY] =  50;
			_genome[GEN.PLANT_HEAD_FORM_FACTOR] =  1;		
			break;
			
			case SPECIE.PLANT_TREE_3: 
			_genome[GEN.NAME] = "Tree 3";    // es un tree!
			_genome[GEN.TROPHIC_LEVEL] = TROPHIC_LEVEL.PRODUCER;    // 
			_genome[GEN.AGE_DEAD] = 6;    // 
			_genome[GEN.REPRODUCTION_INTERVAL] = 1.3;    // 
			_genome[GEN.REPRODUCTION_DISTANCE] = 64;    // 
			_genome[GEN.BIOMASS_BIRTH] = 5;    // 
			_genome[GEN.BIOMASS_REPRODUCTION] = 100;    // 
			_genome[GEN.BIOMASS_ADULT] = 250;    // 
			_genome[GEN.METABOLIC_RATE] = 0.2;    // 
			_genome[GEN.TEMPERATURE_OPTIMAL] = 30;			
			_genome[GEN.TEMPERATURE_RANGE_MINIMUM] = -15;			
			_genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L] = 0.4;			
			_genome[GEN.PLANT_BODY_DENSITY] =  200;			
			_genome[GEN.PLANT_BODY_FORM_FACTOR] =  1.5;		
			_genome[GEN.PLANT_HEAD_DENSITY] =  50;
			_genome[GEN.PLANT_HEAD_FORM_FACTOR] =  0.7;		
			break;
			
			case SPECIE.PLANT_TREE_4: 
			_genome[GEN.NAME] = "Tree 4 mountain";    // es un tree!
			_genome[GEN.TROPHIC_LEVEL] = TROPHIC_LEVEL.PRODUCER;    // 
			_genome[GEN.AGE_DEAD] = 6;    // 
			_genome[GEN.REPRODUCTION_INTERVAL] = 1.3;    // 
			_genome[GEN.REPRODUCTION_DISTANCE] = 64;    // 
			_genome[GEN.BIOMASS_BIRTH] = 5;    // 
			_genome[GEN.BIOMASS_REPRODUCTION] = 90;    // 
			_genome[GEN.BIOMASS_ADULT] = 200;    //					// less biomass?
			_genome[GEN.METABOLIC_RATE] = 0.3;    // 
			_genome[GEN.TEMPERATURE_OPTIMAL] = 20;			
			_genome[GEN.TEMPERATURE_RANGE_MINIMUM] = -45;			// cold temperatures
			_genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L] = 0.3;		// needs more water?
			_genome[GEN.PLANT_BODY_DENSITY] =  400;			
			_genome[GEN.PLANT_BODY_FORM_FACTOR] =  1.3;		
			_genome[GEN.PLANT_HEAD_DENSITY] =  50;
			_genome[GEN.PLANT_HEAD_FORM_FACTOR] =  1.3;		
			break;
						
			case SPECIE.PLANT_BUSH: 
			_genome[GEN.NAME] = "Plant bush";    
			_genome[GEN.TROPHIC_LEVEL] = TROPHIC_LEVEL.PRODUCER;    // 
			_genome[GEN.AGE_DEAD] = 3;    // 
			_genome[GEN.REPRODUCTION_INTERVAL] = 0.8;    // 
			_genome[GEN.REPRODUCTION_DISTANCE] = 64;    // 
			_genome[GEN.BIOMASS_BIRTH] = 2;    // 
			_genome[GEN.BIOMASS_REPRODUCTION] = 5;    // 
			_genome[GEN.BIOMASS_ADULT] = 10;    // 
			_genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L] =  0.4;			
			_genome[GEN.METABOLIC_RATE] =  0.20;
			_genome[GEN.TEMPERATURE_OPTIMAL] = 25;			
			_genome[GEN.TEMPERATURE_RANGE_MINIMUM] = -10;			
			_genome[GEN.PLANT_BODY_DENSITY] =  0;			// small body
			_genome[GEN.PLANT_BODY_FORM_FACTOR] =  0;		
			_genome[GEN.PLANT_HEAD_DENSITY] =  20;
			_genome[GEN.PLANT_HEAD_FORM_FACTOR] =  1;			
			break;
			
			case SPECIE.PLANT_BUSH_2: 
			_genome[GEN.NAME] = "Plant bush 2";    
			_genome[GEN.TROPHIC_LEVEL] = TROPHIC_LEVEL.PRODUCER;    // 
			_genome[GEN.AGE_DEAD] = 3;    // 
			_genome[GEN.REPRODUCTION_INTERVAL] = 0.8;    // 
			_genome[GEN.REPRODUCTION_DISTANCE] = 64;    // 
			_genome[GEN.BIOMASS_BIRTH] = 4;    // 
			_genome[GEN.BIOMASS_REPRODUCTION] = 10;    // 
			_genome[GEN.BIOMASS_ADULT] = 20;    // 
			_genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L] =  0.4;			
			_genome[GEN.METABOLIC_RATE] =  0.2;
			_genome[GEN.TEMPERATURE_OPTIMAL] = 30;			
			_genome[GEN.TEMPERATURE_RANGE_MINIMUM] = -10;			
			_genome[GEN.PLANT_BODY_DENSITY] =  0;			// small body
			_genome[GEN.PLANT_BODY_FORM_FACTOR] =  0;		
			_genome[GEN.PLANT_HEAD_DENSITY] =  20;
			_genome[GEN.PLANT_HEAD_FORM_FACTOR] =  1;			
			break;		
			
			
			case SPECIE.PRIMARY_SMALL: 
			_genome[GEN.NAME] = "Primary small";    
			_genome[GEN.TROPHIC_LEVEL] = TROPHIC_LEVEL.PRIMARY;    // 
			_genome[GEN.AGE_DEAD] = 4;    // 
			_genome[GEN.REPRODUCTION_INTERVAL] = 0.05;    // 
			_genome[GEN.REPRODUCTION_DISTANCE] = 128;    // 
			_genome[GEN.GROWTH_KG_YR] = 50;     
			_genome[GEN.AGE_ADULT] = 1;         
			_genome[GEN.ANIMAL_ANABOLISM_BIOMASS_CONVERSION] = 0.5 // 
			_genome[GEN.METABOLIC_RATE] =  0.12;
			_genome[GEN.ALLOCATION_DIGESTIVE] = 0.2;    // kg
			_genome[GEN.ALLOCATION_REPRODUCTIVE] = 0.1;    // kg
			break;
			
			case SPECIE.PRIMARY_TINY: 
			_genome[GEN.NAME] = "Primary tiny";    
			_genome[GEN.TROPHIC_LEVEL] = TROPHIC_LEVEL.PRIMARY;    // 
			_genome[GEN.AGE_DEAD] = 4;    // 
			_genome[GEN.REPRODUCTION_INTERVAL] = 0.05;    // 
			_genome[GEN.REPRODUCTION_DISTANCE] = 128;    // 
			_genome[GEN.GROWTH_KG_YR] = 5;     
			_genome[GEN.AGE_ADULT] = 1;         
			_genome[GEN.ANIMAL_ANABOLISM_BIOMASS_CONVERSION] = 0.5 // 
			_genome[GEN.METABOLIC_RATE] =  0.12;
			_genome[GEN.ALLOCATION_DIGESTIVE] = 0.4;    // kg
			_genome[GEN.ALLOCATION_REPRODUCTIVE] = 0.1;    // kg
			break;
			
			case SPECIE.SECONDARY_SMALL: 
			_genome[GEN.NAME] = "Secondary small";    
			_genome[GEN.TROPHIC_LEVEL] = TROPHIC_LEVEL.SECONDARY;    // 
			_genome[GEN.AGE_ADULT] = 2;    // 
			_genome[GEN.AGE_DEAD] = 7;    // 
			_genome[GEN.REPRODUCTION_INTERVAL] = 1;    // 
			_genome[GEN.REPRODUCTION_DISTANCE] = 128;    // 
			//_genome[GEN.BIOMASS_BIRTH] = 75;    // 
			_genome[GEN.BIOMASS_ADULT_MINIMUM] = 100;    // 
			//_genome[GEN.BIOMASS_WANTED_PER_YEAR_ADULT] = 500;    // 
			_genome[GEN.GROWTH_KG_YR] = 10;    // 
			// new
			_genome[GEN.ANIMAL_ANABOLISM_BIOMASS_CONVERSION] = 1    // 
			_genome[GEN.METABOLIC_RATE] =  0.12;
			_genome[GEN.ALLOCATION_DIGESTIVE] = 0.2;    // 
			_genome[GEN.ALLOCATION_REPRODUCTIVE] = 0.2;    // kg
			break;
			default: 
				assert(false, "dna.get_initial_specie_genome invalid initial specie"+string(_initial_specie));
		}
		return _genome;
	}
	
	
	// === reproduction_get_genome
	// make a copy of genome for child with radiation mutations
	reproduction_get_genome = function(_genome_child, _radiation) {

			// accessor @ is used to use array as passed by reference
			_genome_child[@ GEN.NAME] = genome[GEN.NAME];    
			_genome_child[@ GEN.TROPHIC_LEVEL] = genome[GEN.TROPHIC_LEVEL];
			for (var i=2; i<GEN_NUM;i++) {
				_genome_child[@ i] = genome[i] * (1 + random_range(-_radiation, _radiation));
			}
	}
	
	
	// === format
	// in line genome
	genome_to_string = function()  {
		var _t = genome[0];
		for (var i=0; i<GEN_NUM; i++) {
			_t = _t + + " " + string(genome[i]);
		}
		return _t;
	}
	
	// different lines genome
	genome_to_string_long = function()  {
		var _t = genome[0];
		for (i=1; i<GEN_NUM; i++) {
			_t = _t + "\n" + string(i) + ": " + string(genome[i]);
		}
		return _t;
	}
}