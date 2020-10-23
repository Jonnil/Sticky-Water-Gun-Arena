draw_set_halign(fa_center)

draw_text_outlined(
camera_get_view_width(view_camera[view_current])/2,
camera_get_view_height(view_camera[view_current])/2-64,
"Sticky got killed "+string(global.player1_kill_count)+" times!",
3,
c_black,
c_white);

draw_text_outlined(
camera_get_view_width(view_camera[view_current])/2,
camera_get_view_height(view_camera[view_current])/2,
"Catlyn got killed "+string(global.player2_kill_count)+" times!",
3,
c_black,
c_white);

if global.player1_kill_count<global.player2_kill_count
{
	draw_text_outlined(
	camera_get_view_width(view_camera[view_current])/2,
	camera_get_view_height(view_camera[view_current])/2+64,
	"STICKY WINS!",
	3,
	c_black,
	c_white);
	global.sudden_death=false;
}

if global.player1_kill_count>global.player2_kill_count
{
	draw_text_outlined(
	camera_get_view_width(view_camera[view_current])/2,
	camera_get_view_height(view_camera[view_current])/2+64,
	"CATLYN WINS!",
	3,
	c_black,
	c_white);
	global.sudden_death=false;
}

if global.player1_kill_count=global.player2_kill_count
{
	draw_text_outlined(
	camera_get_view_width(view_camera[view_current])/2,
	camera_get_view_height(view_camera[view_current])/2+64,
	"DRAW! SUDDEN DEATH!",
	3,
	c_black,
	c_white);
	global.sudden_death=true;
}

timer+=1;

if timer>80
{
	timer=60;
}

if timer>60
{
	if timer>70
	{
		draw_text_outlined(
		camera_get_view_width(view_camera[view_current])/2,
		camera_get_view_height(view_camera[view_current])/2+228,
		"Press Space",
		3,
		c_black,
		c_white);
	}
	if keyboard_check_pressed(vk_space)
	{
		if global.sudden_death=false
		{
			global.player1_kill_count=0;
			global.player2_kill_count=0;
		}
		room_goto(room_arena);
	}
}