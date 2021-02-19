// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information




function DNA(_initial_specie) constructor {
	
	// === initialize creature genome with selected initial specie	
	genome = array_create(GEN_NUM, 0);

	
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