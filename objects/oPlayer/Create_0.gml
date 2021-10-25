 /// @desc
 //camera = camera_create()
 
 hsp = 0;
 vsp = 0;
 walksp = 3;
 walkac = 3;
 hfrcg = 0.5;
 hfrca = 0;
 jumpsp = 6;
 grv =0.2;
 hspfrc = 0.0;
 vspfrc = 0.0;
 
 Start = false;
 
 tilemap = layer_tilemap_get_id("Collision")
 //swich this to wait
 state = pState.wait;
 
 enum pState
 {
	normal,
	swing,
	wait,
	win
 }