visiting
visitPossesiveRepeating: node
	^ node propertyAt: #changesContext ifAbsent: [ 
		self visit: node child
	]