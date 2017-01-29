{
	show_debug_message("Collide with scroll");
	show_debug_message(other);
	
	mgRoom_removeObject(other.currentRoom, other);

	instance_destroy(other);
}
