{
	var ii = floor(image_index);
	
	if(ii != last_image_index || image_number != last_image_number) {
		//show_debug_message("oBE " + string(ii) + " " + string(image_number));
		event_user(0);
	}
	
	last_image_index = ii;
	last_image_number = image_number;
}
