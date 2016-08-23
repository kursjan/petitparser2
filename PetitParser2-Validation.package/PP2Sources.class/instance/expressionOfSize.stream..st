expressions
expressionOfSize: size stream: stream
	| index rand |
	index := 0.
	rand := Random new.
	
	[index < size] whileTrue: [ 
 		(rand next < 0.1) ifTrue: [  
			| subSize |
			subSize := rand nextInt: (size - index - 1) + 1.
			stream nextPutAll: ' ('.
			self expressionOfSize: subSize stream: stream.
			stream nextPutAll: ') '.
			index := index + subSize.
		] ifFalse: [ 
			stream nextPutAll: (rand nextInt: 100) asString.
			index := index + 1.
		].
	
		(index < size) ifTrue: [ 
 			(rand next < 0.5) 
				ifTrue: [  stream nextPutAll: ' + ' ] 
				ifFalse: [ stream nextPutAll: ' * ' ]
		]
	]