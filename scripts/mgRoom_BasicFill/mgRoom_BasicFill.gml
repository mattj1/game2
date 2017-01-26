{
	var grid = argument0;
	var _room = argument1;
	
	var roomX = _room[? "x"];
	var roomY = _room[? "y"];
	var roomW = _room[? "w"];
	var roomH = _room[? "h"];
	
	var digDirection = _room[? "digDirection"];
	
	for(var j = roomY; j < roomY + roomH; j++) {
		for(var i = roomX; i < roomX + roomW; i++ ) {
		
			var o = ds_grid_get(grid, i, j);
			var o2 = 2;
			
			// Regular room bounds
			if(j > roomY && j < roomY + roomH - 1 && i > roomX && i < roomX + roomW - 1) {
				o2 = 0;
			}
			
			ds_grid_set(grid, i, j, o2);
		}
	}
	
}
