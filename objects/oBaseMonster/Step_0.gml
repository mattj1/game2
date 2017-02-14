{
	event_inherited();
	
	if(!active) {
		if(levelRoom_IsRevealed(currentRoom)) {
			show_debug_message("monster woke up!");
			active = true;
		}
	} else {
		var dx = 0, dy = 0;
		var _speed = .25;
		var target = player0;

		if(target.x < x) {
			dx = -_speed;
		}
		
		if(target.x > x) dx = _speed;

		if(target.y < y) dy = -_speed;
		if(target.y > y) dy = _speed;
				
		ProcessCollision(self, dx, dy, bbox_right - x, x - bbox_left, y - bbox_top, bbox_bottom - y);
	}
}
