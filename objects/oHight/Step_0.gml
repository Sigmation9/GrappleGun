/// @description Insert description here
// You can write your code in this editor


Climb =  11938 - (oPlayer.y - yEnd / yStart);

climbnum = Climb * 100 /11346;

if (climbnum >= 100)
{
	climbnum = 100;
}


wait++

if (wait == 1)
{ 
	firsty = oPlayer.y;
	savey = firsty + 1000;
}

if (wait == 200)
{
	wait = 0;
}

if (oPlayer.y >= savey + 100)
{
	gamesaved = true;
}


if (gamesaved == true) && (oPlayer.grounded)
{
	SaveGame();
	gamesaved = false;
	savewait = 60;
	gamesavetxt = true;
}

if (gamesavetxt == true) && (savewait > 0)
{
savewait--
}

if (savewait == 0)
{
	gamesavetxt = false;
}