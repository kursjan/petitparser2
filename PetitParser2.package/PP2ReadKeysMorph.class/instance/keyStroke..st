event handling
keyStroke: anEvent
	Transcript show: anEvent keyCharacter.
	
	keyStream queueChar: anEvent keyCharacter.