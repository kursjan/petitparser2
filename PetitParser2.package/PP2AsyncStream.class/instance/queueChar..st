events
queueChar: aCharacter
	closed ifFalse: [  queue addLast: aCharacter ]
