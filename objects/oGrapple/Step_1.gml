/// @desc

x = oPlayer.x;
y = oPlayer.y + 5;

if(!global.gamePaused) && (oPlayer.state != pState.win)
{
	if	(oPlayer.state == pState.wait)
	{
		visible = false;
	}
	if(oTitle.Gamestart == true)
	{
		visible = true;
	}

	if (Gshot = false) && (mouse_check_button_pressed(mb_left)) && (oPlayer.state == pState.normal)
	{
		audio_play_sound(sndShoot,6,false);
		audio_play_sound(sndSmoke,5,false);
		image_index = 1;
		Gshot = true;
		with (instance_create_layer(x,y,"Hook",oHook))
		{
			spd = 25;
			direction = other.image_angle + random_range(-3,3);
			image_angle = direction;
		}
	
	}

	if (Gshot == true) && (mouse_check_button(mb_right)) && (oPlayer.state == pState.swing) && (instance_exists(oHook)) && (Recall = false)
	{	
		Recall = true;
	}

	if(Recall == true) && (instance_exists(oHook))
	{
		audio_play_sound(sndRetrackt,4,false);
		oPlayer.state = pState.normal;
		Recall = false;
		with (instance_create_layer(oHook.x,oHook.y,"Hook",oHook2))
		{
			//speed = 5;
			direction = other.image_angle;
			image_angle = direction;
		}
	}

	if(instance_exists(oHook2))
		{
			instance_destroy(oHook);
		}
	
	if (Gshot == false)
	{
		image_index = 0;
		image_angle = point_direction(x,y,mouse_x,mouse_y)
		if (image_angle > 90) && (image_angle < 270)
		{
			image_yscale = -1;
		}
		else
		{
			image_yscale = 1;
		}
	}
	else if (Recall == true)
	{
	image_angle = point_direction(x,y,mouse_x,mouse_y)
		if (image_angle > 90) && (image_angle < 270)
		{
			image_yscale = -1;
		}
			else
		{
			image_yscale = 1;
		}
	}
	else
	{
		if(instance_exists(oHook))
		{
			image_angle = point_direction(x,y,oHook.x,oHook.y)
		}
		
	}
}

if(oPlayer.state == pState.win)
{
	visible = false;
}