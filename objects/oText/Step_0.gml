/// @description Insert description here
// You can write your code in this editor
 
image_alpha = alpha;

if(oTitle.Gamestart == true)
{
	visible = false;
}

if (alpha < 1) && (flicker == true)
{
	alpha += .01;
}

if (alpha > 0) && (flicker == false)
{
	alpha -= .01;
}

if (alpha == 1)
{
	flicker = false;
}

if (alpha == 0)
{
	flicker = true;
}