function gui_draw_grid(){
		
		for (var i=0; i< controller.world.world_w; i++) {
			for (var j=0; j< controller.world.world_h; j++) {
			
				var _x0 = grid_pixel_x_from_cell_x(i);
				var _y0 = grid_pixel_y_from_cell_y(j);
				draw_rectangle(_x0, _y0, _x0 + controller.world.cell_size_px, _y0 + controller.world.cell_size_px, true );
			}
		}
					
}