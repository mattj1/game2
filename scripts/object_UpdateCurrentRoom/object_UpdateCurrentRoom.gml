{
	var inst = argument0;
	
	with(inst) {	
		if(!is_undefined(currentRoom)) {

			var adjacentRooms = currentRoom[? "adjacentRooms"];
			var numAdjacentRooms = ds_list_size(adjacentRooms)
	
			for(var i = 0; i < numAdjacentRooms; i++) {
				var _room = adjacentRooms[| i];
		
				if(levelRoom_ContainsObject(_room, self)) {
					currentRoom = _room;
					return currentRoom;
					break;
				}
			}
		}
	}

	return pointer_null;
}
