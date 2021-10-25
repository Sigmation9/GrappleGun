/// @description Insert description here
// You can write your code in this editor

image_alpha = Vis;

if (oEnding.TheEnd = true) && (Vis < 1)
{
	Vis += 0.01
}

if (Vis == 1) && (keyboard_check_pressed(vk_anykey))
{
	game_end();
}