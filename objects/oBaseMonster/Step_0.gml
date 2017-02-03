{
	if(!active) {
		if(levelRoom_IsRevealed(currentRoom)) {
			show_debug_message("monster woke up!");
			active = true;
		}
	} else {
		var dx = 0;
		var _speed = .5;
		if(player0.x < x) {
			dx = -_speed;
		}
		
		if(player0.x > x) dx = _speed;
		
		
		//x += dx;
//	ProcessCollision(_inst, _dx,_dy, _right,_left, _top,_bottom)
		ProcessCollision(self, dx, 0, bbox_right - x, x - bbox_left, y- bbox_top, bbox_bottom - y);
	}
}
