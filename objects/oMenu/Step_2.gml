/// @description Insert description here
// You can write your code in this editor
if(oGui.settings == true)
{
	var ds_grid = ds_menu_audio, ds_height = ds_grid_height(ds_grid);
	keyUp = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up);
	keyDown = keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down);
	keyRightheld = keyboard_check(ord("D")) or keyboard_check(vk_right);
	keyRight = keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_right);
	keyLeftheld = keyboard_check(ord("A")) or keyboard_check(vk_left);
	keyLeft = keyboard_check_pressed(ord("A")) or keyboard_check_pressed(vk_left);
	keyActivate = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter);
	
	if (inputing){
		switch (settingsOptionSelected)
		{	
			case 0: //Resolution
			{
					var hinput = keyboard_check_pressed(keyRight) -  keyboard_check_pressed(keyLeft);
					if (hinput !=0)
					{
						audio_play_sound(sndChing,4,false);
						ds_grid[# 3, settingsOptionSelected] += hinput;
						ds_grid[# 3, settingsOptionSelected] = clamp(ds_grid[# 3, settingsOptionSelected], 0, array_length_1d(ds_grid[# 4, ds_menu_audio])-1);
					}
			}break;
		}
		switch(ds_grid[# 1, settingsOptionSelected])
		{
			case menuelementType.slider:
			{
				var hinput = keyboard_check(keyRightheld) -  keyboard_check(keyLeftheld);
				if (hinput !=0)
				{
					ds_grid[# 3, settingsOptionSelected] += hinput * 0.01;
					ds_grid[# 3, settingsOptionSelected] = clamp(ds_grid[# 3, settingsOptionSelected], 0, 1);
					if(inputing){script_execute(ds_grid[# 2, settingsOptionSelected],ds_grid[# 3, settingsOptionSelected]);}
				}
			}break;
		}
	} else{
		settingsOptionSelected += (keyDown - keyUp);
		if (settingsOptionSelected >= array_length(settingsOption)) settingsOptionSelected = 0;
		if (settingsOptionSelected < 0) settingsOptionSelected = array_length(settingsOption) -1;
	
		if (keyUp) or (keyDown)
		{
		audio_play_sound(sndHookBack,9,false);
		}
		}
		if (keyActivate)
		{
			audio_play_sound(sndChing,9,false);
		
			switch (settingsOptionSelected)
			{	
				case 0: //Resolution
				{
					if(inputing){script_execute(ds_grid[# 2, settingsOptionSelected],ds_grid[# 3, settingsOptionSelected]);}
					inputing = !inputing;
				}break;
				case 1: // Master
				{
					
				}
				case 2: // Sound
				{
					
				}
				case 3: // Music
				{
					if(inputing){script_execute(ds_grid[# 2, settingsOptionSelected],ds_grid[# 3, settingsOptionSelected]);}
					inputing = !inputing;
				}break;
			}
		}
}