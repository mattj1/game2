{
	#macro STATE_STANDING 0
	#macro STATE_WALKING 1
	#macro STATE_ATTACKING 2
	
	player_speed = PLAYER_SPEED;
	dx = 0;
	dy = 0;
	dir = DIR_RIGHT;
	facingDir = DIR_RIGHT;
	WallMap = global.WallMap;
	gold = 0;
	
	identifiedScrolls = 0;
	
	attacking = false;
	
	state = STATE_STANDING;
	
	//currentRoom = pointer_null;
}
	