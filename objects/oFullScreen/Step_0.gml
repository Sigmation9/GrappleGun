/// @description Insert description here
// You can write your code in this editor

if !oGui.settings
{
	instance_destroy(self);
}

if (fullscreen) or (window_set_fullscreen(!window_get_fullscreen))
{
	image_index = 1;
}
else
{
	image_index = 0;
}

if (mouse_check_button_pressed(mb_left)) && (position_meeting(mouse_x, mouse_y, self))
{
	fullscreen = !fullscreen;
	window_set_fullscreen(!window_get_fullscreen());
}