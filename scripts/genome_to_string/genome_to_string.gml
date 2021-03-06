// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function genome_to_string(){
	var _t = genome[0];
	for (var i=0; i<GEN_NUM; i++) {
		_t = _t + + " " + string(genome[i]);
	}
	return _t;
}
