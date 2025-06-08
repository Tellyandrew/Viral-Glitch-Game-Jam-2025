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