// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function genome_to_string_lines(){

	var _t = genome[0];
	for (i=1; i<GEN_NUM; i++) {
		_t = _t + "\n" + string(i) + ": " + string(genome[i]);
	}
	return _t;
}
