function mat2x3(ix, jx, kx, iy, jy, ky){
	gml_pragma("forceinline");
	return {
		ix, jx, kx,
		iy, jy, ky
	};
}

function vec2_display_from_worldspace(_worldspaceVector){
	gml_pragma("forceinline");
	static DISPLAY_MATRIX = mat2x3(
		2, -2, 0,
		1, 1, -2
	);
	return vec2(
		global.displayCentre.x + DISPLAY_MATRIX.ix*_worldspaceVector.x + DISPLAY_MATRIX.jx*_worldspaceVector.y,
		global.displayCentre.y + DISPLAY_MATRIX.iy*_worldspaceVector.x + DISPLAY_MATRIX.jy*_worldspaceVector.y + DISPLAY_MATRIX.ky*_worldspaceVector.z
	);
}

function vec2(_x, _y){
	gml_pragma("forceinline");
	return {x : _x, y : _y};
}

function vec3(_x, _y, _z){
	gml_pragma("forceinline");
	return {x : _x, y : _y, z : _z};
}

function vec2_add(_vectorDestination, _vectorSource){
	gml_pragma("forceinline");
	_vectorDestination.x += _vectorSource.x;
	_vectorDestination.y += _vectorSource.y;
}

function vec2_normalise(_vector, _magnitude = 1){
	gml_pragma("forceinline");
	var _distance = point_distance(0, 0, _vector.x, _vector.y);
	if _distance == 0{
		exit;
	}
	var _inverseMagnitude = _magnitude/_distance;
	_vector.x *= _inverseMagnitude;
	_vector.y *= _inverseMagnitude;
}