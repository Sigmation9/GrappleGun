/// @description Insert description here
// You can write your code in this editor
if (oGui.settings == true)
{
	var ds_grid = ds_menu_audio, ds_height = ds_grid_height(ds_grid);
	var y_buffer = 100, x_buffer = 16;
	var start_y = (RESOLUTION_H/2) - ((((ds_height-2)/2) * y_buffer)), start_x = (RESOLUTION_W/2);
	var yy = 0; repeat(ds_height){
		yy++;
	}
	
	draw_set_color(c_black);
	draw_set_font(fEnd);
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	
	draw_text(RESOLUTION_W * 0.3, RESOLUTION_H * 0.16,"FullScreen");
	
	for (var i = 0; i < array_length(settingsOption ); i++)
	{
		var _print = "";
		if (i == settingsOptionSelected)
		{
			_print += "> " + settingsOption [i] + " <";
		}
		else
		{
			_print += settingsOption [i];
			draw_set_alpha(0.7);
		}
		draw_text(RESOLUTION_W * 0.4, RESOLUTION_H * 0.5 - 100 + (i * 100), _print);
		draw_set_alpha(1.0);
	
	}
		//draw elements on the right
		draw_set_halign(fa_center);
		var rtx = start_x - x_buffer, rty;
		yy = 0; repeat(ds_height){
			rty = start_y + (yy * y_buffer);
		switch(ds_grid[# 1,yy]){
		case menuelementType.shift:
			var current_val = ds_grid[# 3,yy];
			var current_array = ds_grid[# 4,yy];
			var left_shift = "<< ";
			var right_shift = " >>";
			
			if(current_val == 0) left_shift = "";
			if(current_val == array_length_1d(ds_grid[# 4,yy])-1) right_shift = "";
			
			var c = c_black;
		
			if(inputing && yy == settingsOptionSelected) c = c_yellow;
			draw_text_color(RESOLUTION_W * 0.55, RESOLUTION_H * 0.5 - 500 + (i * 100),left_shift + current_array[current_val] + right_shift, c,c,c,c, 1);
	
		break;
		
		case menuelementType.slider:
			var len = 200;
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4,yy];
			var circle_pos = ((current_val - current_array[0]) / (current_array[1] - current_array[0]));
			c = c_black;
			
			draw_line_width(rtx,rty,rtx + len,rty, 6);
			if(inputing && yy == settingsOptionSelected){ c = c_yellow;} else {c = c_white;}
			draw_circle_color(rtx + (circle_pos*len),rty,8 ,c,c, false);
			if(inputing && yy == settingsOptionSelected) {c = c_yellow;} else {c = c_black;}
			draw_text_color(rtx + (len * 1.5),rty,string(floor(circle_pos*100)) + "%",c,c,c,c,1);
		break;
		}
	yy++;
	}
}