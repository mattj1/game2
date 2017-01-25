{
	TileMap = layer_tilemap_get_id("Tiles_1");
	
	WallMap = layer_tilemap_get_id("CollisionLayer");
	layer_set_visible("CollisionLayer",true);		// just in case I've left them on!
	global.WallMap = WallMap;
	#macro DIR_STOP		0
	#macro DIR_UP		1
	#macro DIR_DOWN		2
	#macro DIR_LEFT		4
	#macro DIR_RIGHT	8
	#macro DIR_DEAD		16
	
	var w = tilemap_get_width(TileMap);
	var h = tilemap_get_height(TileMap);
	
	// Set a tile value at 0,0
	// tilemap_set(WallMap, 1, 0, 0);
	
	var grid = ds_grid_create(w, h);
	ds_grid_clear(grid, 1);
	
	var lastRoom = mgRoom_New(10, 10, 10, 10);
	mgRoom_BasicFill(grid, lastRoom);
	
	randomize();
	
	for(var i = 0; i < 5; i++) {
		var newRoom = mgRoom_GenerateAdjacent(grid, lastRoom);
		mgRoom_BasicFill(grid, newRoom);
		
		ds_map_destroy(lastRoom);
		lastRoom = newRoom;
	}
	
	ds_map_destroy(lastRoom);
	
	/*
	for(var i = 0; i < 3; i++) {
		var roomX = irandom_range(0, w - 12 - 1);
		var roomY = irandom_range(0, h - 12 - 1);
		
		var roomW = irandom_range(8, 12);
		var roomH = irandom_range(8, 12);
		
		ds_grid_set_region(grid, roomX, roomY, roomX + roomW, roomY + roomH, 2);
		ds_grid_set_region(grid, roomX + 1, roomY + 1, roomX + roomW - 1, roomY + roomH - 1, 0);
	}
*/

	
	for(var j = 0; j < h; j++) {
		for(var i = 0; i < w; i++) {
			var o = ds_grid_get(grid, i, j);
			if(!is_undefined(o)) {
				var ob2 = 0;
				var _solid = 0;
				if(o == 0) {
					// Empty space
					_solid = 0;
				}
				
				if(o == 1) {
					// Cave stuff
					ob2 = 2;
				}
				
				if(o == 2) {
					// Wall edge
					_solid = 1;
					ob2 = 1;
				}
				
				tilemap_set(TileMap, ob2, i, j);
				tilemap_set(WallMap, _solid, i, j);
			}
				
		}
	}

}
