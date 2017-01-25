/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 2A7196D8
/// @DnDArgument : "code" "WallMap = layer_tilemap_get_id("CollisionLayer");$(13_10)layer_set_visible("CollisionLayer",false);		// just in case I've left them on!$(13_10)global.WallMap = WallMap;$(13_10)$(13_10)#macro DIR_STOP		0$(13_10)#macro DIR_UP		1$(13_10)#macro DIR_DOWN		2$(13_10)#macro DIR_LEFT		4$(13_10)#macro DIR_RIGHT	8$(13_10)#macro DIR_DEAD		16$(13_10)$(13_10)"

{
	WallMap = layer_tilemap_get_id("CollisionLayer");
layer_set_visible("CollisionLayer",false);		// just in case I've left them on!
global.WallMap = WallMap;

#macro DIR_STOP		0
#macro DIR_UP		1
#macro DIR_DOWN		2
#macro DIR_LEFT		4
#macro DIR_RIGHT	8
#macro DIR_DEAD		16


}

