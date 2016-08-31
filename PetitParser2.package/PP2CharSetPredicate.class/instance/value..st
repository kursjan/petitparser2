evaluating
value: aCharacter
	| index |
	index := aCharacter asInteger.
	index == 0	ifTrue: [ ^ block value: aCharacter ].
	index > 255	ifTrue: [ ^ block value: aCharacter ].
		
	^ classification at: index