function genome_create(_initial_specie){

	var _genome = array_create (GEN_NUM, 0);
	var ww = ds_grid_width(controller.species._initial_species_grid);
	var hh = ds_grid_height(controller.species._initial_species_grid);
	
	// get column for specie
	ASSERT(ds_grid_value_exists(controller.species._initial_species_grid, 0, 0, 0, hh, "INITIAL_SPECIE"), 0, "INITIAL SPECIES ROW NOT FOUND");
	var y_initial_specie = ds_grid_value_y(controller.species._initial_species_grid, 0, 0, 0, hh, "INITIAL_SPECIE");
	ASSERT(ds_grid_value_exists(controller.species._initial_species_grid, 1, y_initial_specie, ww, y_initial_specie, _initial_specie), 0, "INITIAL SPECIES COLUMN NOT FOUND "+string(_initial_specie));
	var x_initial_specie = ds_grid_value_x(controller.species._initial_species_grid, 1, y_initial_specie, ww, y_initial_specie, _initial_specie);

	for (var i=0; i<GEN_NUM;i++) {
	
		// get row for this gen
		var yy = ds_grid_value_y(controller.species._initial_species_grid, 0, 0, 1, hh, gen_to_string(i));
		if (yy>0) {
				var _cell =  controller.species._initial_species_grid[# x_initial_specie, yy];
				if _cell != "" or i < GEN_FIRST_MUTABLE
					_genome[i] = _cell;
				else
					_genome[i] = 0;
		}
		else {
			_genome[i] = 0;
			log_error("*** ERROR *** gen not found in inital_species_grid "+gen_to_string(i))
		}
	
	}
	
	
	//_genome[GEN.INITIAL_SPECIE] = _initial_specie;    
	_genome[GEN.PARENT_SPECIE_CODE] = "NOPARENT";
	_genome[GEN.SPECIE_CODE] = specie_code_initial(_genome[GEN.TROPHIC_LEVEL], _initial_specie);    
		

	return _genome;
	
}






/*
	var _genome =  array_create(GEN_NUM, 0);
	switch(_initial_specie) {
		case SPECIE.PLANT_TREE: {
		_genome[GEN.INITIAL_SPECIE_NAME] = "Tree";    // es un tree!
		_genome[GEN.TROPHIC_LEVEL] = TROPHIC_LEVEL.PRODUCER;    // 
		_genome[GEN.AGE_DEAD] = 12;    // 
		_genome[GEN.REPRODUCTION_INTERVAL] = 0.8;    // 
		_genome[GEN.REPRODUCTION_DISTANCE] = 64;    // 
		_genome[GEN.BIOMASS_BIRTH] = 3;    // 
		_genome[GEN.DEPRECATED_BIOMASS_REPRODUCTION] = 400;    // 
		_genome[GEN.BIOMASS_ADULT] = 800;    // 
		_genome[GEN.METABOLIC_RATE] = 0.2;    // 
		_genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L] = 0.4;			
		_genome[GEN.TEMPERATURE_OPTIMAL] = 30;			
		_genome[GEN.TEMPERATURE_RANGE] = -15;			
		_genome[GEN.PLANT_BODY_DENSITY] =  400;			
		_genome[GEN.PLANT_BODY_FORM_FACTOR] =  1.2;		
		_genome[GEN.PLANT_HEAD_DENSITY] =  50;
		_genome[GEN.PLANT_HEAD_FORM_FACTOR] =  1;		
		break;
		}	
		case SPECIE.PLANT_TREE_3: {
		_genome[GEN.INITIAL_SPECIE_NAME] = "Tree 3";    // es un tree!
		_genome[GEN.TROPHIC_LEVEL] = TROPHIC_LEVEL.PRODUCER;    // 
		_genome[GEN.AGE_DEAD] = 6;    // 
		_genome[GEN.REPRODUCTION_INTERVAL] = 1.3;    // 
		_genome[GEN.REPRODUCTION_DISTANCE] = 64;    // 
		_genome[GEN.BIOMASS_BIRTH] = 5;    // 
		_genome[GEN.DEPRECATED_BIOMASS_REPRODUCTION] = 100;    // 
		_genome[GEN.BIOMASS_ADULT] = 250;    // 
		_genome[GEN.METABOLIC_RATE] = 0.2;    // 
		_genome[GEN.TEMPERATURE_OPTIMAL] = 30;			
		_genome[GEN.TEMPERATURE_RANGE] = -15;			
		_genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L] = 0.4;			
		_genome[GEN.PLANT_BODY_DENSITY] =  200;			
		_genome[GEN.PLANT_BODY_FORM_FACTOR] =  1.5;		
		_genome[GEN.PLANT_HEAD_DENSITY] =  50;
		_genome[GEN.PLANT_HEAD_FORM_FACTOR] =  0.7;		
		break;
		}	
		case SPECIE.PLANT_TREE_4: {
		_genome[GEN.INITIAL_SPECIE_NAME] = "Tree 4 mountain";    // es un tree!
		_genome[GEN.TROPHIC_LEVEL] = TROPHIC_LEVEL.PRODUCER;    // 
		_genome[GEN.AGE_DEAD] = 6;    // 
		_genome[GEN.REPRODUCTION_INTERVAL] = 1.3;    // 
		_genome[GEN.REPRODUCTION_DISTANCE] = 64;    // 
		_genome[GEN.BIOMASS_BIRTH] = 5;    // 
		_genome[GEN.DEPRECATED_BIOMASS_REPRODUCTION] = 90;    // 
		_genome[GEN.BIOMASS_ADULT] = 200;    //					// less biomass?
		_genome[GEN.METABOLIC_RATE] = 0.3;    // 
		_genome[GEN.TEMPERATURE_OPTIMAL] = 20;			
		_genome[GEN.TEMPERATURE_RANGE] = -45;			// cold temperatures
		_genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L] = 0.3;		// needs more water?
		_genome[GEN.PLANT_BODY_DENSITY] =  400;			
		_genome[GEN.PLANT_BODY_FORM_FACTOR] =  1.3;		
		_genome[GEN.PLANT_HEAD_DENSITY] =  50;
		_genome[GEN.PLANT_HEAD_FORM_FACTOR] =  1.3;		
		break;
		}			
		case SPECIE.PLANT_BUSH: {
		_genome[GEN.INITIAL_SPECIE_NAME] = "Plant bush";    
		_genome[GEN.TROPHIC_LEVEL] = TROPHIC_LEVEL.PRODUCER;    // 
		_genome[GEN.AGE_DEAD] = 3;    // 
		_genome[GEN.REPRODUCTION_INTERVAL] = 0.8;    // 
		_genome[GEN.REPRODUCTION_DISTANCE] = 64;    // 
		_genome[GEN.BIOMASS_BIRTH] = 2;    // 
		_genome[GEN.DEPRECATED_BIOMASS_REPRODUCTION] = 5;    // 
		_genome[GEN.BIOMASS_ADULT] = 10;    // 
		_genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L] =  0.4;			
		_genome[GEN.METABOLIC_RATE] =  0.20;
		_genome[GEN.TEMPERATURE_OPTIMAL] = 25;			
		_genome[GEN.TEMPERATURE_RANGE] = -10;			
		_genome[GEN.PLANT_BODY_DENSITY] =  0;			// small body
		_genome[GEN.PLANT_BODY_FORM_FACTOR] =  0;		
		_genome[GEN.PLANT_HEAD_DENSITY] =  20;
		_genome[GEN.PLANT_HEAD_FORM_FACTOR] =  1;			
		break;
		}
		case SPECIE.PLANT_BUSH_2: {
		_genome[GEN.INITIAL_SPECIE_NAME] = "Plant bush 2";    
		_genome[GEN.TROPHIC_LEVEL] = TROPHIC_LEVEL.PRODUCER;    // 
		_genome[GEN.AGE_DEAD] = 3;    // 
		_genome[GEN.REPRODUCTION_INTERVAL] = 0.8;    // 
		_genome[GEN.REPRODUCTION_DISTANCE] = 64;    // 
		_genome[GEN.BIOMASS_BIRTH] = 4;    // 
		_genome[GEN.DEPRECATED_BIOMASS_REPRODUCTION] = 10;    // 
		_genome[GEN.BIOMASS_ADULT] = 20;    // 
		_genome[GEN.ANABOLISM_BIOMASS_PER_WATER_L] =  0.6;			
		_genome[GEN.METABOLIC_RATE] =  0.4;
		_genome[GEN.TEMPERATURE_OPTIMAL] = 30;			
		_genome[GEN.TEMPERATURE_RANGE] = -10;			
		_genome[GEN.PLANT_BODY_DENSITY] =  0;			// small body
		_genome[GEN.PLANT_BODY_FORM_FACTOR] =  0;		
		_genome[GEN.PLANT_HEAD_DENSITY] =  20;
		_genome[GEN.PLANT_HEAD_FORM_FACTOR] =  1;			
		break;		
		}
			
		case SPECIE.PRIMARY_SMALL: 
		_genome[GEN.INITIAL_SPECIE_NAME] = "Primary small";    
		_genome[GEN.TROPHIC_LEVEL] = TROPHIC_LEVEL.PRIMARY;    // 
		_genome[GEN.AGE_DEAD] = 4;    // 
		_genome[GEN.REPRODUCTION_INTERVAL] = 0.05;    // 
		_genome[GEN.REPRODUCTION_DISTANCE] = 128;    // 
		_genome[GEN.DEPRECATED_GROWTH_KG_YR] = 50;     
		_genome[GEN.DEPRECATED_AGE_ADULT] = 1;         
		_genome[GEN.ANIMAL_ANABOLISM_BIOMASS_CONVERSION] = 0.5 // 
		_genome[GEN.METABOLIC_RATE] =  0.12;
		_genome[GEN.ALLOCATION_DIGESTIVE] = 0.2;    // kg
		_genome[GEN.ALLOCATION_REPRODUCTIVE] = 0.1;    // kg
		break;
			
		case SPECIE.PRIMARY_TINY: 
		_genome[GEN.INITIAL_SPECIE_NAME] = "Primary tiny";    
		_genome[GEN.TROPHIC_LEVEL] = TROPHIC_LEVEL.PRIMARY;    // 
		_genome[GEN.AGE_DEAD] = 4;    // 
		_genome[GEN.REPRODUCTION_INTERVAL] = 0.05;    // 
		_genome[GEN.REPRODUCTION_DISTANCE] = 128;    // 
		_genome[GEN.DEPRECATED_GROWTH_KG_YR] = 5;     
		_genome[GEN.DEPRECATED_AGE_ADULT] = 1;         
		_genome[GEN.ANIMAL_ANABOLISM_BIOMASS_CONVERSION] = 0.5 // 
		_genome[GEN.METABOLIC_RATE] =  0.12;
		_genome[GEN.ALLOCATION_DIGESTIVE] = 0.4;    // kg
		_genome[GEN.ALLOCATION_REPRODUCTIVE] = 0.1;    // kg
		break;
			
		case SPECIE.SECONDARY_SMALL: 
		_genome[GEN.INITIAL_SPECIE_NAME] = "Secondary small";    
		_genome[GEN.TROPHIC_LEVEL] = TROPHIC_LEVEL.SECONDARY;    // 
		_genome[GEN.DEPRECATED_AGE_ADULT] = 2;    // 
		_genome[GEN.AGE_DEAD] = 7;    // 
		_genome[GEN.REPRODUCTION_INTERVAL] = 1;    // 
		_genome[GEN.REPRODUCTION_DISTANCE] = 128;    // 
		_genome[GEN.DEPRECATED_GROWTH_KG_YR] = 10;    // 
		// new
		_genome[GEN.ANIMAL_ANABOLISM_BIOMASS_CONVERSION] = 1    // 
		_genome[GEN.METABOLIC_RATE] =  0.12;
		_genome[GEN.ALLOCATION_DIGESTIVE] = 0.2;    // 
		_genome[GEN.ALLOCATION_REPRODUCTIVE] = 0.2;    // kg
		break;
		default: 
			ASSERT(false, 0, "initial_specie_genome invalid initial specie"+string(_initial_specie));
	}
		
	_genome[GEN.INITIAL_SPECIE] = _initial_specie;    
	_genome[GEN.PARENT_SPECIE_CODE] = "NOPARENT";
	_genome[GEN.SPECIE_CODE] = specie_code_initial(_genome[GEN.TROPHIC_LEVEL], _initial_specie);    
		

	
	return _genome;
}
*/