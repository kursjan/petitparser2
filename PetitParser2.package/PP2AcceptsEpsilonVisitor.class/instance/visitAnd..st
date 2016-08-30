visiting
visitAnd: node
	^ node propertyAt: #acceptsEpsilon ifAbsent: [ 
		true
	]