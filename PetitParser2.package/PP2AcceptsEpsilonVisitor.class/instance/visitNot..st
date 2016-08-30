visiting
visitNot: node
	^ node propertyAt: #acceptsEpsilon ifAbsent: [ 
		true
	]