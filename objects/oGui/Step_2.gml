/// @description Insert description here
// You can write your code in this editor

if(global.gamePaused) && (settings == false)
{
	keyUp = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up);
	keyDown = keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down);
	pauseOptionSelected += (keyDown - keyUp);
	if (pauseOptionSelected >= array_length(pauseOption)) pauseOptionSelected = 0;
	if (pauseOptionSelected < 0) pauseOptionSelected = array_length(pauseOption) -1;
	
	if (keyUp) or (keyDown)
	{
	audio_play_sound(sndHookBack,9,false);
	}
	
	keyActivate = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter);
	if (keyActivate)
	{
		audio_play_sound(sndChing,9,false);
		
		switch (pauseOptionSelected)
		{	
			case 0: //Resume
			{
				global.gamePaused = false;
				with (all)
				{
					gamePausedImageSpeed = image_speed;
					image_speed = 0;
				}
			}break;
			case 1: // Settings
			{
				settings = true;
				with (instance_create_layer(oCamera.camx + 281,oCamera.camy - 96,"Sparks",oSettings))
				{
				}
				with (instance_create_layer(oCamera.camx + 140,oCamera.camy - 255,"topSettings",oFullScreen))
				{
				}
			}break;
			case 2: // Save & Quit
			{
				HasSave = true;
				SaveGame();
				RestartGame = true;
			}break;
		}
	}
}

if (oPlayer.state == pState.wait) && (settings == false)
{
	keyUp = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up);
	keyDown = keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down);
	startOptionSelected += (keyDown - keyUp);
	if (startOptionSelected >= array_length(startOption)) startOptionSelected = 0;
	if (startOptionSelected < 0) startOptionSelected = array_length(startOption) -1;
	
	if (keyUp) or (keyDown)
	{
	audio_play_sound(sndHookBack,9,false);
	}
	
	keyActivate = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter);
	if (keyActivate)
	{
		
		switch (startOptionSelected)
		{	
			case 0: //Resume
			{
				if(RestartGame == false)
				{
					audio_play_sound(sndChing,9,false);
					oPlayer.Start = true;
					oPlayer.sprite_index = sPlayerG;
					oPlayer.image_speed = 1;
				}
			}break;
			case 1: // Continue
			{
				if (HasSave == false)
				{
				audio_play_sound(sndOpps,9,false);
				}
				else if (HasSave == true)
				{
				oPlayer.GetUpSound = true;
				audio_play_sound(sndChing,9,false);
				Continue = true;
				}
			}break;
			case 2: // Settings
			{
				audio_play_sound(sndChing,9,false);
				settings = true;
				with (instance_create_layer(oCamera.camx + 281,oCamera.camy - 96,"Sparks",oSettings))
				{
				}
				with (instance_create_layer(oCamera.camx + 140,oCamera.camy - 255,"topSettings",oFullScreen))
				{
				}
			}break;
			case 3: // Exit
			{
				audio_play_sound(sndChing,9,false);
				game_end()
			}break;
		}
	}
}


if (settings == true) && (keyboard_check_pressed(vk_escape)) && (oMenu.inputing == false)
{
	settings = false;
	instance_destroy(oSettings);
}
