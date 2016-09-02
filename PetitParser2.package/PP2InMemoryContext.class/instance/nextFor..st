accessing
nextFor: aCharacter
	position == readLimit ifTrue: [ ^ false ].
	position := position + 1.
	^ (collection at: position) == aCharacter 
		ifTrue: [  true] 
		ifFalse: [position := position - 1 . false ]