/// @description Insert description here
// You can write your code in this editor

if (oPlayer.state != pState.win)
{
	if(oTitle.Gamestart == true) && (Gamemusic == false) && (audio_sound_get_gain(sndTitleScreen) == 0)
	{
		Gamemusic = true;
		audio_play_sound(sndSong,1,true);
		audio_set_master_gain(sndSong, 0);
		audio_stop_sound(sndTitleScreen);
	}
	
	//if	(Gamemusic == true)
	//{
		//audio_sound_gain(sndSong,1,400);
	//}

	if(oTitle.Gamestart == false)
	{
		audio_stop_sound(sndSong);
	}

	if(oTitle.Gamestart == false) && (Titlemusic == false)
	{
		Titlemusic = true;
		audio_play_sound(sndTitleScreen,1,true);
	}
}
if(audio_sound_get_gain(sndSong) == 0) && (WinMusic == false) && (oPlayer.state == pState.win)
{
	WinMusic = true;
	audio_play_sound(sndWin,1,true);
}