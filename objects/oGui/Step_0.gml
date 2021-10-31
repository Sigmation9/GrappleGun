/// @description Insert description here
// You can write your code in this editor

LoadGame();

if(Continue == true)
{
	oPlayer.x = savex;
	oPlayer.y = savey;
	wait++;
	if(wait == 29)
	{
		oPlayer.Start = true;
		oPlayer.state = pState.normal;
	}
	if (wait == 30)
	{
		wait = 0;
		Continue = false;
	}
}

if(RestartGame == true)
{
	global.gamePaused = false;
	wait++;
	if(wait == 25)
	{
		if (instance_exists(oHook)) instance_destroy(oHook);
		if (instance_exists(oHook2)) instance_destroy(oHook2);
		oGrapple.Gshot = false;
		oPlayer.x = 485.0;
		oPlayer.y = 11938.0;
		oPlayer.hsp = 0;
		oPlayer.vsp = 0;
		audio_sound_gain(sndTitleScreen,1,50)
		oTitle.Gamestart = false;
		oGame.Titlemusic = false;
		oGame.Gamemusic = false;
		oPlayer.state = pState.wait;
		oPlayer.Start = false;
		oPlayer.GetUpSound = false;
		oPlayer.image_speed = 0;
		oPlayer.image_index = 0;
		oTitle.visible = true;
		oPlayer.image_xscale = 1;
		pauseOptionSelected = 0;
	}
	if (wait == 30)
	{
		wait = 0;
		RestartGame= false;
	}
}