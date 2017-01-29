{
	if(messageTime > 0) {
		messageTime --;
		
		if(messageTime == 0) {
			ds_list_clear(messages);
		}
	}
}
