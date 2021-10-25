/// @description Insert description here
// You can write your code in this editor

	if (state == pState.wait) && (key_jump) && (image_index < 7) && (Start == false)
	{
		Start = true;
		sprite_index = sPlayerG;
		image_speed = 1;
	}
	if (state == pState.wait) && (image_index > 3) && (image_index < 3.2) && (Start == true)
	{
		audio_play_sound(sndLand,1,false);
	}
	if (state == pState.wait) && (image_index > 5)
	{
		image_speed = 0;
	}
	if (state == pState.win) 
	{
	if (image_index < 16)
		{
			sprite_index = sPlayerW;
			image_speed = 1;
		}
		else
		{
			image_speed = 0;
		}
	}