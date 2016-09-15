visiting
visitPossesiveRepeating: node
	^ node propertyAt: #isNullable ifAbsent: [ 
		(node min == 0) ifTrue: [
			true
		] ifFalse: [ 
			self visit: node child
		]
	]
