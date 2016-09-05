as yet unclassified
parseOn: context
	| retval |
	^ (retval := node child parseOn: context) isPetit2Success
		ifTrue: [ node block value: (retval at: 1) value: (retval at: 2) value: (retval at: 3)  ]
		ifFalse: [ retval ]