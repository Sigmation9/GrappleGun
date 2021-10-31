// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LoadGame(){
	var file = "save" + ".sav";
	if (file_exists(file))
	{
		var json = LoadJSONFromFile(file);
		
		oGui.savex = json[? "x"];
		oGui.savey = json[? "y"];
		oGui.HasSave = json[? "HasSave"];
		
		ds_map_destroy(json);
		return true;
	}
	else
	{
		show_debug_message("No Save Detected")
		return false;
	}

}

function LoadJSONFromFile(filename){
	var buffer = buffer_load(filename);
	var str = buffer_read(buffer,buffer_string);
	buffer_delete(buffer);
	var json = json_decode(str);
	return json;
}