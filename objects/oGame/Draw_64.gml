/// @description Insert description here
// You can write your code in this editor

if(oPlayer.state == pState.win)
{
	//layer_sequence_create("Sparks",camera_get_view_x(0),camera_get_view_y(0),seCut);
	draw_set_color(c_black)
	draw_rectangle(0,0,RESOLUTION_W,128,false);
	draw_rectangle(0,RESOLUTION_H-128,RESOLUTION_W,RESOLUTION_H,false);
}