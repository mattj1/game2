{
	levelRoom_removeObject(other.currentRoom, other);
	instance_destroy(other);
	
	var scrollColor = "";
	switch(other.scrollType) {
		case 0: scrollColor = "BLUE"; break;
		case 1: scrollColor = "YELLOW"; break;
		case 2: scrollColor = "BLACK"; break;
		case 3: scrollColor = "TEAL"; break;
		case 4: scrollColor = "GREEN"; break;
		case 5: scrollColor = "ORANGE"; break;
		case 6: scrollColor = "WHITE"; break;
		case 7: scrollColor = "GREY"; break;
		case 8: scrollColor = "DARK RED"; break;
		case 9: scrollColor = "DARK BLUE"; break;
		case 10: scrollColor = "DARK TEAL"; break;
		default: scrollColor = "UNKNOWN"; break;
	}
	
	hud_showMessage(scrollColor + " SCROLL");
}
