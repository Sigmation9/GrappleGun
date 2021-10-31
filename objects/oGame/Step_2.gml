/// @description Insert description here
// You can write your code in this editor

if	(keyboard_check_pressed(vk_escape) && (oTitle.Gamestart == true) && (oGui.settings == false) && (oPlayer.state != pState.win))
{
	global.gamePaused = !global.gamePaused;
	
	if (global.gamePaused)
	{
		with(all)
		{
		gamePausedImageSpeed = image_speed;
		image_speed = 0;
		}
	}
	else
	{
		with(all)
		{
		image_speed = gamePausedImageSpeed;
		}
	}
	
	
}
if (oPlayer.state == pState.win)
{
	audio_sound_gain(sndSong,-0.1,200);
}
if(oTitle.Gamestart == true)
{
	audio_sound_gain(sndTitleScreen,-0.1,50);
}
if (audio_sound_get_gain(sndTitleScreen) == 0)
{
	audio_stop_sound(sndTitleScreen);
}

if (oGui.settings)
{
}