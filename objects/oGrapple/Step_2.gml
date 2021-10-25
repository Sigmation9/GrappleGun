/// @description Insert description here
// You can write your code in this editor

if(!global.gamePaused) && (oPlayer.state != pState.win)
{
	if (Gshot == true) && (mouse_check_button_pressed(mb_left)) && (oPlayer.state == pState.swing) && (instance_exists(oHook)) && (Recall = false)
		{	
			Recall = true;
		}
}