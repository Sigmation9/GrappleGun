//setting ground
var bbox_side;

grounded = (place_meeting(x,y+1,oWall)) or (place_meeting(x,y+1,oTile));

//get player input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W"));
right_click = mouse_check_button_pressed(mb_right);

if(!global.gamePaused)
{
	// skip the title screen
	if(state == pState.normal)
	{
		oTitle.Gamestart = true;
	}

	switch (state)
	{
		case pState.normal:
		{
			//calculate movment
			var move = key_right - key_left;
			if (key_right) or (key_left) hsp = move *  walkac;
		
			if (move == 0)
			{
				var hfrc =  hfrcg;
				if (!grounded) hfrc = hfrca;
				hsp = Approach(hsp,0,hfrc);
			}
			hsp = clamp(hsp,-walksp,walksp);
		
			vsp += grv;
		
			if (key_jump) && (grounded)
			{
				audio_play_sound(sndJump,5,false);
				grounded = false;
				vspfrc = 0;
				vsp = -jumpsp;
			}
			grapplex = 0;
			grappley = 0;
			ropex = oGrapple.x;
			ropey = oGrapple.y;
			ropeAngleVelocity = 0;
			ropeAngle = point_direction(grapplex,grappley,x,y);
			ropeLength = point_distance(grapplex,grappley,x,y);
		}break
		case pState.swing:
		{
			if(instance_exists(oHook))
			{
				grapplex = oHook.x;
				grappley = oHook.y;
			}
			else
			{
				grapplex = 0;
				grappley = 0;
			}
				ropeAngle = point_direction(grapplex,grappley,x,y);
				ropeLength = point_distance(grapplex,grappley,x,y);
			
			var ropeAngleAcceleration = -0.2 * dcos(ropeAngle);
			ropeAngleAcceleration += (key_right - key_left) * 0.03;
			//ropeLength += (key_down - key_up) * 2;
			ropeLength = max(ropeLength,5);
		
			ropeAngleVelocity += ropeAngleAcceleration;
			ropeAngle += ropeAngleVelocity;
			ropeAngleVelocity *= 0.99;
		
			ropex = grapplex + lengthdir_x(ropeLength, ropeAngle);
			ropey = grappley + lengthdir_y(ropeLength, ropeAngle);
		
			hsp = ropex - x;
			vsp = ropey - y;
		
			//if(key_jump) vsp = - jumpsp;
		
			if (right_click)
			{
				vspfrc = 0;
				//vsp += -jumpsp;
			}
		}
	
	}

	hsp += hspfrc;
	vsp += vspfrc;
	hspfrc = frac(hsp);
	vspfrc = frac(vsp);
	hsp -= hspfrc;
	vsp -= vspfrc;

	//horizontal collition
	if(place_meeting(x,y+1,oWinTile))
	{
		state = pState.win;
		hsp = 0;
		vsp = 0;
	}
	
	if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
	if (tilemap_get_at_pixel(tilemap,bbox_side + hsp,bbox_top) !=0) or (tilemap_get_at_pixel(tilemap,bbox_side + hsp,bbox_bottom) !=0)
	{
		if (hsp > 0) x = x - (x mod 32) + 31 - (bbox_right - x);
		else x = x - (x mod 32) - (bbox_left - x);
		hsp = 0;
	}
 
	if (place_meeting(x+hsp,y,oWall))
	{
		var hStep = sign(hsp);
		if ((state == pState.normal))
		{
			if (hsp > 0) x = x - (x mod 32) + 31 - (bbox_right - x);
			else x = x - (x mod 32) - (bbox_left - x);
		}
		hsp = 0;
		hspfrc = 0;
		//while(!place_meeting(x+hStep,y,oWall)) x += hStep;
		if (state == pState.swing)
		{
			if (hsp > 0) x = x - (x mod 16) + 31 - (bbox_right - x);
			else x = x - (x mod 16) - (bbox_left - x);
			ropeAngle = point_direction(grapplex,grappley,x,y);
			ropeAngleVelocity = 0;
		}
	}
	
	if (place_meeting(x+hsp,y,oTile))
	{
		var hStep = sign(hsp);
		if ((state == pState.normal))
		{
			if (hsp > 0) x = x - (x mod 32) + 31 - (bbox_right - x);
			else x = x - (x mod 32) - (bbox_left - x);
		}
		hsp = 0;
		hspfrc = 0;
		//while(!place_meeting(x+hStep,y,oTile)) x += hStep;
		if (state == pState.swing)
		{
			if (hsp > 0) x = x - (x mod 16) + 31 - (bbox_right - x);
			else x = x - (x mod 16) - (bbox_left - x);
			ropeAngle = point_direction(grapplex,grappley,x,y);
			ropeAngleVelocity = 0;
		}
	}
	x += hsp;

//vertical collition
/*if (vsp > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
if (tilemap_get_at_pixel(tilemap,bbox_left,bbox_side + vsp) !=0) or (tilemap_get_at_pixel(tilemap,bbox_right,bbox_side + vsp) !=0)
{
	if (vsp > 0) y = y - (y mod 32) + 31 - (bbox_bottom - y);
	else y = y - (y mod 32) (bbox_top - y);
	vsp = 0;
}*/

	if (place_meeting(x,y+vsp,oWall))
	{
		var vStep = sign(vsp);
		if (vsp > 0) y = y - (y mod 32) + 31 - (bbox_bottom - y);
		else y = y - (y mod 32) - (bbox_top - y);
		vsp = 0;
		vspfrc = 0;
		while(!place_meeting(x,y+vStep,oWall)) y += vStep;
		if (state == pState.swing)
		{
			ropeAngle = point_direction(grapplex,grappley,x,y);
			ropeAngleVelocity = 0;
		}
	}

	if (place_meeting(x,y+vsp,oTile))
	{
		var vStep = sign(vsp);
		if (vsp > 0) y = y - (y mod 32) + 31 - (bbox_bottom - y);
		else y = y - (y mod 32) - (bbox_top - y);
		vsp = 0;
		vspfrc = 0;
		while(!place_meeting(x,y+vStep,oTile)) y += vStep;
		if (state == pState.swing)
		{
			ropeAngle = point_direction(grapplex,grappley,x,y);
			ropeAngleVelocity = 0;
		}
	}
	y += vsp;


	//animation

	if	(state == pState.wait) && (Start == false)
	{
		sprite_index = sPlayerS;
		image_speed = 0;
	}
	if	(state == pState.normal)
	{
		if (!place_meeting(x,y+1,oWall)) && (!place_meeting(x,y+1,oTile))
		{
			sprite_index = sPlayerA;
			image_speed = 0;
			if (sign(vsp) > 0) image_index = 1; else image_index = 0;
		}
		else
		{
			if (sprite_index == sPlayerA) audio_play_sound(sndLand,4,false);
			image_speed = .5;
			if (hsp == 0)
			{
				sprite_index = sPlayer;
			}
			else
			{
				sprite_index = sPlayerR;
			}

		}
	}
	else if (state == pState.swing)
	{
		sprite_index = sPlayerA;
		image_speed = 0;
		image_index = 2;
	}
		if (hsp != 0) image_xscale = sign(hsp);
}
	if (state == pState.wait) && (image_speed == 0) && (Start == true)
	{
		oTitle.Gamestart = true;
		state = pState.normal;
	}