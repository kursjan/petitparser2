context interface
indexOf: aCharacter startingAt: position
	^ collection indexOf: aCharacter startingAt: position ifAbsent: [ collection size ]