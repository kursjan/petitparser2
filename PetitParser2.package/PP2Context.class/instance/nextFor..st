stream mimicry
nextFor: aCharacter
	^ (stream atEnd: position) not ifTrue: [ 
		position := position + 1.
		^ ((stream atPosition: position) == aCharacter )
			ifTrue: [ true ]
			ifFalse:[ position := position - 1 . false ].
	] ifFalse: [  
		false
	]