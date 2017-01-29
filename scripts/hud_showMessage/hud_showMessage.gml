{
	var _msg = argument0;
	
	controller.messageTime = 90;
	
	if(ds_list_size(controller.messages) == 4) {
		ds_list_delete(controller.messages, 0);
	}
	
	ds_list_add(controller.messages, _msg);
}
