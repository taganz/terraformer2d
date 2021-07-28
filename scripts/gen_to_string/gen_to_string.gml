// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gen_to_string(gen){

var msg = "";
		// immutable gens
		switch(gen) {
			case GEN.TROPHIC_LEVEL:			msg="TROPHIC_LEVEL"; break;
			//case GEN.GENUS:					msg="GENUS"; break;
			case GEN.GENUS_ID:					msg="GENUS_ID"; break;
			case GEN.FAMILY:				msg="FAMILY"; break;
			case GEN.GENUS_NAME:			msg="GENUS_NAME"; break;
			case GEN.SPECIE_CODE:			msg="SPECIE_CODE"; break;
			case GEN.SPRITE_HEAD:			msg="SPRITE_HEAD"; break;
			case GEN.PARENT_SPECIE_CODE:	msg="PARENT_SPECIE_CODE"; break;
			case GEN.SPECIE_HUE:				msg="SPECIE_HUE"; break;
			case GEN.EVOTRANSPIRATION_FACTOR:		msg="EVOTRANSPIRATION_FACTOR"; break;
			case GEN.REPRODUCTION_QUANTITY: msg="REPRODUCTION_QUANTITY"; break;
			case GEN.REPRODUCTION_INTERVAL:		msg="REPRODUCTION_INTERVAL"; break;
			case GEN.REPRODUCTION_DISTANCE_M:		msg="REPRODUCTION_DISTANCE_M"; break;
			case GEN.ALLOCATION_DIGESTIVE_ANIMALS:		msg="ALLOCATION_DIGESTIVE_ANIMALS"; break;
			case GEN.ALLOCATION_REPRODUCTIVE:	msg="ALLOCATION_REPRODUCTIVE"; break;
			case GEN.TEMPERATURE_OPTIMAL:		msg="TEMPERATURE_OPTIMAL"; break;
			case GEN.TEMPERATURE_RANGE:			msg="TEMPERATURE_RANGE"; break;
			case GEN.HEIGHT_ADULT:					 msg="HEIGHT_ADULT"; break;
			case GEN.BIOMASS_LIFE_FACTOR:			 msg="BIOMASS_LIFE_FACTOR"; break;
			case GEN.KC_METABOLIC_RATE:			msg="KC_METABOLIC_RATE"; break;
			//case GEN.DEPRECATED_PLANT_BODY_DENSITY:		msg="DEPRECATED_PLANT_BODY_DENSITY"; break;
			//case GEN.DEPRECATED_PLANT_BODY_FORM_FACTOR:	msg="DEPRECATED_PLANT_BODY_FORM_FACTOR"; break;
			case GEN.SPRITE_SCALE_H:		msg="SPRITE_SCALE_H"; break;
			case GEN.SPRITE_SCALE_W:		msg="SPRITE_SCALE_W"; break;
			case GEN.KA_ANABOLISM_FACTOR:		msg="KA_ANABOLISM_FACTOR"; break;
			//case GEN.EMPTY15:					msg="EMPTY15"; break;
			case GEN.BIOMASS_ADULT:				msg="BIOMASS_ADULT"; break;
			case GEN.AGE_DEAD:					msg="AGE_DEAD"; break;
			//case GEN.DORMANCY_TEMPERATURE_TRIGGER:		msg="DORMANCY_TEMPERATURE_TRIGGER"; break;
			case GEN.DORMANCY_CATABOLISM_REDUCTION:		msg="DORMANCY_CATABOLISM_REDUCTION"; break;
			//case GEN.DORMANCY_MONTHS:					msg="DORMANCY_MONTHS"; break;
			case GEN.COMBAT_ATTACK_POINTS:		msg="COMBAT_ATTACK_POINTS"; break;
			case GEN.COMBAT_DEFENSE_POINTS:		msg="COMBAT_DEFENSE_POINTS"; break;
			case GEN.ROOT_HEIGHT_RATIO:		msg="ROOT_HEIGHT_RATIO"; break;
			case GEN.VIEW_RANGE:				msg="VIEW_RANGE"; break;
			case GEN.SPEED_SLOW:					msg="SPEED_SLOW"; break;
			case GEN.SPEED_FAST:				msg="SPEED_FAST"; break;
			
		}
		
		return msg;

}