{
	var entity = argument0;
	var dir = argument1;
	
	var _x = entity.x;
	var _y = entity.y;
	
	
	switch(dir) {
		case DIR_UP:
			_y -= 10;
		break;
		case DIR_DOWN:
			_y += 10;
		break;
		case DIR_LEFT:
			_x -= 10;
		break;
		case DIR_RIGHT:
			_x += 10;
		break;
	}
	
	var damageObject = instance_create_depth(_x, _y, entity.depth - 1, oDamage_Sword);
	damageObject.image_xscale = 1.5;
	damageObject.image_yscale = 1.2;
}
