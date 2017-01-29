{
	var _room = argument0;
	var _obj = argument1;
	
	var roomX = _room[? "x"];
	var roomY = _room[? "y"];
	var roomW = _room[? "w"];
	var roomH = _room[? "h"];

	var roomObjects = _room[? "objects"];
	
	var tx = irandom_range(2, roomW - 2);
	var ty = irandom_range(2, roomH - 2);
	
	_obj.x = roomX * 8 + tx * 8;
	_obj.y = roomY * 8 + ty * 8;
	
	_obj.currentRoom = _room;
	
	ds_list_add(roomObjects, _obj);
}
