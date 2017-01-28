{
	var _room = argument0;
	var _obj = argument1;
	
	var roomX = _room[? "x"] * 8;
	var roomY = _room[? "y"] * 8;
	var roomW = _room[? "w"] * 8;
	var roomH = _room[? "h"] * 8;
	
	if(_obj.x < roomX) return false;
	if(_obj.x > roomX + roomW) return false;
	if(_obj.y < roomY) return false;
	if(_obj.y > roomY + roomH) return false;
	
	return true;
}
