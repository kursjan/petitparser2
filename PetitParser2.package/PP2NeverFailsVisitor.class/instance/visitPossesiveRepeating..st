visiting
visitPossesiveRepeating: node
	^ node propertyAt: #neverFails ifAbsent: [ 
		(node min == 0) ifTrue: [
			true
		] ifFalse: [ 
			self visit: node child
		]
	]
