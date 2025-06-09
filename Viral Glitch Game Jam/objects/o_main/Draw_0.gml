if debugging{
	var _centreX = 75;
	var _centreY = 68;
	var _scaler = 2;

	for (var i = 0, n = array_length(terrain); i < n; i++){
		var _platform = terrain[i];
		switch(_platform.shape){
			case TERRAIN_SHAPE.SQUARE:
				draw_rectangle_colour(
					_centreX + _scaler*(_platform.x - _platform.length),
					_centreY + _scaler*(_platform.y - _platform.length),
					_centreX + _scaler*(_platform.x + _platform.length),
					_centreY + _scaler*(_platform.y + _platform.length),
					c_white, c_white, c_white, c_white, false);
				break;
		}
	}
	
	draw_circle_colour(_centreX + player.x, _centreY + player.y, player.radius, c_blue, c_blue, false);
	draw_line_colour(_centreX + player.x, _centreY + player.y, window_mouse_get_x()/4, window_mouse_get_y()/4, c_red, c_red);
}