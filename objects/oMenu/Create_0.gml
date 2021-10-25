/// @description Insert description here
// You can write your code in this editor

settingsOption = ["Resolution","Master","Sound","Music"];
settingsOptionSelected = 0;

enum menuelementType{
	shift,
	slider
}

ds_menu_audio = CreateMenuPage(
	["Resolution",menuelementType.shift, ChangeResolution,1,["848 x 480","1366 x 768","1600 x 900","1920 x 1080"]],
	["Master",menuelementType.slider, ChangeVolume,1,[0,1]],
	["Sound",menuelementType.slider, ChangeVolume,1,[0,1]],
	["Music",menuelementType.slider, ChangeVolume,1,[0,1]],
)

inputing = false;

audio_group_load(audiogroupMusic);
audio_group_load(audiogroupSFX);