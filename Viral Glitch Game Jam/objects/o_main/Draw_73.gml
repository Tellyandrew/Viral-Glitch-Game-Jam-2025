//@TODO: This is fine for now, but we should think about pre-processing this/drawing to a surface

var COLOURS = [c_yellow, c_aqua, c_lime, c_red]

for (var j = 0; j < nodeColumns; j++){
	if not surface_exists(wireSurface[j]){
		wireSurface[j] = surface_create(room_width, room_height);
		surface_set_target(wireSurface[j]);
		draw_clear_alpha(c_black, 0);
		for (var i = 0; i < nodeRows - 1; i++){
			var _socket = nodeSockets[i][j];
			var _xPos = _socket.displayX + j - 2;
		
			draw_sprite_ext(s_socketConnector, 0, _xPos, _socket.displayY, 1, 8 + j*2, 0, COLOURS[j], 1);
		
			var _spanLower = array_reduce(_socket.ports, function(_previous, _current){
				return min(_previous, _current);
			}, j) - j;
			var _span = array_reduce(_socket.ports, function(_previous, _current){
				return max(_previous, _current);
			}, j) - j - _spanLower;
			draw_sprite_ext(s_socketConnector, 0, _xPos + _spanLower*17, _socket.displayY + 8 + j*2, 1 + 17*_span, 1, 0, COLOURS[j], 1);
		
			for (var k = 0, l = array_length(_socket.ports); k < l; k++){
				var _socketChild = nodeSockets[i + 1][_socket.ports[k]];
				draw_sprite_ext(s_socketConnector, 0, _socketChild.displayX + j - 2, _socketChild.displayY - 14 + j*2, 1, 8 + (3 - j)*2, 0, COLOURS[j], 1);
			}
		}
		surface_reset_target();
	}
}

shader_set(a_marchingAnts);
shader_set_uniform_f(shader_get_uniform(a_marchingAnts, "dimensions"), room_width, room_height);
for (var j = 0; j < nodeColumns; j++){
	shader_set_uniform_f(shader_get_uniform(a_marchingAnts, "time"), floor(global.currentFrame * 0.15) + 2*j);
	shader_set_uniform_f(shader_get_uniform(a_marchingAnts, "anchor"), nodeSockets[0][j].displayX + j - 2, nodeSockets[0][j].displayY);
	draw_surface(wireSurface[j], 0, 0);
}
shader_reset();

for (var i = 0; i < nodeRows; i++){
	for (var j = nodeColumns - 1; j >= 0; j--){
		var _socket = nodeSockets[i][j];
		draw_sprite(s_selectionParticleOuter, 0, _socket.displayX, _socket.displayY);
		draw_sprite(s_selectionParticleInner, 0, _socket.displayX, _socket.displayY);
	}
}

if not is_undefined(crawl){
	for (var i = 0; i < nodeRows; i++){
		var _socket = nodeSockets[i][crawl[i]];
		draw_sprite(s_selectionParticleOuter, 4, _socket.displayX, _socket.displayY);
	}
}