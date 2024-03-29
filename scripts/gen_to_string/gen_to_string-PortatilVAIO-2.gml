// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gen_to_string(gen){

var msg = "";
		// immutable gens
		switch(gen) {
			case GEN.TROPHIC_LEVEL:			msg="TROPHIC_LEVEL"; break;
			case GEN.GENUS:		msg="GENUS"; break;
			case GEN.GENUS_NAME:	msg="GENUS_NAME"; break;
			case GEN.SPECIE_CODE:			msg="SPECIE_CODE"; break;
			case GEN.PARENT_SPECIE_CODE:	msg="PARENT_SPECIE_CODE"; break;
			case GEN.SPECIE_HUE:				msg="SPECIE_HUE"; break;
			case GEN.EVOTRANSPIRATION_FACTOR:		msg="EVOTRANSPIRATION_FACTOR"; break;
			case GEN.REPRODUCTION_QUANTITY: msg="REPRODUCTION_QUANTITY"; break;
			case GEN.REPRODUCTION_INTERVAL:		msg="REPRODUCTION_INTERVAL"; break;
			case GEN.REPRODUCTION_DISTANCE:		msg="REPRODUCTION_DISTANCE"; break;
			case GEN.ALLOCATION_DIGESTIVE_ANIMALS:		msg="ALLOCATION_DIGESTIVE_ANIMALS"; break;
			case GEN.ALLOCATION_REPRODUCTIVE:	msg="ALLOCATION_REPRODUCTIVE"; break;
			case GEN.TEMPERATURE_OPTIMAL:		msg="TEMPERATURE_OPTIMAL"; break;
			case GEN.TEMPERATURE_RANGE:			msg="TEMPERATURE_RANGE"; break;
			case GEN.ANABOLISM_BIOMASS_PER_WATER_L: msg="ANABOLISM_BIOMASS_PER_WATER_L"; break;
			case GEN.ALLOCATION_RESERVE:			 msg="ALLOCATION_RESERVE"; break;
			case GEN.KC_METABOLIC_RATE:			msg="KC_METABOLIC_RATE"; break;
			case GEN.PLANT_BODY_DENSITY:		msg="PLANT_BODY_DENSITY"; break;
			case GEN.PLANT_BODY_FORM_FACTOR:	msg="PLANT_BODY_FORM_FACTOR"; break;
			case GEN.PLANT_HEAD_DENSITY:		msg="PLANT_HEAD_DENSITY"; break;
			case GEN.PLANT_HEAD_FORM_FACTOR:	msg="PLANT_HEAD_FORM_FACTOR"; break;
			case GEN.ANIMAL_ANABOLISM_BIOMASS_CONVERSION: msg="ANIMAL_ANABOLISM_BIOMASS_CONVERSION"; break;
			case GEN.BIOMASS_BIRTH:				msg="BIOMASS_BIRTH"; break;
			case GEN.BIOMASS_ADULT:				msg="BIOMASS_ADULT"; break;
			case GEN.AGE_DEAD:					msg="AGE_DEAD"; break;
			case GEN.DORMANCY_TEMPERATURE_TRIGGER:		msg="DORMANCY_TEMPERATURE_TRIGGER"; break;
			case GEN.DORMANCY_CATABOLISM_REDUCTION:		msg="DORMANCY_CATABOLISM_REDUCTION"; break;
			case GEN.DORMANCY_MONTHS:					msg="DORMANCY_MONTHS"; break;
			
		}
		
		return msg;

}