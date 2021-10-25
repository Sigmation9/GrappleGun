/// @desc 

if(!global.gamePaused)
{
	if(instance_exists(follow))
	{
		yTo = follow.y;
	}
	
	y += (yTo - y) / 25;
	
	y = clamp(y,view_h2,room_height - view_h2)
	x = clamp
	camera_set_view_pos(cam,90,y - view_h);
}	
camx = x;
camy = y;