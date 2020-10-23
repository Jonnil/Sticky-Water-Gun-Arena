mask_index=spr_sticky_idle;

#region/*Initialize the controls*/
if player=1
	{
	key_left=keyboard_check(vk_left);
	key_right=keyboard_check(vk_right);
	key_jump_pressed=keyboard_check_pressed(vk_up);
	key_jump_released=keyboard_check_released(vk_up);
	key_shoot=keyboard_check_pressed(vk_rcontrol);
	spr_idle=spr_sticky_idle;
	spr_die=spr_sticky_die;
	}
	
if player=2
	{
	key_left=keyboard_check(ord("A"));
	key_right=keyboard_check(ord("D"));
	key_jump_pressed=keyboard_check_pressed(ord("W"));
	key_jump_released=keyboard_check_released(ord("W"));
	key_shoot=keyboard_check_pressed(vk_lcontrol);
	spr_idle=spr_catlyn_idle;
	spr_die=spr_catlyn_die;
	}
#endregion

#region/*Move the character to the left*/
if key_left
//	and place_free(x-max_speed,y)
	and!place_meeting(x-1,y,obj_wall)
	and hp>=1
		{
			//x-=max_speed;
			image_xscale=-1;
			hspeed-=0.4;
		}
		#endregion

#region/*Move the character to the right*/
if key_right
//	and place_free(x+max_speed,y)
	and!place_meeting(x+1,y,obj_wall)
	and hp>=1
		{
			//x+=max_speed;
			image_xscale=+1;
			hspeed+=0.4;
		}
		#endregion

#region/*Limit the horizontal speed to the left*/
if hspeed<-10
	{
		hspeed=-10;
	}
	#endregion

#region/*Limit the horizontal speed to the right*/
if hspeed>+10
	{
		hspeed=+10;
	}
	#endregion

friction=0.2;

#region/*Press space to jump*/
if key_jump_pressed
and hp>=1
	and place_meeting(x,y+1,obj_wall)
	and!place_meeting(x,y-1,obj_wall)
		{
			vspeed=-jump_height;
		}
		#endregion

#region/*When you release the jump button, make the player fall*/
if key_jump_released
and vspeed<0
{
	vspeed=vspeed/2;
}

#endregion

#region/*Gravity*/
if!place_meeting(x,y+1,obj_wall)
	{
		gravity=0.75;
	}
else
	{
		if death_timer=0
		{
			gravity=0;
		}
		else
		{
			gravity=0.75;
		}
	}
	#endregion

#region/*Limit the vertical speed down*/
if vspeed>+32
	{
		vspeed=+32;
	}
	#endregion

gravity_direction=270;

#region/*Shooting Left*/
if key_shoot
	and image_xscale<0
	and can_shoot=shoot_cooldown
	and hp>=1
		{
			can_shoot=0;
			obj=instance_create_depth(x,y,0,obj_water_spray);
			with(obj)
			{
				shot_by_player=instance_nearest(x,y,obj_player).player;
				hspeed=-10;
				image_xscale=-1;
			}
		}
		#endregion

#region/*Shooting Right*/
if key_shoot
	and image_xscale>0
	and can_shoot=shoot_cooldown
	and hp>=1
		{
			can_shoot=0;
			obj=instance_create_depth(x,y,0,obj_water_spray);
			with(obj)
			{
				shot_by_player=instance_nearest(x,y,obj_player).player;
				hspeed=+10;
				image_xscale=+1;
			}
		}
		#endregion

/*Shooting cooldown*/
if can_shoot<shoot_cooldown{can_shoot+=1;}

#region/*Die Handeling*/
if hp<=0
{
	sprite_index=spr_die;
	death_timer+=1;
	if death_timer>0
	and death_timer<60
	{
		gravity=0;
		hspeed=0;
		vspeed=0;
	}
	if death_timer=60
	{
		vspeed=-10;
	}
	if death_timer>120
	{
		if global.sudden_death=true
		{
			room_goto(room_win_screen);
		}
		x=xstart;
		y=ystart;
		image_xscale=xscale_start;
		hp=3;
		blinking=60;
		death_timer=0;
	}
	
}
else
{
	sprite_index=spr_idle;
}
#endregion

#region/*Transfer kill count to global kill count*/
if player=1
{
	global.player1_kill_count=kill_count;
}
if player=2
{
	global.player2_kill_count=kill_count;
}
#endregion

#region/*What direction to face when starting the game*/
if player=1
{
	xscale_start=+1;
}

if player=2
{
	xscale_start=-1;
}
#endregion

#region/*Timer Countdown*/
timer_millisecond-=1;
if timer_millisecond<0{timer-=1;timer_millisecond=60;}
if timer<0
{
	room_goto(room_win_screen);
}

#endregion









