// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SaveGame(){
	//Create save
	var map = ds_map_create();
	
	map[? "x"] = oPlayer.x;
	map[? "y"] = oPlayer.y;
	map[? "HasSave"] = oGui.HasSave;
	
	//Save To String
	var str = json_encode(map);
	SaveStringToFile("save" + ".sav",str);
	show_debug_message(str);
	
	//epmty the data
	ds_map_destroy(map);
	show_debug_message("Game saved!");
}

function SaveStringToFile(filename, str)
{
	var buffer = buffer_create(string_byte_length(str)+1,buffer_fixed,1);
	buffer_write(buffer,buffer_string,str);
	buffer_save(buffer,filename);
	buffer_delete(buffer);
}