{
	var grid = argument0;
	var _room = argument1;
	
	var roomX = _room[? "x"];
	var roomY = _room[? "y"];
	var roomW = _room[? "w"];
	var roomH = _room[? "h"];
	
	var roomLeft = roomX;
	var roomRight = roomX + roomW - 1;
	var roomTop = roomY;
	var roomBottom = roomY + roomH - 1;
	
	var digDirection = _room[? "digDirection"];
	
	var previousRoom = _room[? "previousRoom"];
	
	var prevRoomX = previousRoom[? "x"];
	var prevRoomY = previousRoom[? "y"];
	var prevRoomW = _room[? "previousRoomW"];
	var prevRoomH = _room[? "previousRoomH"];
		
	var prevRoomLeft = prevRoomX;
	var prevRoomRight = prevRoomX + prevRoomW - 1;
	var prevRoomTop = prevRoomY;
	var prevRoomBottom = prevRoomY + prevRoomH - 1;
		
	for(var j = roomY; j < roomY + roomH; j++) {
		for(var i = roomX; i < roomX + roomW; i++ ) {
		
			var o = ds_grid_get(grid, i, j);
			var o2 = 2;
			
			if( (j == prevRoomTop || j == prevRoomBottom) 
				&& (i > prevRoomLeft && i < prevRoomRight)
				&& (i > roomLeft && i < roomRight)) {
					o2 = 3;
				}
				
			if( (i == prevRoomLeft || i == prevRoomRight)
				&& (j > prevRoomTop && j < prevRoomBottom) 
				&& (j > roomTop && j < roomBottom) ) {
				
				o2 = 3;
			}
			
			// Regular room bounds
			if(j > roomY && j < roomY + roomH - 1 && i > roomX && i < roomX + roomW - 1) {
				o2 = 0;
			}
			
			ds_grid_set(grid, i, j, o2);
		}
	}
}
