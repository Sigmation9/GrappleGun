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
			case 2: // Exit
			{
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