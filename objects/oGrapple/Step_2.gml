/// @description Insert description here
// You can write your code in this editor

if(!global.gamePaused) && (oPlayer.state != pState.win)
{
	if (Gshot == true) && (mouse_check_button_pressed(mb_left)) && (instance_exists(oHook)) && (Recall = false) && (oHook.hookL == true) 
		{	
			Recall = true;
		}
}