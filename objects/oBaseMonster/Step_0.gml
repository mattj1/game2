{
	if(!active) {
		if(levelRoom_IsRevealed(currentRoom)) {
			show_debug_message("monster woke up!");
			active = true;
		}
	}
}
