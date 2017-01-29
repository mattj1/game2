{
	levelRoom_removeObject(other.currentRoom, other);
	instance_destroy(other);
	
	hud_showMessage("SCROLL");
}
