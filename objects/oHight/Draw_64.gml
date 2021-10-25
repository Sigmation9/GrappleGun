/// @description Insert description here
// You can write your code in this editor


draw_set_font(fClimb);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if(oPlayer.state != pState.win) && (oPlayer.state != pState.wait)
{
#region Drop Shadow
draw_set_color(c_black);
var buffer = 2;
draw_text(20 - buffer,20,string(floor(Climb * 100) /11346) + "%");
draw_text(20 + buffer,20,string(floor(Climb * 100) /11346) + "%");
draw_text(20,20 - buffer,string(floor(Climb * 100) /11346) + "%");
draw_text(20,20 + buffer,string(floor(Climb * 100) /11346) + "%");
#endregion
draw_set_color(c_white);
draw_text(20,20,string(floor(Climb * 100) /11346) + "%");
}
