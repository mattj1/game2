{
	var grid = argument0;
	var _room = argument1;

	var room0X = _room[? "x"];
	var room0Y = _room[? "y"];	
	var room0W = _room[? "w"];
	var room0H = _room[? "h"];
	
	var room0DigDirection = _room[? "digDirection"];
	
	var room1X, room1Y;
	
	while(true) {
		var room1W = irandom_range(5,12);
		var room1H = irandom_range(5,12);
		
		var dir = irandom_range(0, 3);
		switch(dir) {
			case 0:
				if(room0DigDirection == 1) continue;
				
				room1X = room0X + irandom_range(-3, room0W - 3);
				room1Y = room0Y - room1H + 1;
			break;
			case 1:
				if(room0DigDirection == 0) continue;
				room1X = room0X + irandom_range(-3, room0W - 3);
				room1Y = room0Y + room0H - 1;
			break;
			case 2:
				if(room0DigDirection == 3) continue;
				room1X = room0X - room1W + 1;
				room1Y = room0Y + irandom_range(-3, room0H - 3);
			break;
			case 3:
				if(room0DigDirection == 2) continue;
				room1X = room0X + room0W - 1;
				room1Y = room0Y + irandom_range(-3, room0H - 3);
			break;
		}
		
		var _room1 = mgRoom_New(room1X, room1Y, room1W, room1H);
		_room1[? "digDirection"] = dir;
		
		if(mgRoom_CanPlace(grid, _room1)) {
			return _room1;
		}
		
		// Clean up and try again
		ds_map_destroy(_room1);
	}
}
