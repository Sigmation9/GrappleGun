/// @description Insert description here
// You can write your code in this editor
draw_self();

if (state == pState.swing) draw_line_width_color(grapplex,grappley,oGrapple.x,oGrapple.y,2,make_colour_rgb(220, 200, 180),make_colour_rgb(200, 180, 150));

if (state == pState.normal) && (instance_exists(oHook))
{
draw_line_width_color(oHook.x,oHook.y,oGrapple.x,oGrapple.y,2,make_colour_rgb(220, 200, 180),make_colour_rgb(200, 180, 150));
}

if (instance_exists(oHook2))
{
draw_line_width_color(oHook2.x,oHook2.y,oGrapple.x,oGrapple.y,2,make_colour_rgb(220, 200, 180),make_colour_rgb(200, 180, 150));
}


