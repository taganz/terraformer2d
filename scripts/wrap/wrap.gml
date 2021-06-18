
// wraps _x if it is not inside interval [0, _limit)

function wrap(_x, _limit){
	
	if _x >= 0 and _x < _limit
		return _x;
	else if _x < 0 
		return _limit + _x;
	else 
		return _x - _limit;

}