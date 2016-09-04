event handling
keyStroke: anEvent
	outputStream nextPutAll: anEvent keyCharacter asString.
	
	keyStream queueChar: anEvent keyCharacter.