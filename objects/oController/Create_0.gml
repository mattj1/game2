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
	
	#macro PLAYER_SPEED 4.0
	
	//camera_set_view_size(view_camera[0], 320 * 4, 176 * 4);
	
	var w = tilemap_get_width(TileMap);
	var h = tilemap_get_height(TileMap);
	
	// Set a tile value at 0,0
	// tilemap_set(WallMap, 1, 0, 0);
	var goodRooms = ds_queue_create();
	
	var grid = ds_grid_create(w, h);
	ds_grid_clear(grid, 1);
	
	var lastRoom = mgRoom_New(10, 10, 10, 10);
	ds_queue_enqueue(lastRoom);
	
	mgRoom_BasicFill(grid, lastRoom);
	
	randomize();
	
	for(var i = 0; i < 15; i++) {
		var newRoom = mgRoom_GenerateAdjacent(grid, lastRoom, 10);
		
		if(newRoom == pointer_null)
			break;
			
		mgRoom_AdjacentFill(grid, newRoom);
		
		ds_queue_enqueue(goodRooms, newRoom);
		
		//ds_map_destroy(lastRoom);
		lastRoom = newRoom;
	}
	
	var lastRoom2;
	
	// Attempt to dig out of all rooms until we run out of space
	while(!ds_queue_empty(goodRooms)) {
		lastRoom = ds_queue_dequeue(goodRooms);
		lastRoom2 = lastRoom;
		
		for(var i = 0; i < 7; i++) {
			var newRoom = mgRoom_GenerateAdjacent(grid, lastRoom, 5);
		
			if(newRoom == pointer_null)
				break;
			
			mgRoom_AdjacentFill(grid, newRoom);
		
			ds_queue_enqueue(goodRooms, newRoom);
		
			lastRoom = newRoom;
		}
		
		ds_map_destroy(lastRoom2);	
	}
	
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
				
				if(o == 3) {
					// room door/edge
					_solid = 2;
				}
				
				tilemap_set(TileMap, ob2, i, j);
				tilemap_set(WallMap, _solid, i, j);
			}		
		}
	}
}
