if player=1
and other.shot_by_player=2
{
	hp-=1;
	with(other)
		{
			instance_destroy();
		}
}

if player=2
and other.shot_by_player=1
{
	hp-=1;
	with(other)
		{
			instance_destroy();
		}
}