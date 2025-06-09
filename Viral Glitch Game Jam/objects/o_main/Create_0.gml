global.currentFrame = 0;

crawl = undefined;
wireSurface = [-1, -1, -1, -1];
debugging = true;

nodeRows = 6;
nodeColumns = 4;
nodeSockets = array_create(nodeRows);
for (var i = 0; i < nodeRows; i++){
	nodeSockets[i] = array_create(nodeColumns);
	for (var j = 0; j < nodeColumns; j++){
		nodeSockets[i][j] = {
			displayX : undefined,
			displayY : undefined,
			nodePointer : undefined,
			ports : undefined,
		};
	}
}

for (var i = 0; i < nodeRows - 1; i++){
	for (var j = 0; j < nodeColumns; j++){
		do{
			var _nodeIsConnected = [false, false, false, false];
			for (var j = 0; j < nodeColumns; j++){
				nodeSockets[i][j].ports = array_choose(global.POSSIBLE_PORTS);
				for (var k = 0, l = array_length(nodeSockets[i][j].ports); k < l; k++){
					_nodeIsConnected[nodeSockets[i][j].ports[k]] = true;
				}
			}
		}until _nodeIsConnected[0] and _nodeIsConnected[1] and _nodeIsConnected[2] and _nodeIsConnected[3];
	}
}

array_sort(nodeSockets[0], function(_lhs, _rhs){
	var _leftValue;
	var _rightValue;
	for (var i = 0, n = array_length(global.POSSIBLE_PORTS); i < n; i++){
		if _lhs.ports == global.POSSIBLE_PORTS[i]{
			_leftValue = i;
		}
		if _rhs.ports == global.POSSIBLE_PORTS[i]{
			_rightValue = i;
		}
	}
	return _leftValue - _rightValue;
});

for (var i = 0; i < nodeRows; i++){
	for (var j = 0; j < nodeColumns; j++){
		with nodeSockets[i][j]{
			displayX = 179 + j*17;
			displayY = 10 + i*23;
		}
	}
}

enum TERRAIN_SHAPE{
	SQUARE,
}

terrain = [{
	shape : TERRAIN_SHAPE.SQUARE,
	x : 0,
	y : 0,
	length : 18,
}];

//@TODO: Probably should make this and enemies into objects/instances instead of buried in o_main
player = {
	x : 0,
	y : 0,
	radius : 3,
	velocity : 0.5,
};