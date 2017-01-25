/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 7322D775
/// @DnDArgument : "code" "dx = 0;$(13_10)dy = 0;$(13_10)$(13_10)dir = 0;$(13_10)$(13_10)if( keyboard_check(vk_up)){$(13_10)	//if( dir != DIR_LEFT) {$(13_10)		dir |= DIR_UP;$(13_10)//		sprite_index = sprites[dir];$(13_10)//		image_index=0;$(13_10)//		image_speed = 1.0;$(13_10)		dy = -player_speed;$(13_10)//	}$(13_10)}$(13_10)$(13_10)if( keyboard_check(vk_down)){$(13_10)	//if( dir != DIR_LEFT) {$(13_10)		dir |= DIR_DOWN;$(13_10)		dir &= ~DIR_UP;$(13_10)//		sprite_index = sprites[dir];$(13_10)//		image_index=0;$(13_10)//		image_speed = 1.0;$(13_10)		dy = player_speed;$(13_10)//	}$(13_10)}$(13_10)if( keyboard_check(vk_left)){$(13_10)	//if( dir != DIR_LEFT) {$(13_10)		dir |= DIR_LEFT;$(13_10)		$(13_10)//		sprite_index = sprites[dir];$(13_10)//		image_index=0;$(13_10)//		image_speed = 1.0;$(13_10)		dx = -player_speed;$(13_10)//	}$(13_10)}$(13_10)if( keyboard_check(vk_right)){$(13_10)	//if( dir != DIR_LEFT) {$(13_10)		dir |= DIR_RIGHT;$(13_10)		dir &= ~DIR_LEFT;$(13_10)//		sprite_index = sprites[dir];$(13_10)//		image_index=0;$(13_10)//		image_speed = 1.0;$(13_10)		dx = player_speed;$(13_10)//	}$(13_10)}$(13_10)$(13_10)var _left = 7;$(13_10)var _top = 6;$(13_10)var _right = 6;$(13_10)var _bottom = 5;$(13_10)$(13_10)/// ProcessCollision(_inst, _dx,_dy, _right,_left, _top,_bottom)$(13_10)if(dx != 0) {$(13_10)	ProcessCollision(id, dx,0, _right, _left, _top, _bottom );$(13_10)}$(13_10)$(13_10)if(dy != 0) {$(13_10)	ProcessCollision(id, 0,dy, _right, _left, _top, _bottom );$(13_10)}"

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
//	}
}
if( keyboard_check(vk_left)){
	//if( dir != DIR_LEFT) {
		dir |= DIR_LEFT;
		
//		sprite_index = sprites[dir];
//		image_index=0;
//		image_speed = 1.0;
		dx = -player_speed;
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
}

