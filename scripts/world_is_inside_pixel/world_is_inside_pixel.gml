// is this pixel inside the window?
function world_is_inside_pixel(_x, _y){
	
	with controller.world {
		return _x >= 0 && _y >= 0 && _x < width_px && _y < height_px;
	}
}