{
	var grid = argument0;
	var _room = argument1;
	
	var roomX = _room[? "x"];
	var roomY = _room[? "y"];
	var roomW = _room[? "w"];
	var roomH = _room[? "h"];
	
	// 01234567.  w = 8
	
	
	for(var j = roomY; j < roomY + roomH; j++) {
		for(var i = roomX; i < roomX + roomW; i++ ) {
		
			var o = ds_grid_get(grid, i, j);
			var o2 = 2;
			
			if(j == roomY || j == roomY + roomH - 1) {
				if(i > roomX && i < roomX + roomW - 1) {
					if(o == 2) {
						o2 = 0;
					}
				}
			}
			
			if(i == roomX || i == roomX + roomW - 1) {
				if(j > roomY && j < roomY + roomH - 1) {
					if(o == 2) {
						o2 = 0;
					}
				}
			}
			
			// Regular room bounds
			if(j > roomY && j < roomY + roomH - 1 && i > roomX && i < roomX + roomW - 1) {
				o2 = 0;
			}
			
			ds_grid_set(grid, i, j, o2);
		}
	}
	
//	ds_grid_set_region(grid, roomX, roomY, roomX + roomW, roomY + roomH, 2);
//	ds_grid_set_region(grid, roomX + 1, roomY + 1, roomX + roomW - 1, roomY + roomH - 1, 0);
}
