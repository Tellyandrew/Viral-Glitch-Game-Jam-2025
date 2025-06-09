if debugging{
	draw_circle_colour(global.displayCentre.x, global.displayCentre.y, 1, c_lime, c_lime, false);
	for (var i = 0, n = array_length(terrain); i < n; i++){
		var _platform = terrain[i];
		switch(_platform.shape){
			case TERRAIN_SHAPE.SQUARE:
				var i1 = (_platform.x - _platform.length);
				var j1 = (_platform.y - _platform.length);
				var i2 = (_platform.x + _platform.length);
				var j2 = (_platform.y + _platform.length);
				var _corner1 = vec3(i1, j1, _platform.z);
				var _corner2 = vec3(i1, j2, _platform.z);
				var _corner3 = vec3(i2, j1, _platform.z);
				var _corner4 = vec3(i2, j2, _platform.z);
				
				var _pos1 = vec2_display_from_worldspace(_corner1);
				var _pos2 = vec2_display_from_worldspace(_corner2);
				var _pos3 = vec2_display_from_worldspace(_corner3);
				var _pos4 = vec2_display_from_worldspace(_corner4);
				
				draw_circle_colour(_pos1.x, _pos1.y, 1, c_white, c_white, false);
				draw_circle_colour(_pos2.x, _pos2.y, 1, c_white, c_white, false);
				draw_circle_colour(_pos3.x, _pos3.y, 1, c_white, c_white, false);
				draw_circle_colour(_pos4.x, _pos4.y, 1, c_white, c_white, false);
				draw_line_width_colour(_pos1.x, _pos1.y, _pos2.x, _pos2.y, 2, c_white, c_white);
				draw_line_width_colour(_pos4.x, _pos4.y, _pos2.x, _pos2.y, 2, c_white, c_white);
				draw_line_width_colour(_pos4.x, _pos4.y, _pos3.x, _pos3.y, 2, c_white, c_white);
				draw_line_width_colour(_pos1.x, _pos1.y, _pos3.x, _pos3.y, 2, c_white, c_white);
				break;
		}
	}
	var _playerFootDisplay = vec2_display_from_worldspace(vec3(player.x, player.y, player.z - 2));
	var _playerDisplay = vec2_display_from_worldspace(player);
	draw_circle_colour(_playerDisplay.x, _playerDisplay.y, 2, c_teal, c_teal, false);
	draw_circle_colour(_playerFootDisplay.x, _playerFootDisplay.y, 2, c_teal, c_teal, false);
}else{
	
}