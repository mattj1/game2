{
	dx = 0;
dy = 0;
dir = 0;
if( keyboard_check(vk_up)){
	//if( dir != DIR_LEFT) {
		dir |= DIR_UP;
//		sprite_index = sprites[dir];
//		image_index=0;
//		image_speed = 1.0;
		dy = -player_speed;
		facingDir = DIR_UP;
//	}
}
if( keyboard_check(vk_down)){
	//if( dir != DIR_LEFT) {
		dir |= DIR_DOWN;
		dir &= ~DIR_UP;
//		sprite_index = sprites[dir];
//		image_index=0;
//		image_speed = 1.0;
		dy = player_speed;
		facingDir = DIR_DOWN;
//	}
}
if( keyboard_check(vk_left)){
	//if( dir != DIR_LEFT) {
		dir |= DIR_LEFT;
//		sprite_index = sprites[dir];
//		image_index=0;
//		image_speed = 1.0;
		dx = -player_speed;
		facingDir = DIR_LEFT;
//	}
}
if( keyboard_check(vk_right)){
	//if( dir != DIR_LEFT) {
		dir |= DIR_RIGHT;
		dir &= ~DIR_LEFT;
//		sprite_index = sprites[dir];
//		image_index=0;
//		image_speed = 1.0;
		dx = player_speed;
		facingDir = DIR_RIGHT;
//	}
}
var _left = 7;
var _top = 6;
var _right = 6;
var _bottom = 5;
/// ProcessCollision(_inst, _dx,_dy, _right,_left, _top,_bottom)
if(dx != 0) {
	ProcessCollision(id, dx,0, _right, _left, _top, _bottom );
}
if(dy != 0) {
	ProcessCollision(id, 0,dy, _right, _left, _top, _bottom );
}

	if(dx == 0 && dy == 0) {
		image_xscale = 1;
		switch(facingDir) {
			case DIR_UP:
			sprite_index = spr_player_stand_up;
			break;
			case DIR_DOWN:
			sprite_index = spr_player_stand_down;
			break;
			case DIR_LEFT:
			sprite_index = spr_player_stand_right;
			image_xscale = -1;
			break;
			case DIR_RIGHT:
			sprite_index = spr_player_stand_right;
			break;
		}
	}

	if(dy > 0) {
		sprite_index = spr_player_walk_down;
		image_xscale = 1;
	}
	
	if(dy < 0) {
		sprite_index = spr_player_walk_up;
		image_xscale = 1;
	}
	if(dx < 0) {
		sprite_index = spr_player_walk_right;
		image_xscale = -1;
	}
	if(dx > 0) {
		sprite_index = spr_player_walk_right;
		image_xscale = 1;
	}
	
	if(dx != 0 || dy != 0) {
		// Room visibility (Fog of war)
		if(!is_undefined(currentRoom)) {

			var adjacentRooms = currentRoom[? "adjacentRooms"];
			var numAdjacentRooms = ds_list_size(adjacentRooms)
	
			for(var i = 0; i < numAdjacentRooms; i++) {
				var _room = adjacentRooms[| i];
		
				if(levelRoom_ContainsObject(_room, self)) {
					currentRoom = _room;
					levelRoom_Reveal(_room);
					break;
				}
			}
		}
	}
	
}