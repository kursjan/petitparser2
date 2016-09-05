parsing
parseOn: context
	| retval |
	^ (retval := node child parseOn: context) isPetit2Success
		ifTrue: [ node block value: (retval at: 1) value: (retval at: 2)  ]
		ifFalse: [ retval ]