{
	var grid = argument0;
	var _room = argument1;
	
	var roomX = _room[? "x"];
	var roomY = _room[? "y"];
	var roomW = _room[? "w"];
	var roomH = _room[? "h"];
	
	var w = ds_grid_width(grid);
	var h = ds_grid_height(grid);
	
	if(roomX < 0 || roomX + roomW >= w)
		return false;
	
	if(roomY < 0 || roomY + roomH >= h)
		return false;
	
	for(var j = roomY; j < roomY + roomH; j++) {
		for(var i = roomX; i < roomX + roomW; i++ ) {
			var o = ds_grid_get(grid, i, j);
			if(o == 0) return false;
		}
	}
	
	return true;
}
