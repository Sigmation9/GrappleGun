// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ChangeResolution(){
switch(argument0){
	case 0: window_set_size(848,480); break;
	case 1:	window_set_size(1366,768); break;
	case 2:	window_set_size(1600,900); break;
	case 3:	window_set_size(1920,1080); break;
}
}