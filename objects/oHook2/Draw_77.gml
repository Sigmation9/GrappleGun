/// @desc

if(!global.gamePaused)
{
	image_angle = point_direction(x,y,oGrapple.x,oGrapple.y) + 180;
	move_towards_point(oGrapple.x,oGrapple.y,Speed);

	if (place_meeting(x,y,oGrapple))
	{
		audio_play_sound(sndHookBack,6,false);
		oGrapple.Gshot = false;
		instance_destroy(self);
	}
	
	if (Speed == 35)
	{
		audio_play_sound(sndHookBack,6,false);
		oGrapple.Gshot = false;
		instance_destroy(self);
	}
}
if(global.gamePaused)
{
move_towards_point(oGrapple.x,oGrapple.y,0);
}