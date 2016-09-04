events
queueChar: aCharacter
	closed ifFalse: [  
		accessSemaphore critical: [ queue addLast: aCharacter ]
	]
