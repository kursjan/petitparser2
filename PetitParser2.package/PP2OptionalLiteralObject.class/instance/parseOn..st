parsing
parseOn: aPP2Context
	^ (aPP2Context peek == character) ifTrue: [ 
		aPP2Context uncheckedNext 
	] ifFalse: [  
		nil
	]