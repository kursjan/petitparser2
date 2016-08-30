visiting
visitPossesiveRepeating: node
	^ node propertyAt: #acceptsEpsilon ifAbsent: [ 
		(node min == 0) ifTrue: [
			true
		] ifFalse: [ 
			self visit: node child
		]
	]
