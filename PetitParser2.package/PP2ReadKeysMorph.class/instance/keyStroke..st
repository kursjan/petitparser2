event handling
keyStroke: anEvent
	outputStream nextPutAll: 'event: ', anEvent asString, String cr.
	
	keyStream queueChar: anEvent keyCharacter.