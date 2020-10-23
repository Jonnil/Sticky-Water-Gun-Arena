if hp>=1
	{
	if player=1
	and other.shot_by_player=2
	{
		if hp=1
			{
				kill_count+=1;
			}
		hp-=1;
		with(other)
			{
				instance_destroy();
			}
	}

	if player=2
	and other.shot_by_player=1
	{
		if hp=1
			{
				kill_count+=1;
			}
		hp-=1;
		with(other)
			{
				instance_destroy();
			}
	}
}