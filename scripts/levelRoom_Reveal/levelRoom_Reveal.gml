{
	var _room = argument0;
	
	var roomX = _room[? "x"];
	var roomY = _room[? "y"];
	var roomW = _room[? "w"];
	var roomH = _room[? "h"];
	
	var roomObjects = _room[? "objects"];
	
	var digDirection = _room[? "digDirection"];
	
	for(var j = roomY; j < roomY + roomH; j++) {
		for(var i = roomX; i < roomX + roomW; i++ ) {
		
			var o = ds_grid_get(global.level, i, j);
			if(!is_undefined(o)) {
				var ob2 = 0;
				//var _solid = 0;
				if(o == 0) {
					// Empty space
					//_solid = 0;
				}
				
				if(o == 1) {
					// Cave stuff
					ob2 = 2;
				}
				
				if(o == 2) {
					// Wall edge
					//_solid = 1;
					ob2 = 1;
				}
				
				if(o == 3) {
					// room door/edge
					//_solid = 2;
				}
				
				tilemap_set(global.TileMap, ob2, i, j);
			}
		}
	}
	
	var numObjects = ds_list_size(roomObjects);
	for(var i = 0; i < numObjects; i++) {
		var _obj = roomObjects[| i];
		_obj.visible = true;
	}
}
