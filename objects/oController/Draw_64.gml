{
	// Main HUD
	
	draw_set_color(make_color_rgb(64,0,255));
	draw_rectangle(0,112,640,128,false);
	
	draw_set_font(font_0);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	
	draw_text(20,20, "Gold: " + string(player0.gold));


	if(self.messageTime > 0) {
		/*
		draw_set_color(make_color_rgb(0,0,0));
	
		var width = display_get_gui_width() * 0.75;
		var height = 48;
	
		var msg_center_x = display_get_gui_width() / 2;
		var msg_center_y =  display_get_gui_height() * 0.90;
	
		var msgBox_x = msg_center_x - width / 2;
		var msgBox_y = msg_center_y - height / 2;
	
		draw_rectangle(msgBox_x,msgBox_y,msgBox_x + width, msgBox_y + height,false);

		draw_set_color(c_white)
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(msg_center_x, msg_center_y, message);
		*/
		
		draw_set_color(c_white);
		draw_text(display_get_gui_width() * 0.75, 20, message);
	}
}
