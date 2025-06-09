if keyboard_check_pressed(vk_space){
	crawl = array_create(nodeRows);
	var _path = irandom(nodeColumns - 1);
	for (var i = 0;; i++){
		crawl[i] = _path;
		
		if i == nodeRows - 1{
			break;
		}
		
		_path = array_choose(nodeSockets[i][_path].ports);
	}
}

if keyboard_check_pressed(vk_f5){
	debugging = not debugging;
}

var _upHeld = keyboard_check(ord("W")) or keyboard_check(vk_up);
var _downHeld = keyboard_check(ord("S")) or keyboard_check(vk_down);
var _leftHeld = keyboard_check(ord("A")) or keyboard_check(vk_left);
var _rightHeld = keyboard_check(ord("D")) or keyboard_check(vk_right);

var _directionVector = vec2(
	_rightHeld - _leftHeld + _downHeld - _upHeld,
	_leftHeld - _rightHeld + _downHeld - _upHeld
);
vec2_normalise(_directionVector, 0.5);
vec2_add(player, _directionVector);