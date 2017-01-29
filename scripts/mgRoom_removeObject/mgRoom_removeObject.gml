{
	var _room = argument0;
	var _obj = argument1;
	
	_obj.currentRoom = pointer_null;
	
	var roomObjects = _room[? "objects"];
	ds_list_delete(roomObjects, ds_list_find_index(roomObjects, _obj));
}
