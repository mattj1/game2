{
	var grid = argument0;
	var _room = argument1;
	var _maxAttempts = argument2;

	var room0X = _room[? "x"];
	var room0Y = _room[? "y"];	
	var room0W = _room[? "w"];
	var room0H = _room[? "h"];
	
	var room0DigDirection = _room[? "digDirection"];
	
	var room1X, room1Y, room1W, room1H;
	var attempts = 0;
	
	while(attempts < _maxAttempts) {
		attempts ++;
		
		if(irandom_range(0,4) == 0) {
			// large room
			room1W = irandom_range(13,24);
			room1H = irandom_range(6,12);
		} else {
			room1W = irandom_range(8,12);
			room1H = irandom_range(6,12);
		}
		
		var dir = irandom_range(0, 3);
		
		var e = 0, f = 0;
		
		if(dir < 2) {
			e = room0W;
			f = room1W;
		} else {
			e = room0H;
			f = room1H;
		}
		
		var g = irandom_range( -(f - 5), e - 5);
		
		switch(dir) {
			case 0:
				if(room0DigDirection == 1) continue;
				
				room1X = room0X + g; //irandom_range(-3, room0W - 3);
				room1Y = room0Y - room1H + 1;
			break;
			case 1:
				if(room0DigDirection == 0) continue;
				room1X = room0X + g; //irandom_range(-3, room0W - 3);
				room1Y = room0Y + room0H - 1;
			break;
			case 2:
				if(room0DigDirection == 3) continue;
				room1X = room0X - room1W + 1;
				room1Y = room0Y + g; //irandom_range(-3, room0H - 3);
			break;
			case 3:
				if(room0DigDirection == 2) continue;
				room1X = room0X + room0W - 1;
				room1Y = room0Y + g; //irandom_range(-3, room0H - 3);
			break;
		}
		
		var _room1 = mgRoom_New(room1X, room1Y, room1W, room1H);
		_room1[? "digDirection"] = dir;
		
		_room1[? "previousRoom"] = _room;
		
		_room1[? "previousRoomX"] = room0X;
		_room1[? "previousRoomY"] = room0Y;
		_room1[? "previousRoomW"] = room0W;
		_room1[? "previousRoomH"] = room0H;
		
		if(mgRoom_CanPlace(grid, _room1)) {
			show_debug_message("g");
			show_debug_message(g);
			return _room1;
		}
		
		// Clean up and try again
		ds_map_destroy(_room1);
	}
	
	return pointer_null;
}
