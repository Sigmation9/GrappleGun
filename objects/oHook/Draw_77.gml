/// @desc

if(!global.gamePaused)
{
	x += lengthdir_x(spd,direction);
	y += lengthdir_y(spd,direction);

	if (place_meeting(x,y,oWall)) 
	{
		with (instance_create_layer(x,y,"Sparks",oSparks))
		{
			direction = other.image_angle;
			image_angle = direction;
		}
		oGrapple.Recall = true;
		audio_play_sound(sndOpps,8,false);
		audio_play_sound(sndChing,8,false);
	//speed = 0 
	//oPlayer.state = pState.swing;
	}
	
	if (point_distance(oGrapple.x,oGrapple.y,x,y) > 400) && (!place_meeting(x,y,oTile))
	{
		oGrapple.Recall = true;
	}
	
	if (place_meeting(x,y,oTile)) 
	{
		if (hookL == false) audio_play_sound(sndGHit,8,false);
		spd = 0 
		oPlayer.state = pState.swing;
		 hookL = true;
	}
}