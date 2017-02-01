{
	if(!didDamage) {
		didDamage = true;
		
		show_debug_message("damage size: " + string(image_xscale));
		
		// Loop through object types that can take damage
		
		var inst = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, oBaseMonster, false, true);
		if(inst != noone) {
			show_debug_message("hit a base monster!");
			inst.health -= 20;
			if(inst.health < 0) {
				levelRoom_removeObject(inst.currentRoom, inst);
				instance_destroy(inst);
			}
		}
	}
	
}
