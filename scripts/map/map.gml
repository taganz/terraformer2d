// map(value, start1, stop1, start2, stop2)
function map(value, start1, stop1, start2, stop2){
	
	// clamp value inside interval 1
	value = clamp(value, start1, stop1);
	
	return stop2 - (stop2-start2)/(stop1-start1) * (stop1 - value);
	
	

}