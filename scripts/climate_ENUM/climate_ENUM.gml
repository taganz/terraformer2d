// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function climate_ENUM(){
	enum CLIMATE {
		DEFAULT,     // not a valid climate. need this because tile 0 is not valid
		DRY,
		TROPICAL,
		MEDITERRANEAN,
		CONTINENTAL,
		TUNDRA
	}
#macro CLIMATE_NUM 6
}