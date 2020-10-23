max_speed=8;
jump_height=20;
player=1;
if global.sudden_death=true
{
	hp=1;
}
else
{
	hp=3;
}
spr_idle=noone;
spr_die=noone;
can_shoot=20;
shoot_cooldown=20;
death_timer=0;
xscale_start=+1;
blinking=0;

if player=1
{
	kill_count=global.player1_kill_count;
}

if player=2
{
	kill_count=global.player2_kill_count;
}


timer=60;
timer_millisecond=60;

if global.sudden_death=false
{
	if!audio_is_playing(snd_music)
	{
	audio_play_sound(snd_music,0,true);
	audio_stop_sound(snd_music_sudden_death);
	}
}
else
{
	if!audio_is_playing(snd_music_sudden_death)
	{
	audio_play_sound(snd_music_sudden_death,0,true);
	audio_stop_sound(snd_music);
	}
}