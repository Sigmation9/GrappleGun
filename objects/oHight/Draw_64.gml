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
draw_text(20 - buffer,20,string(climbnum) + "%");
draw_text(20 + buffer,20,string(climbnum) + "%");
draw_text(20,20 - buffer,string(climbnum) + "%");
draw_text(20,20 + buffer,string(climbnum) + "%");
#endregion
draw_set_color(c_white);
draw_text(20,20,string(climbnum) + "%");
}


//draw_set_color(c_white);
//draw_text(RESOLUTION_W * 0.01, RESOLUTION_H * 0.8, string(gamesaved));
//draw_text(RESOLUTION_W * 0.01, RESOLUTION_H * 0.9, string(oPlayer.y) + " / " + string(savey));

if (gamesavetxt == true) && (savewait > 0)
{
draw_set_color(c_white);
draw_text(RESOLUTION_W * 0.01, RESOLUTION_H * 0.9, "GameSaved");
}