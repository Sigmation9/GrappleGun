// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ChangeVolume(){
	
	var type = settingsOptionSelected;
	
	switch(type){
		case 0:
		case 1:	audio_master_gain(argument0); break;
		case 2:	audio_group_set_gain(audiogroupSFX,	argument0,0); break;
		case 3: audio_group_set_gain(audiogroupMusic,	argument0,0); break;
	}
}