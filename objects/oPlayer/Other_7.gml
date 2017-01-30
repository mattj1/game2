{
	//show_debug_message("animation end");
	
	if(instance_exists(oPlayer)) {
		if(state == STATE_ATTACKING) {
				state = STATE_STANDING;
		}
	}


}