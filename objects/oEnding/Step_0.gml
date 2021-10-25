/// @description Insert description here
// You can write your code in this editor

if (oGame.WinMusic == true)
{
	//Progress text
	letters += spd;
	text = string_copy(endtext[currentline],1,floor(letters));
	
	//next line
	if (letters >= length) && (keyboard_check_pressed(vk_anykey))
	{
		if (currentline + 1 == array_length_1d(endtext))
		{
			TheEnd = true;
			visible = false;
		}
		else
		{
			currentline++;
			letters = 0;
			length = string_length(endtext[currentline]);
		}
	}
}