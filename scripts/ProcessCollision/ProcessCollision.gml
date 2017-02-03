{
	/// ProcessCollision(_inst, _dx,_dy, _right,_left, _top,_bottom)
	#macro TILE_SIZE	8		// size of debug tilemap
	#macro TILE_SHIFT   3		// 1<<5 = 8
	var _inst = argument0;
	var _dx = argument1;
	var _dy = argument2;
	var _right = argument3;
	var _left = argument4;
	var _top = argument5;
	var _bottom = argument6;
	var COLLISION_DEBUG=false;
	var DEBUG_TILE = 2;
	with( _inst )
	{
		var WallMap = global.WallMap;
		
		// Now move and do collision checks.
		x += _dx;
		y += _dy;
		if( _dx < 0 ){
			var tx = (x-_left)>>TILE_SHIFT;		// check right edge
			var ty1 = ((y+_bottom)>>TILE_SHIFT);
			var ty2 = ((y-_top)>>TILE_SHIFT);
			/*		if( COLLISION_DEBUG ){
				tilemap_set(DebugMap, DEBUG_TILE, tx,ty1);
				tilemap_set(DebugMap, DEBUG_TILE, tx,ty2);			
			}*/
			// collision data never has flips etc...
			var tile1 = tilemap_get(WallMap, tx,ty1 )& tile_index_mask;
			var tile2 = tilemap_get(WallMap, tx,ty2 )& tile_index_mask;
			if(( tile1==1 ) || (tile2==1)) {
				x = (x&~(TILE_SIZE-1))+_left;
			}
		}
		// DOWN
		if( _dy > 0 ){
			var tx1 = (x+(_right-0))>>TILE_SHIFT;		// check right edge
			var tx2 = (x-(_left-0))>>TILE_SHIFT;		// check right edge
			var ty = ((y+_bottom)>>TILE_SHIFT);
	/*		if( COLLISION_DEBUG ){
				tilemap_set(DebugMap, DEBUG_TILE, tx1,ty);
				tilemap_set(DebugMap, DEBUG_TILE, tx2,ty);
			}
	*/		
			// collision data never has flips etc...
			var tile1 = tilemap_get(WallMap, tx1,ty )& tile_index_mask;
			var tile2 = tilemap_get(WallMap, tx2,ty )& tile_index_mask;
			if(( tile1==1 ) || (tile2==1)) {
				y = (ty<<TILE_SHIFT)- _bottom - 1;
			}
		}
		if( _dy < 0 ){
			var tx1 = (x+(_right-0))>>TILE_SHIFT;		// check right edge
			var tx2 = (x-(_left-0))>>TILE_SHIFT;		// check right edge
			var ty = ((y-_top)>>TILE_SHIFT);
	/*		if( COLLISION_DEBUG ){
				tilemap_set(DebugMap, DEBUG_TILE, tx1,ty);
				tilemap_set(DebugMap, DEBUG_TILE, tx2,ty);
			}
	*/		
			// collision data never has flips etc...
			var tile1 = tilemap_get(WallMap, tx1,ty )& tile_index_mask;
			var tile2 = tilemap_get(WallMap, tx2,ty )& tile_index_mask;
			if(( tile1==1 ) || (tile2==1)) {
				//y = (ty<<TILE_SHIFT)+TILE_SIZE+_top+1;
				y = (y & ~(TILE_SIZE-1)) + _top;
			}
			//if(( tile1!=0 ) || (tile2!=0)) {
			//	x = (x&~(TILE_SIZE-1))+_left;
			//}
		}
			// RIGHT
		if( _dx > 0 ){
			var tx = (x+_right)>>TILE_SHIFT;		// check right edge
			var ty1 = ((y+_bottom)>>TILE_SHIFT);
			var ty2 = ((y-_top)>>TILE_SHIFT);
	/*		if( COLLISION_DEBUG ){
				tilemap_set(DebugMap, DEBUG_TILE, tx,ty1);
				tilemap_set(DebugMap, DEBUG_TILE, tx,ty2);
			}
	*/		
			// collision data never has flips etc...
			var tile1 = tilemap_get(WallMap, tx,ty1 )& tile_index_mask;
			var tile2 = tilemap_get(WallMap, tx,ty2 )& tile_index_mask;
			if(( tile1==1 ) || (tile2==1)) {
				//x = (tx<<TILE_SHIFT)-TILE_SIZE+(TILE_SIZE-_right);
				x = (tx<<TILE_SHIFT)-_right - 1;
			}
		}
	}/**/
}
