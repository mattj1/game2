{
	var goldAmount = irandom_range(2, 20);
	
	self.gold += goldAmount;
	
	levelRoom_removeObject(other.currentRoom, other);
	instance_destroy(other);
	
	controller.messageTime = 90;
	controller.message = string(goldAmount) + " GOLD!";
}
