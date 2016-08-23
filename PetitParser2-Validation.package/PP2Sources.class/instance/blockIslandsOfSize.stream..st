seas
blockIslandsOfSize: size stream: stream
	| index rand |
	index := 0.
	rand := Random new.
	
	[index < size] whileTrue: [ 
 		((size - index >= 2) and: [(rand next < 0.1)]) ifTrue: [  
			| subSize |
			subSize := (0 max: (size - index - 2)).
			subSize > 0 ifTrue: [ subSize := rand nextInt: subSize ].
			stream nextPut: ${.
			self blockIslandsOfSize: subSize stream: stream.
			stream nextPut: $}.
			index := index + subSize  + 2.
		] ifFalse: [ 
			stream nextPut: $. .
			index := index + 1.
		].
	]