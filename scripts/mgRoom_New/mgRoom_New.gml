{
	var _x = argument0;
	var _y = argument1;
	var _w = argument2;
	var _h = argument3;
	
	var _obj = ds_map_create();
	ds_map_add(_obj, "x", _x);
	ds_map_add(_obj, "y", _y);
	ds_map_add(_obj, "w", _w);
	ds_map_add(_obj, "h", _h);
	
	ds_map_add(_obj, "adjacentRooms", ds_list_create());
	ds_map_add(_obj, "objects", ds_list_create());
	
	_obj[? "digDirection"] = -1;
	
	return _obj;
}
