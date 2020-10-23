draw_self();

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