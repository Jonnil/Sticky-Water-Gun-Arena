draw_set_halign(fa_left)

#region/*Blinking*/
if blinking>0
{
	blinking-=1;
	if blinking % 2 == 0
	{
		draw_self();
	}
}
else
{
	draw_self();
}
#endregion

#region/*Show health*/
if player=1
{
	if(asset_get_type("spr_heart")==asset_sprite)
	{
		if(hp>=1)
		{
			draw_sprite_ext(spr_heart,0,32,32,1,1,0,c_red,1);
		}
		if(hp>=2)
		{
			draw_sprite_ext(spr_heart,0,128,32,1,1,0,c_red,1);
		}
		if(hp>=3)
		{
		draw_sprite_ext(spr_heart,0,224,32,1,1,0,c_red,1);
		}
	}
}

if player=2
{
	if(asset_get_type("spr_heart")==asset_sprite)
	{
		if(hp>=1)
		{
			draw_sprite_ext(spr_heart,0,camera_get_view_width(view_camera[view_current])-32,32,1,1,0,c_aqua,1);
		}
		if(hp>=2)
		{
			draw_sprite_ext(spr_heart,0,camera_get_view_width(view_camera[view_current])-128,32,1,1,0,c_aqua,1);
		}
		if(hp>=3)
		{
			draw_sprite_ext(spr_heart,0,camera_get_view_width(view_camera[view_current])-224,32,1,1,0,c_aqua,1);
		}
	}
}
#endregion

#region/*Show kill count*/
if player=1
{
	draw_text_outlined(16,64,"Sticky killed "+string(kill_count)+" times!",1,c_black,c_white);
}
if player=2
{
	draw_text_outlined(camera_get_view_width(view_camera[view_current])-220,64,"Catlyn killed "+string(kill_count)+" times!",1,c_black,c_white);
}
#endregion

#region/*Show timer*/
draw_set_halign(fa_center)
if global.sudden_death=false
{
	draw_text_outlined(camera_get_view_width(view_camera[view_current])/2,64,string(timer),3,c_black,c_white);
}
else
{
	draw_text_outlined(camera_get_view_width(view_camera[view_current])/2,64,"Sudden Death",3,c_black,c_white);
}