{
	TileMap = layer_tilemap_get_id("Tiles_1");
	global.TileMap = TileMap;
	
	WallMap = layer_tilemap_get_id("CollisionLayer");
	layer_set_visible("CollisionLayer", false);		// just in case I've left them on!
	global.WallMap = WallMap;
	#macro DIR_STOP		0
	#macro DIR_UP		1
	#macro DIR_DOWN		2
	#macro DIR_LEFT		4
	#macro DIR_RIGHT	8
	#macro DIR_DEAD		16
		
	#macro PLAYER_SPEED 2.0
	
	// Message
	messages = ds_list_create();
	messageTime = 0;
	
	//camera_set_view_size(view_camera[0], 320 * 4, 176 * 4);
	
	var w = tilemap_get_width(TileMap);
	var h = tilemap_get_height(TileMap);
	
	var goodRooms = ds_queue_create();
	var allRooms = ds_list_create();
	
	var grid = ds_grid_create(w, h);
	global.level = grid;
	ds_grid_clear(grid, 1);
	
	var lastRoom = mgRoom_New(10, 10, 10, 10);
	ds_queue_enqueue(goodRooms, lastRoom);
	ds_list_add(allRooms, lastRoom);
	
	mgRoom_BasicFill(grid, lastRoom);
	
	randomize();
	
	for(var i = 0; i < 15; i++) {
		var newRoom = mgRoom_GenerateAdjacent(grid, lastRoom, 10);
		
		if(newRoom == pointer_null)
			break;
			
		mgRoom_AdjacentFill(grid, newRoom);
		
		ds_queue_enqueue(goodRooms, newRoom);
		ds_list_add(allRooms, newRoom);
				
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
			ds_list_add(allRooms, newRoom);
			
			lastRoom = newRoom;
		}
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
				
				// None of the map is revealed yet.
				ob2 = 2;
				
				tilemap_set(TileMap, ob2, i, j);
				tilemap_set(WallMap, _solid, i, j);
			}		
		}
	}
	
	// Place the player inside room 0
	show_debug_message("placing player in first room");
	var firstRoom = allRooms[| 0];
	
	var p = instance_find(oPlayer, 0);
	p.x = firstRoom[? "x"] * 8 + firstRoom[? "w"] * 8 / 2;
	p.y = firstRoom[? "y"] * 8 + firstRoom[? "h"] * 8 / 2;
	p.currentRoom = firstRoom;


	var numRooms = ds_list_size(allRooms);
	for(var i = 0; i < numRooms; i++) {
		var _room = allRooms[| i];
		
		for(var j = 0; j < 2; j++) {
			if(irandom_range(0,100) < 10) {
				var _scroll = instance_create_depth(0,0,p.depth, oScroll);
				levelRoom_placeObjectRandom(_room, _scroll);
				_scroll.visible = false;		
				_scroll.scrollType = irandom_range(0,10);	
			}
			
			if(irandom_range(0,100) < 20) {
				var _obj = instance_create_depth(0,0,p.depth, oChest);
				levelRoom_placeObjectRandom(_room, _obj);
				_obj.visible = false;			
			}
		}
	}

	

	levelRoom_Reveal(firstRoom);
}
